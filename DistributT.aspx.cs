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
        DateTime today = DateTime.Today;
        string datec = today.ToString("dd/MM/yyyy");
        if (Session["userNameT"] == null)
        {
            Response.Redirect("loginT.aspx");
        }
        string subject = "", diff = "", kita="", numof1;
        string dd, mm, yyyy, exp;
        int numof;
        string sqlkita = "SELECT DISTINCT kita FROM users;";
        DataTable dtkita = MyAdoHelper.ExecuteDataTable("db1.mdb", sqlkita); //יונתן תציל אותי ותעביר לפרונט
        json = Json(dtkita);
        if (Request.Form["submit"] != null)
        {
            subject = Request.Form["subject"];
            numof1 = Request.Form["numof"];
            diff = Request.Form["diff"];
            kita= Request.Form["kita"];
            dd = Request.Form["dd"];
            mm = Request.Form["mm"];
            yyyy = Request.Form["yyyy"];
            exp = dd + "/" + mm + "/" + yyyy;
            if (subject == "0" || numof1 == "" || numof1=="0" || diff == "0")
            {
                Session["ErrIsertForm"] = "נתונים לא מולאו כשורה";
            }
            else
            {
                numof = int.Parse(numof1);
                string fileName7 = "db1.mdb";       //SQLSTUF START
                string sql2 = "SELECT * FROM users WHERE kita='" + kita +"';";
                DataTable dt1;
                DataTable dtu;
                DataTable dtat;
                DataTable dtatu;
                dt1 = MyAdoHelper.ExecuteDataTable(fileName7, sql2);//users
                int i = 0,x,f,rand,b=0;
                Random rnd = new Random();
                string ID,sql1,sql3,sql4,sql5,sql6,sql7;
                string TALMIDMAAGARSQL;
                bool found = false;
                sql3 = "SELECT * FROM TAT" + subject + " WHERE diff='" + diff + "';"; //מאגר
                dtat = MyAdoHelper.ExecuteDataTable(fileName7, sql3);
                if (dtat.Rows.Count > 0)
                {
                    foreach (DataRow Row in dt1.Rows)  /////////foreach////////////
                    {
                        ID = dt1.Rows[i][5].ToString();
                        sql1 = "SELECT * FROM ID" + ID + " WHERE subjectID='" + subject + "';";   //טבלה אישית
                        dtu = MyAdoHelper.ExecuteDataTable(fileName7, sql1);
                        if (dtu.Rows.Count > 0)
                        {
                            if (dtu.Rows[0][3].ToString() == diff) //אם כבר קיימת רשומה וטבלה והכל כיף
                            {
                                if (dtat.Rows.Count <= numof)
                                {
                                    //sendthemall
                                    sql5 = "SELECT * FROM TAT" + subject + "_" + ID + ";";  //מאגר אישי
                                    dtatu = MyAdoHelper.ExecuteDataTable(fileName7, sql5);
                                    x = 0;
                                    f = 0;
                                    b = 0;
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
                                            b++;
                                            sql6 = "INSERT INTO TAT" + subject + "_" + ID + " (ID, location, answ, iscomplete, datec, exp)values('" + dtat.Rows[x][0].ToString() + "'," + dtat.Rows[x][1].ToString() + "','" + dtat.Rows[x][2].ToString() + "','0','"+datec+"','"+exp+"');";
                                            MyAdoHelper.DoQuery(fileName7, sql6);
                                        }
                                        x++;
                                    }
                                    b = b + int.Parse(dtu.Rows[0][2].ToString());
                                    sql7 = "UPDATE ID" + ID + "SET ctargil='" + b.ToString() + "' WHERE subjectID='" + subject + "';";//הוספת התרגילים החדשים לסיתרגיל
                                    MyAdoHelper.DoQuery(fileName7, sql7);

                                }
                                else
                                {
                                    //random
                                    sql5 = "SELECT * FROM TAT" + subject + "_" + ID + ";";  //מאגר אישי
                                    dtatu = MyAdoHelper.ExecuteDataTable(fileName7, sql5);
                                    x = 0;
                                    f = 0;
                                    b = 0;
                                    while (x < numof)//עבור כל תרגיל
                                    {
                                        sql5 = "SELECT * FROM TAT" + subject + "_" + ID + ";";  //מאגר אישי מעודכן למניעת כפילויות
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
                                        sql6 = "INSERT INTO TAT" + subject + "_" + ID + " (ID, location, answ, iscomplete, datec, exp)values('" + dtat.Rows[rand][0].ToString() + "','" + dtat.Rows[rand][1].ToString() + "','" + dtat.Rows[rand][2].ToString() + "','0','"+datec+"','"+exp+"');";
                                        MyAdoHelper.DoQuery(fileName7, sql6);
                                        b++;
                                        x++;
                                    }
                                    b = b + int.Parse(dtu.Rows[0][2].ToString());
                                    sql7 = "UPDATE ID" + ID + "SET ctargil='" + b.ToString() + "' WHERE subjectID='" + subject + "';";//הוספת התרגילים החדשים לסיתרגיל
                                    MyAdoHelper.DoQuery(fileName7, sql7);
                                }
                                i++;
                            }
                            else if (dtu.Rows[0][3].ToString() != diff) //אם קיימת רשומה אבל ברמה שונה, נדלג.
                            {
                                i++;
                            }
                        }
                        else //אם אין טבלה ורשומה, ניצור חדשה.
                        {
                            TALMIDMAAGARSQL = "CREATE TABLE TAT" + subject + "_" + ID + " (ID varchar(255), location varchar(255), answ varchar(255), iscomplete bit, datec varchar(255), exp varchar(255));";
                            MyAdoHelper.DoQuery(fileName7, TALMIDMAAGARSQL);//טבלה נוצרה
                            if (dtat.Rows.Count <= numof)
                            {
                                sql4 = "INSERT INTO ID" + ID + " (subject, subjectID, ctargil, diff, master)values('" + xpstuf.IDsubject(subject) + "','" + subject + "','" + dtat.Rows.Count.ToString() + "','" + diff + "','0');";
                                MyAdoHelper.DoQuery(fileName7, sql4);
                                //sendthemall
                                x = 0;
                                while (x < dtat.Rows.Count)//עבור כל תרגיל
                                {
                                    sql6 = "INSERT INTO TAT" + subject + "_" + ID + " (ID, location, answ, iscomplete, datec, exp)values('" + dtat.Rows[x][0].ToString() + "','" + dtat.Rows[x][1].ToString() + "','" + dtat.Rows[x][2].ToString() + "','0','"+datec+"','"+exp+"');";
                                    MyAdoHelper.DoQuery(fileName7, sql6);
                                    x++;
                                }
                            }
                            else
                            {
                                x = 0;
                                sql4 = "INSERT INTO ID" + ID + " (subject, subjectID, ctargil, diff, master)values('" + xpstuf.IDsubject(subject) + "','" + subject + "','" + numof1 + "','" + diff + "','0');";
                                MyAdoHelper.DoQuery(fileName7, sql4);
                                //random
                                sql5 = "SELECT * FROM TAT" + subject + "_" + ID + ";";  //מאגר אישי
                                dtatu = MyAdoHelper.ExecuteDataTable(fileName7, sql5);
                                x = 0;
                                f = 0;
                                while (x < numof)//עבור כל תרגיל
                                {
                                    sql5 = "SELECT * FROM TAT" + subject + "_" + ID + ";";  //מאגר אישי מעודכן למניעת כפילויות
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
                                    sql6 = "INSERT INTO TAT" + subject + "_" + ID + "(ID, location, answ, iscomplete, datec, exp)values('" + dtat.Rows[rand][0].ToString() + "','" + dtat.Rows[rand][1].ToString() + "','" + dtat.Rows[rand][2].ToString() + "','0','"+datec+"','"+exp+"');";
                                    MyAdoHelper.DoQuery(fileName7, sql6);
                                    x++;
                                }
                            }
                            i++;
                        }

                    }
                    Session["ErrIsertForm"] = "הפעולה הושלמה בהצלחה!";
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
            string JSONString = string.Empty;
            JSONString = Newtonsoft.Json.JsonConvert.SerializeObject(new { Class=table });
            return JSONString;
        }
    }

}


