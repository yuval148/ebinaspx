using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

public partial class upload : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ErrIsertForm"] = "";//משתנה שיציג הודעה ללקוח אם סיסמה או שם משתמש קיימים
        if (Session["userNameT"] == null)
        {
            Response.Redirect("loginT.aspx");
        }
        string subject = "", answ = "", diff = "", path, location,sqldo; // חייב תיקון דחוף!                                                                // יגריל וייצור טבלאת תלמיד וישים תרגיגילים מהמאגר בנושא
        if (Request.Form["btnUpload"] != null)
        {
            subject = Request.Form["subject"];
            answ = Request.Form["answ"];
            diff = Request.Form["diff"];
            Session["ErrIsertForm"] = diff + " " + answ + " " + subject;
            path = "~/t/" + subject + "/";

            if (subject == "0" || answ == "" || diff == "0")
            {
                Session["ErrIsertForm"] = "נתונים לא מולאו כשורה";
                // Response.Redirect("form.aspx");
            }
            else
            {
                if (!IsPostBack)
                {
                    path = "~/t/" + subject + "/";
                    string[] filePaths = Directory.GetFiles(Server.MapPath(path));
                    List<ListItem> files = new List<ListItem>();
                    foreach (string filePath in filePaths)
                    {
                        string fileName = Path.GetFileName(filePath);
                        files.Add(new ListItem(fileName, path + fileName));
                    }

                }
                else
                {
                    path = "~/t/" + subject + "/";
                }
                string fileName7 = "db1.mdb";       //SQLSTUF START
                string sql = "select * from TAT" + subject;
                DataTable dtat;
                dtat = MyAdoHelper.ExecuteDataTable(fileName7, sql);
                string sql2 = "select * from users ";
                DataTable dt1;
                dt1 = MyAdoHelper.ExecuteDataTable(fileName7, sql2);
                int IDtemp;
                string ID;
                if (dtat.Rows.Count == 0)
                {
                    ID = subject + "0";
                }
                else
                {
                    string lastID = dtat.Rows[dtat.Rows.Count - 1][0].ToString();
                    IDtemp = Int32.Parse(lastID);
                    IDtemp++;
                    ID = IDtemp.ToString();
                }                             // SQL STUF END 
                string uploadFolder = Request.PhysicalApplicationPath + "t/" + subject + "/";
                if (FileUpload1.HasFile)
                {
                    string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    string extension = Path.GetExtension(FileUpload1.PostedFile.FileName);
                    FileUpload1.SaveAs(uploadFolder + ID + extension);
                    location = "t/" + ID + extension;
                    sqldo = "insert into TAT" + subject + "(ID, location, answ, diff)values('" + ID + "','" + location + "','" + answ + "','" + diff + "');";
                    MyAdoHelper.DoQuery(fileName7, sqldo);
                    Response.Redirect(Request.Url.AbsoluteUri);
                }

                
                //foreach (DataRow Row in dt1.Rows)
                //{

                    //ID = dt1.Rows[i]["ID"].ToString();
                   //sql = "insert into ID" + ID + "(subject, subjectID, tat, tatID, link, cou, ctargil, xp, iscomplete)values('" + subject + "','" + xpstuf.subjectID(subject) + "','" + tat + "','" + "0" + "','" + link + "','" + "0" + "','" + ctargil.ToString() + "'," + xp + "," + iscomplete + ")";
                    //MyAdoHelper.DoQuery(fileName, sql);
                    //i++;
                //}
                //sring MAAGARSQL = "CREATE TABLE TAT" + TAT + " (ID varchar(255), location varchar(255), answ varchar(255), diff varchar(255));";
                //sring TALMIDMAAGARSQL = "CREATE TABLE TAT" + TAT + "-"+ID+" (ID varchar(255), location varchar(255), answ varchar(255), iscomplete bit);";
            }

        }
       
    }
   
}


