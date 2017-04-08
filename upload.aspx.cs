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

        string subject = "", answ = "", diff = "", pic = ""; // חייב תיקון דחוף!                                                                // יגריל וייצור טבלאת תלמיד וישים תרגיגילים מהמאגר בנושא
        bool iscomplete = false;
        if (Request.Form["submit"] != null)
        {
            subject = Request.Form["subject"];
            answ = Request.Form["answ"];
            diff = Request.Form["diff"];
            pic = Request.Form["pic"];

            if (subject == "0" || answ == "" || diff == "0" || pic == "")
            {
                Session["ErrIsertForm"] = "נתונים לא מולאו כשורה";
                // Response.Redirect("form.aspx");
            }
            else
            {
                //check if TAT3 IS EXIST, IF exixst 
                string fileName = "db1.mdb";
                string sql;
                string sql2 = "select * from users ";
                DataTable dt1;
                dt1 = MyAdoHelper.ExecuteDataTable(fileName, sql2);
                int i = 0;
                foreach (DataRow Row in dt1.Rows)
                {

                    //ID = dt1.Rows[i]["ID"].ToString();
                   //sql = "insert into ID" + ID + "(subject, subjectID, tat, tatID, link, cou, ctargil, xp, iscomplete)values('" + subject + "','" + xpstuf.subjectID(subject) + "','" + tat + "','" + "0" + "','" + link + "','" + "0" + "','" + ctargil.ToString() + "'," + xp + "," + iscomplete + ")";
                    //MyAdoHelper.DoQuery(fileName, sql);
                    //i++;
                }
                //sring MAAGARSQL = "CREATE TABLE TAT" + TAT + " (ID varchar(255), location varchar(255), answ varchar(255), diff varchar(255));";
                //sring TALMIDMAAGARSQL = "CREATE TABLE TAT" + TAT + "-"+ID+" (ID varchar(255), location varchar(255), answ varchar(255), iscomplete bit);";
            }

        }
        if (!IsPostBack)
        {
            string path = "~/t/" + subject + "/";
            string[] filePaths = Directory.GetFiles(Server.MapPath(path));
            List<ListItem> files = new List<ListItem>();
            foreach (string filePath in filePaths)
            {
                string fileName = Path.GetFileName(filePath);
                files.Add(new ListItem(fileName, path + fileName));
            }
            GridView1.DataSource = files;
            GridView1.DataBind();
        }
    }
    protected void Upload(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
            FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Images/") + fileName);
            Response.Redirect(Request.Url.AbsoluteUri);
        }
    }
}


