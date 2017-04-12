using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

public partial class Distribut : System.Web.UI.Page
{
    public string json = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ErrIsertForm"] = "";//משתנה שיציג הודעה ללקוח אם סיסמה או שם משתמש קיימים
        if (Session["userNameT"] == null)
        {
            Response.Redirect("loginT.aspx");
        }
        string subject = "", diff = "", kita="";
        int numof;
        string sqlkita = "SELECT DISTINCT kita FROM users;";
        DataTable dtkita = MyAdoHelper.ExecuteDataTable("db1.mdb", sqlkita); //יונתן תציל אותי ותעביר לפרונט
        json = Json(dtkita);
        if (Request.Form["submit"] != null)
        {
            subject = Request.Form["subject"];
            numof = int.Parse(Request.Form["numof"]);
            diff = Request.Form["diff"];
            kita= Request.Form["kita"];
            if (subject == "0" || numof == 0 || diff == "0")
            {
                Session["ErrIsertForm"] = "נתונים לא מולאו כשורה";
            }
            else
            {
                string fileName7 = "db1.mdb";       //SQLSTUF START
                string sql2 = "select * from users WHERE kita='"+kita+"';";
                DataTable dt1;
                DataTable dtu;
                DataTable dtat;
                DataTable dtatu;
                dt1 = MyAdoHelper.ExecuteDataTable(fileName7, sql2);//users
                int i = 0,x,f,rand;
                Random rnd = new Random();
                string ID,sql1,sql3,sql4,sql5,sql6;
                string TALMIDMAAGARSQL;
                bool found = false;
                sql3 = "select * from TAT" + subject + " WHERE diff='" + diff + "';"; //מאגר
                dtat = MyAdoHelper.ExecuteDataTable(fileName7, sql3);
                if (dtat.Rows.Count > 0)
                {
                    foreach (DataRow Row in dt1.Rows)  /////////foreach////////////
                    {
                        ID = dt1.Rows[i][5].ToString();
                        sql1 = "selcet * from ID" + ID + " WHERE subjectID='" + subject + "';";   //טבלה אישית
                        dtu = MyAdoHelper.ExecuteDataTable(fileName7, sql1);
                        if (dtu.Rows[0][3].ToString() == diff) //אם כבר קיימת רשומה וטבלה והכל כיף
                        {
                            if (dtat.Rows.Count <= numof)
                            {
                                //sendthemall
                                sql5 = "select * from TAT" + subject + "_" + ID + ";";  //מאגר אישי
                                dtatu = MyAdoHelper.ExecuteDataTable(fileName7, sql5);
                                x = 0;
                                f = 0;
                                while (x < dtat.Rows.Count)//עבור כל תרגיל
                                {
                                    while (f < dtatu.Rows.Count) //בדיקה האם התרגיל קיים עובר על כל המאגר האישי
                                    {
                                        if (dtat.Rows[x][0].ToString() == dtatu.Rows[f][0].ToString())
                                        {
                                            found = true;
                                            break; //תפסיק את החיפוש
                                        }
                                        f++;
                                    }
                                    if (!found)
                                    {
                                        sql6 = "insert into TAT" + subject + "_" + ID + " (ID, location, answ, iscomplete)values('" + dtat.Rows[x][0].ToString() + "'," + dtat.Rows[x][1].ToString() + "','" + dtat.Rows[x][2].ToString() + "','0');";
                                        MyAdoHelper.DoQuery(fileName7, sql6);
                                    }
                                    x++;
                                }

                            }
                            else
                            {
                                //random
                                sql5 = "select * from TAT" + subject + "_" + ID + ";";  //מאגר אישי
                                dtatu = MyAdoHelper.ExecuteDataTable(fileName7, sql5);
                                x = 0;
                                f = 0;
                                while (x < numof)//עבור כל תרגיל
                                {
                                    sql5 = "select * from TAT" + subject + "_" + ID + ";";  //מאגר אישי מעודכן למניעת כפילויות
                                    dtatu = MyAdoHelper.ExecuteDataTable(fileName7, sql5);
                                    rand = rnd.Next(0, numof);//אקראי, הגרלה
                                    while (f < dtatu.Rows.Count) //בדיקה האם התרגיל קיים עובר על כל המאגר האישי
                                    {
                                        if (dtat.Rows[rand][0].ToString() == dtatu.Rows[f][0].ToString())
                                        {
                                            rand = rnd.Next(0, numof); //אם נמצא, תרגיל חדש
                                            f = 0;
                                        }
                                        f++;
                                    }
                                    sql6 = "insert into TAT" + subject + "_" + ID + " (ID, location, answ, iscomplete)values('" + dtat.Rows[rand][0].ToString() + "'," + dtat.Rows[rand][1].ToString() + "','" + dtat.Rows[rand][2].ToString() + "','0');";
                                    MyAdoHelper.DoQuery(fileName7, sql6);
                                    x++;
                                }
                                i++;
                            }
                        }
                        else if (dtu.Rows[0][3].ToString() != diff) //אם קיימת רשומה אבל ברמה שונה, נדלג.
                        {
                            i++;
                        }
                        else //אם אין טבלה ורשומה, ניצור חדשה.
                        {
                            TALMIDMAAGARSQL = "CREATE TABLE TAT" + subject + "_" + ID + " (ID varchar(255), location varchar(255), answ varchar(255), iscomplete bit);";
                            MyAdoHelper.DoQuery(fileName7, TALMIDMAAGARSQL);//טבלה נוצרה
                            Session["ErrIsertForm"] += "טבלה נוצרה";
                            if (dtat.Rows.Count <= numof)
                            {
                                sql4 = "insert into ID" + ID + " (subject, subjectID, ctargil, diff, master)values('" + xpstuf.IDsubject(subject) + "','" + subject + "','" + dtat.Rows.Count.ToString() + "','" + diff + "','0';";
                                //sendthemall
                                x = 0;
                                while (x < dtat.Rows.Count)//עבור כל תרגיל
                                {
                                    sql6 = "insert into TAT" + subject + "_" + ID + " (ID, location, answ, iscomplete)values('" + dtat.Rows[x][0].ToString() + "','" + dtat.Rows[x][1].ToString() + "','" + dtat.Rows[x][2].ToString() + "','0');";
                                    MyAdoHelper.DoQuery(fileName7, sql6);
                                    x++;
                                }
                            }
                            else
                            {
                                x = 0;
                                sql4 = "insert into ID" + ID + " (subject, subjectID, ctargil, diff, master)values('" + xpstuf.IDsubject(subject) + "','" + subject + "','" + numof + "','" + diff + "','0';";
                                //random
                                sql5 = "select * from TAT" + subject + "_" + ID + ";";  //מאגר אישי
                                dtatu = MyAdoHelper.ExecuteDataTable(fileName7, sql5);
                                x = 0;
                                f = 0;
                                while (x < numof)//עבור כל תרגיל
                                {
                                    sql5 = "select * from TAT" + subject + "_" + ID + ";";  //מאגר אישי מעודכן למניעת כפילויות
                                    dtatu = MyAdoHelper.ExecuteDataTable(fileName7, sql5);
                                    rand = rnd.Next(0, numof);//אקראי, הגרלה
                                    while (f < dtatu.Rows.Count) //בדיקה האם התרגיל קיים עובר על כל המאגר האישי
                                    {
                                        if (dtat.Rows[rand][0].ToString() == dtatu.Rows[f][0].ToString())
                                        {
                                            rand = rnd.Next(0, numof); //אם נמצא, תרגיל חדש
                                            f = 0;
                                        }
                                        f++;
                                    }
                                    sql6 = "insert into TAT" + subject + "_" + ID + " (ID, location, answ, iscomplete)values('" + dtat.Rows[rand][0].ToString() + "'," + dtat.Rows[rand][1].ToString() + "','" + dtat.Rows[rand][2].ToString() + "','0');";
                                    MyAdoHelper.DoQuery(fileName7, sql6);
                                    x++;
                                }
                            }
                            i++;
                        }

                    }
                }
                else
                {
                    Session["ErrIsertForm"] = "מאגר התרגילים ריק.";
                }
           }

        }
       
    }
    public string Json(DataTable table)
    {
        {
            string JSONString = string.Empty
                ;
            JSONString = Newtonsoft.Json.JsonConvert.SerializeObject(new { sub = table });
            return JSONString;
        }
    }

}


