using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Services;


public partial class login : System.Web.UI.Page
{
    public int opc;
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["userName"] = null;
        string tableName = "users";//שם הטבלה
        string fileName = "db1.mdb";
        Label Label1 = new Label();
        string error1 = "שם משתמש או סיסמא לא נכונים";
        string userName, userPass, name, team;
        string userName2, ID, kita, pic;
        int level = 0;
        opc = 0;
        string ip = xpstuf.GetUserIPAddress();
        string userAgent = xpstuf.GetUserEnvironment(Request);
        userAgent += " from login";
        DateTime timeUtc = DateTime.UtcNow;
        TimeZoneInfo easternZone = TimeZoneInfo.FindSystemTimeZoneById("Israel Standard Time");
        DateTime datehortod = TimeZoneInfo.ConvertTimeFromUtc(timeUtc, easternZone);
        string dathour = datehortod.ToString("dd/MM/yyyy HH:mm:ss");
        DateTime today = DateTime.Today;
        string datee = today.ToString("dd/MM/yyyy");
        string sqlcouner = "INSERT INTO entrys (ip, userAgent, dathour) VALUES ('" + ip + "','" + userAgent + "','" + dathour + "');";
        MyAdoHelper.DoQuery(fileName, sqlcouner);

        userName = Request.Form["userName"];
        userPass = Request.Form["userPass"];
        if (Request.Form["userName"] == "" || Request.Form["userPass"] == "")
        {
            opc = 100;
            Session["ErrLogin"] = "יש למלא שם וסיסמה";

        }
        else
        {
            string sql = "select * from " + tableName + " where userName='" + Request.Form["userName"] + "';";
            string sqlp = "SELECT userPass FROM " + tableName + " WHERE userName='" + userName + "';";
            if (MyAdoHelper.IsExist(fileName, sql)) //אם שם המשתמש קיים
            {
                DataTable temp = MyAdoHelper.ExecuteDataTable(fileName, sqlp);
                string hash = temp.Rows[0]["userPass"].ToString();
                if (SecurePasswordHasher.Verify(userPass, hash))//אומת
                {
                    DataTable dt;
                    dt = MyAdoHelper.ExecuteDataTable(fileName, sql);

                    Session["userName"] = dt.Rows[0]["userName"].ToString();
                    userName2 = dt.Rows[0]["userName"].ToString();
                    Session["name"] = dt.Rows[0]["name"].ToString(); ;
                    name = dt.Rows[0]["name"].ToString();
                    Session["team"] = dt.Rows[0]["team"].ToString();
                    team = dt.Rows[0]["team"].ToString();
                    Session["ID"] = dt.Rows[0]["ID"].ToString();
                    ID = dt.Rows[0]["ID"].ToString();
                    Session["kita"] = dt.Rows[0]["kita"].ToString();
                    kita = dt.Rows[0]["kita"].ToString();
                    Session["pic"] = dt.Rows[0]["pic"].ToString();
                    pic = dt.Rows[0]["pic"].ToString();
                    int prexp = int.Parse(dt.Rows[0]["xpp"].ToString());

                    //פעולת xpp
                    //חשב את כל הcou מהטבלה האישית והשם בXPP
                    string sql1 = "SELECT * FROM ID" + ID + ";";
                    string sqlMes = "SELECT * FROM MSG;";
                    string sqlnotifi = "SELECT * FROM notifi;";
                    DataTable dtid = MyAdoHelper.ExecuteDataTable(fileName, sql1);
                    DataTable dtMes = MyAdoHelper.ExecuteDataTable(fileName, sqlMes);
                    DataTable dtnotifi = MyAdoHelper.ExecuteDataTable(fileName, sqlnotifi);
                    CheckDatemsg(dtMes);//קורא לפעולה
                    CheckDatenotifi(dtnotifi);//קורא לפעולה
                    int xpp1 = 0;
                    for (int i = 0; i < dtid.Rows.Count; i++)
                    {
                        xpp1 += int.Parse(dtid.Rows[i]["cou"].ToString());
                    }
                    xpp1 = xpp1 * 10;
                    string sql2 = "UPDATE users SET xpp='" + xpp1.ToString() + "' WHERE userName='" + userName + "' AND ID='" + ID + "';";
                    if (xpp1 > prexp)
                    {
                        prexp = xpp1 - prexp;
                        string titl = "מספר הנקודות שלך עלה ב" + prexp.ToString() + " נקודות!";
                        string exp = DateTime.Today.AddDays(7).ToString("dd/MM/yyyy"); ;
                        string notifixpp = "INSERT INTO notifi (icon, title, ID, datec, exp, seen) VALUES ('trending_up','" + titl + "','" + ID + "','" + datee + "','" + exp + "',False);";
                        MyAdoHelper.DoQuery(fileName, notifixpp);// הכנס התראה
                        MyAdoHelper.DoQuery(fileName, sql2);
                    }
                    //סוף הפעולה
                    Session["xpp"] = xpp1.ToString();
                    Session["level"] = xpstuf.level(xpp1);
                    level = xpstuf.level(xpp1);
                    //פעולה להכנסת הגרף
                    int shlita = xpstuf.memuza(ID);
                    string sql4 = "SELECT * FROM GRA" + ID + " WHERE datee='" + datee + "';";
                    if (MyAdoHelper.IsExist(fileName, sql4)) //אם כבר יש בתאריך הזה
                    {
                        string sql5 = "UPDATE GRA" + ID + " SET shlita=" + shlita + " WHERE datee='" + datee + "';";
                        MyAdoHelper.DoQuery(fileName, sql5);
                    }
                    else
                    {
                        string sql3 = "INSERT INTO GRA" + ID + " (shlita, datee) VALUES(" + shlita + " ,'" + datee + "');";
                        MyAdoHelper.DoQuery(fileName, sql3);
                    }
                    Session["shlita"] = shlita;
                    //סוף
                    opc = 100;
                    Session["ErrLogin"] = " שלום " + name + " מקבוצת " + team + " יש לך " + xpp1.ToString() + " נקודות " + "  ואתה בשלב " + level.ToString();
                    Response.Redirect("home.aspx");
                }
                else
                {
                    Label1.Text = error1;
                }
            }
            else
            {
                Label1.Text = error1;
            }
        }
    }

    public void CheckDatemsg(DataTable table)
    {
        string exp;
        string fileName = "db1.mdb";
        for (int i = 0; i < table.Rows.Count; i++)
        {
            exp = table.Rows[i]["exp"].ToString();
            DateTime dt = DateTime.ParseExact(exp, "dd/MM/yyyy", null);
            if (DateTime.Now >= dt)
            {
                string sqlDel = "DELETE FROM MSG WHERE title='" + table.Rows[i]["title"].ToString() + "' AND datec='" + table.Rows[i]["datec"].ToString() + "' AND exp='" + table.Rows[i]["exp"].ToString() + "';";
                MyAdoHelper.DoQuery(fileName, sqlDel);
            }
        }
    }
    public void CheckDatenotifi(DataTable table)
    {
        string exp;
        string fileName = "db1.mdb";
        for (int i = 0; i < table.Rows.Count; i++)
        {
            exp = table.Rows[i]["exp"].ToString();
            DateTime dt = DateTime.ParseExact(exp, "dd/MM/yyyy", null);
            if (DateTime.Now >= dt)
            {
                string sqlDel = "DELETE FROM notifi WHERE title='" + table.Rows[i]["title"].ToString() + "' AND datec='" + table.Rows[i]["datec"].ToString() + "' AND exp='" + table.Rows[i]["exp"].ToString() + "';";
                MyAdoHelper.DoQuery(fileName, sqlDel);
            }
        }
    }
    [WebMethod]
    public static string Login(string userName, string userPass)
    {
        string tableName = "users";
        string sql = "select * from " + tableName + " where userName='" + userName + "'";
        string sqlp = "SELECT userPass FROM " + tableName + " WHERE userName='" + userName + "';";
        string fileName = "db1.mdb";
        string empty = "שם משתמש או סיסמא ריקים!";
        string diff = "סיסמא או שם משתמש שגויים!";

        if (userName == "" || userPass == "")
        {
            return empty;
        }
        else if (MyAdoHelper.IsExist(fileName, sql)) //אם שם המשתמש קיים
        {
            DataTable temp = MyAdoHelper.ExecuteDataTable(fileName, sqlp);
            string hash = temp.Rows[0]["userPass"].ToString();
            if (SecurePasswordHasher.Verify(userPass, hash))//אומת
            {
                return "noErr";
            }
            else
            {
                return diff;
            }
        }
        else
        {
            return diff;
        }
    }
}


