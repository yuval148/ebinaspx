using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class tatmT : System.Web.UI.Page
{
    public string json = "", json2 = "", json3 = "",ID, json4;
    public string userPass, userName;

    protected void Page_Load()
    {
        if (Session["userNameT"] == null)
        {
            Response.Redirect("loginT.aspx");
        }
        else
        { 
            Session["errform"] = "";
           string sql = "";
            string fileName = "db1.mdb"; //שם המסד

            sql = "SELECT * FROM users";//USERS
            DataTable users = MyAdoHelper.ExecuteDataTable(fileName, sql);
            json = Json(users);
            if (Request.Form["submit"] != null)
            {

                string subject = Request.Form["subject"];
                ID = Request.Form["ID"];
                if (subject == "0")
                {
                    Session["errform"] = "נא להזין נושא.";
                }
                else
                {
                    string sql3 = "SELECT * FROM ID" + ID + " WHERE subjectID='" + subject + "';"; //ID2345
                    if (MyAdoHelper.IsExist(fileName, sql3))
                    {
                        form.Style["opacity"] = "0";
                        stuopc.Style["opacity"] = "100";
                        string sql4 = "SELECT * FROM TAT" + subject + "_" + ID + ";"; //TAT3_123456
                        DataTable dtat = MyAdoHelper.ExecuteDataTable(fileName, sql4);
                        json2 = Json(dtat);
                        string sql2 = "SELECT * FROM users WHERE ID='" + ID + "';"; //USERS
                        DataTable dtu = MyAdoHelper.ExecuteDataTable(fileName, sql2);
                        json3 = Json(dtu);
                        DataTable dtid = MyAdoHelper.ExecuteDataTable(fileName, sql3);
                        json4 = Json(dtid);

                    }
                    else
                    {
                        Session["errform"] = "המקצוע המבוקש לא נמצא אצל התלמיד.";
                    }
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


