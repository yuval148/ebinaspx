using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class maagarT : System.Web.UI.Page
{
    public string json = "", json2 = "", json3 = "",ID, errform;
    public string userPass, userName;

    protected void Page_Load()
    {
        if (Session["userNameT"] == null)
        {
            Response.Redirect("loginT.aspx");
        }
            string fileName = "db1.mdb"; //שם המסד
            string dd, mm, yyyy, drm , subject;
        if (Request.Form["submit"] != null)
        {
            errform = "";
            dd = Request.Form["dd"];
            mm = Request.Form["mm"];
            yyyy = Request.Form["yyyy"];
            subject = Request.Form["subject"];
            if (dd == "0" || mm == "0" || yyyy == "0" || subject == "0")
            {
                errform = "הטופס לא מולא כשורה.";
            }
            else
            {
                jsn1.Style["opacity"] = "100";
                drm = dd + "/" + mm + "/" + yyyy;
                DateTime dateform = DateTime.ParseExact(drm, "dd/MM/yyyy", null);
                DataTable tat, result, users;
                result = new DataTable();
                result.Columns.Add("ID", typeof(string));
                result.Columns.Add("iscomplete", typeof(bool));
                result.Columns.Add("datec", typeof(string));
                result.Columns.Add("exp", typeof(string));
                result.Columns.Add("byy", typeof(string));
                result.Columns.Add("name", typeof(string));
                result.Columns.Add("kita", typeof(string));
                result.Columns.Add("pic", typeof(string));
                string sql1 = "SELECT * FROM TAT" + subject + ";";
                tat = MyAdoHelper.ExecuteDataTable(fileName, sql1); //TAT X
                string sql2 = "SELECT * FROM users;";
                users = MyAdoHelper.ExecuteDataTable(fileName, sql2); //users
                string IDu, IDt, datec, sql3, sql4;
                if (tat.Rows.Count > 0)
                {
                    for (int ti = 0; ti < tat.Rows.Count; ti++)
                    {
                        IDt = tat.Rows[ti]["ID"].ToString(); //מספר סידורי של תרגיל
                        for (int ui = 0; ui < users.Rows.Count; ui++)
                        {
                            IDu = users.Rows[ui]["ID"].ToString();//ת.ז תלמיד
                            sql3 = "SELECT * FROM ID" + IDu + " WHERE subjectID='" + subject + "';";
                            if (MyAdoHelper.IsExist(fileName, sql3)) //בדיקה האם הנושא קיים אצל התלמיד
                            {
                                sql4 = "SELECT * FROM TAT" + subject + "_" + IDu + " WHERE ID='" + IDt + "';";
                                if (MyAdoHelper.IsExist(fileName, sql4))//בדיקה האם התרגיל נמצא במאגר האישי
                                {
                                    DataTable temp = MyAdoHelper.ExecuteDataTable(fileName, sql4);
                                    datec = temp.Rows[0]["datec"].ToString();
                                    DateTime datc = DateTime.ParseExact(datec, "dd/MM/yyyy", null);
                                    if (dateform <= datc) //אם תאריך יצירה נמצא בתוך התאריך המבוקש
                                    {
                                        DataRow to = result.NewRow();
                                        to["ID"] = temp.Rows[0]["ID"].ToString();
                                        to["iscomplete"] = temp.Rows[0]["iscomplete"].ToString();
                                        to["datec"] = temp.Rows[0]["datec"].ToString();
                                        to["exp"] = temp.Rows[0]["exp"].ToString();
                                        to["byy"] = temp.Rows[0]["byy"].ToString();
                                        to["name"] = users.Rows[ui]["name"].ToString();
                                        to["kita"] = users.Rows[ui]["kita"].ToString();
                                        to["pic"] = users.Rows[ui]["pic"].ToString();
                                        result.Rows.Add(to);//הכנסת השורה לריזולטס.
                                    }
                                }
                            }
                        }
                    }
                    json = Json(result);
                    json2 = Json(tat);
                    errform = "הפעולה הושלמה בהצלחה.";
                }
                else
                {
                    errform = "לא נמצאו תרגילים במאגר המבוקש.";
                }
            }

        }
    }
    public string Json(DataTable table)
    {
        {
            string JSONString = string.Empty;
            JSONString = Newtonsoft.Json.JsonConvert.SerializeObject(new { stu = table });
            return JSONString;
        }
    }

}


