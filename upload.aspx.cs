using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class upload : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ErrIsertForm"] = "";//משתנה שיציג הודעה ללקוח אם סיסמה או שם משתמש קיימים

        string subject = "", tat = "", link = "", team = "", ctargil = "", ID; ;
        int xp;
        bool iscomplete = false;
        if (Request.Form["submit"] != null)
        {
            subject = Request.Form["subject"];
            tat = Request.Form["tat"];
            link = Request.Form["link"];
            team = Request.Form["team"];
            ctargil = Request.Form["ctargil"];
            xp = Int32.Parse(Request.Form["xp"]);

            if (subject == "" || tat == "" || ctargil == "")
            {
                Session["ErrIsertForm"] = "נתונים לא מולאו כשורה";
                // Response.Redirect("form.aspx");
            }
            else
            {

                string fileName = "db1.mdb";
                string sql;
                string sql2 = "select * from table1";
                DataTable dt;
                dt = MyAdoHelper.ExecuteDataTable(fileName, sql2);
                int i = 0;
                foreach (DataRow Row in dt.Rows)
                {

                    ID = dt.Rows[i]["ID"].ToString();
                    sql = "insert into ID" + ID + "(subject, tat, link, cou, ctargil, xp, iscomplete)values('" + subject + "','" + tat + "','" + link + "','" + "0" + "','" + ctargil.ToString() + "'," + xp + "," + iscomplete + ")";
                    MyAdoHelper.DoQuery(fileName, sql);
                    i++;
                }
                    // Response.Redirect("form.aspx");
                    //ring sql2 = "CREATE TABLE ID" + ID + " (subject varchar(255), tat varchar(255), link varchar(255), cou varchar(255), ctargil varchar(255), xp int, iscomplete bit);"; //TODO: FIX.
                    //AdoHelper.DoQuery(fileName, sql2);
                   //ession["ErrIsertForm"] += "<br> ההרשמה בוצעה בהצלחה";
                }

            }
        }
    }
       
    
