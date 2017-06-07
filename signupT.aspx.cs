using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class signupT : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userNameT"] == null)
        {
            Response.Redirect("loginT.aspx");
        }
    }
    protected void submit(Object sender, EventArgs e)
    {
        Session["ErrIsertForm"] = "";
        string name = "", userpass = "", username = "", ID = "";
            name = Request.Form["name"];
            username = Request.Form["username"];
            userpass = Request.Form["userpass"];
            ID = Request.Form["ID"];


            if (name == "" || userpass == "" || ID=="" || username=="")
            {
                Session["ErrIsertForm"] = "נתונים לא מולאו כשורה";
                // Response.Redirect("form.aspx");
            }
            else
            {

                string fileName7 = "db1.mdb";
                string tableName = "morim";
                string sql;
                string sql3;



                sql = "select * from " + tableName + " where username='" + username + "'";
                sql3 = "select * from " + tableName + " where ID='" + ID + "'";
                // string path = Server.MapPath("App_Data/db1.mdb");

                if (MyAdoHelper.IsExist(fileName7, sql)) //שימוש בפעולה לבדיקה אם המשתמש קיים 
                {
                    Session["ErrIsertForm"] = "  משתמש  קיים";
                    // Response.Redirect("form.aspx");

                }
                else if (MyAdoHelper.IsExist(fileName7, sql3))
                {
                    Session["ErrIsertForm"] = "  משתמש  קיים";
                }
                else if (xpstuf.ValidateID(ID) == xpstuf.TzStatus.R_NOT_VALID || xpstuf.ValidateID(ID) == xpstuf.TzStatus.R_ELEGAL_INPUT)
                {
                    Session["ErrIsertForm"] = "מספר ת.ז לא תקין";
                }

                else
                {
                    string pic;
                    string uploadFolder = Request.PhysicalApplicationPath + "/media/pic/";
                    if (FileUpload1.HasFile)
                    {
                        string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                        string extension = Path.GetExtension(FileUpload1.PostedFile.FileName);
                        FileUpload1.SaveAs(uploadFolder + ID + extension);
                        pic = "media/pic/" + ID + extension;
                        sql = "insert into morim(username, userpass, name, ID, pic)values('" + username + "','" + userpass + "','" + name + "','" + ID + "','" + pic + "');";
                        MyAdoHelper.DoQuery(fileName7, sql);
                        Response.Redirect(Request.Url.AbsoluteUri);
                        Session["ErrIsertForm"] = "ההרשמה בוצעה בהצלחה";
                    }
                    else if (!FileUpload1.HasFile)
                    {
                        sql = "insert into morim(username, userpass, name, ID, pic)values('" + username + "','" + userpass + "','" + name + "','" + ID + "','" + "media/pic/123456782T.png" + "');";
                        MyAdoHelper.DoQuery(fileName7, sql);
                        Session["ErrIsertForm"] = "ההרשמה בוצעה בהצלחה";
                    }

                }

            }
    }
}       
    
