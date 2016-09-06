using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class signup : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ErrIsertForm"] = "";//משתנה שיציג הודעה ללקוח אם סיסמה או שם משתמש קיימים

        string name = "", userPass = "", userName = "", team = "", ID="";
        int xpp = 0;
        if (Request.Form["submit"] != null)
        {
            name = Request.Form["name"];
            userName = Request.Form["userName"];
            userPass = Request.Form["userPass"];
            team = Request.Form["team"];
            ID = Request.Form["ID"];

            if (name == "" || userPass == "" || ID=="")
            {
                Session["ErrIsertForm"] = "נתונים לא מולאו כשורה";
                // Response.Redirect("form.aspx");
            }
            else
            {

                string fileName = "db1.mdb";
                string tableName = "Table1";
                string sql;
                string sql3;


               
                sql = "select * from " + tableName + " where name='" + name + "'";
                sql += " AND userPass ='" + userPass + "'";
                sql3 = "select * from " + tableName + " where ID='" + ID + "'";
                // string path = Server.MapPath("App_Data/db1.mdb");

                if (MyAdoHelper.IsExist(fileName, sql)) //שימוש בפעולה לבדיקה אם המשתמש קיים 
                {
                    Session["ErrIsertForm"] = "  משתמש  או סיסמה קיימים";
                    // Response.Redirect("form.aspx");

                }
                else if (MyAdoHelper.IsExist(fileName, sql3))
                {
                    Session["ErrIsertForm"] = "  משתמש  או סיסמה קיימים";
                }

                else
                {
                    sql = "insert into table1 (name,userName,userPass,team,xpp, ID)values('" + name + "','" + userName + "','" + userPass + "','" + team + "','" + xpp + "','" + ID + "')";
                    Session["ErrIsertForm"] = "   שלום  " + name + " מקבוצת " + team + ". יש לך " + xpp + " נקודות";
                    MyAdoHelper.DoQuery(fileName, sql);
                    // Response.Redirect("form.aspx");
                    string sql2 = "CREATE TABLE ID" + ID + " (subject varchar(255), tat varchar(255), link varchar(255), cou varchar(255), ctargil varchar(255), xp int, iscomplete bit);"; //TODO: FIX.
                    MyAdoHelper.DoQuery(fileName, sql2);
                    Session["ErrIsertForm"] += "<br> ההרשמה בוצעה בהצלחה";
                }

            }
        }
    }
}       
    
