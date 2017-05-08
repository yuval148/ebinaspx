using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class signup : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ErrIsertForm"] = "";//משתנה שיציג הודעה ללקוח אם סיסמה או שם משתמש קיימים
        string name = "", userPass = "", userName = "", team = "", kita = "", ID = "";
        int xpp = 0;
        if (Request.Form["submit"] != null)
        {
            name = Request.Form["name"];
            userName = Request.Form["userName"];
            userPass = Request.Form["userPass"];
            team = Request.Form["team"];
            kita = Request.Form["kita"];
            ID = Request.Form["ID"];

            if (name == "" || userPass == "" || ID=="")
            {
                Session["ErrIsertForm"] = "נתונים לא מולאו כשורה";
                // Response.Redirect("form.aspx");
            }
            else
            {

                string fileName = "db1.mdb";
                string tableName = "users";
                string sql;
                string sql3;


               
                sql = "select * from " + tableName + " where name='" + name + "'";
                sql += " AND userPass ='" + userPass + "'";
                sql3 = "select * from " + tableName + " where ID='" + ID + "'";
                // string path = Server.MapPath("App_Data/db1.mdb");

                if (MyAdoHelper.IsExist(fileName, sql)) //שימוש בפעולה לבדיקה אם המשתמש קיים 
                {
                    Session["ErrIsertForm"] = "משתמש קיים";
                    // Response.Redirect("form.aspx");

                }
                else if (MyAdoHelper.IsExist(fileName, sql3))
                {
                    Session["ErrIsertForm"] = "משתמש קיים";
                }
                else if(xpstuf.ValidateID(ID) == xpstuf.TzStatus.R_NOT_VALID || xpstuf.ValidateID(ID) == xpstuf.TzStatus.R_ELEGAL_INPUT)
                {
                    Session["ErrIsertForm"] = "מספר ת.ז לא תקין";
                }

                else
                {
                    sql = "insert into users(name, userName, userPass, team, xpp, ID, kita, pic)values('" + name + "','" + userName + "','" + userPass + "','" + team + "','" + xpp + "','"+ID + "','" + kita  +"','" + "123456782.png" + "');";
                    MyAdoHelper.DoQuery(fileName, sql);
                    Session["ErrIsertForm"] = "   שלום  " + name + " מקבוצת " + team + ". יש לך " + xpp + " נקודות";
                    // Response.Redirect("form.aspx");
                    string sql2 = "CREATE TABLE ID" + ID + " (subject varchar(255), subjectID varchar(255), ctargil varchar(255), diff varchar(255), cou varchar(255));";
                    MyAdoHelper.DoQuery(fileName, sql2);
                    string sql5 = "CREATE TABLE GRA" + ID + " (shlita int, datee varchar(255));";
                    MyAdoHelper.DoQuery(fileName, sql5);
                    Session["ErrIsertForm"] += "<br> ההרשמה בוצעה בהצלחה";
                }

            }
        }
    }
    protected void Upload(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
            FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Profiles/") + fileName);
            Response.Redirect(Request.Url.AbsoluteUri);
        }
    }

}

