using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


public partial class home : System.Web.UI.Page
{
    public string json = "", jsonPro = "",jsonMes="";
    public int prog;
    public int tilnext;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userName"] == null)
        {
            Response.Redirect("login.aspx");
        }

        //התחלת חישוב XP שוב
        string fileName = "db1.mdb"; //שם המסד
        string sql1 = "SELECT * FROM ID" + Session["ID"].ToString() + ";";
        DataTable dtid = MyAdoHelper.ExecuteDataTable(fileName, sql1);
        int xpp1 = 0;
        for (int i = 0; i < dtid.Rows.Count; i++)
        {
            xpp1 += int.Parse(dtid.Rows[i]["cou"].ToString());
        }
        xpp1 = xpp1 * 10;
        string sqlxpp = "UPDATE users SET xpp='" + xpp1.ToString() + "' WHERE userName='" + Session["userName"].ToString() + "' AND ID='" + Session["ID"].ToString() + "';";
        MyAdoHelper.DoQuery(fileName, sqlxpp);

        //סוף הפעולה
        Session["xpp"] = xpp1.ToString();
        Session["level"] = xpstuf.level(xpp1);
        int level = Int32.Parse(Session["level"].ToString());
        int xpp = Int32.Parse(Session["xpp"].ToString());
        prog = xpstuf.precxp(xpp);  //אחוז נקודות בשלב
        tilnext = xpstuf.xptilnext(xpp); // מספר נקודות עד הרמה הבאה
        progi.Style["width"] = String.Format("{0}%", prog);

        DataTable dt, dt2, dtPro,dtMes;
        string sql = "", sql2 = "", sqlPro = "",sqlMes="";
        string tableName = "ID" + Session["ID"];//שם הטבלה
        //טעינת הנתונים ממסד הנתונים
        sql = "select DISTINCT subjectID from " + tableName;//sql  יצירת מחרוזת שליפה מטבלה ואיחסונה במשתנה
        sql2 = "select *from " + tableName;
        sqlPro = "SELECT * FROM users WHERE ID='" + Session["ID"] + "';";
        sqlMes="SELECT * FROM MSG;";

        dt2 = MyAdoHelper.ExecuteDataTable(fileName, sql2);
        dtPro = MyAdoHelper.ExecuteDataTable(fileName, sqlPro);
        dtMes = MyAdoHelper.ExecuteDataTable(fileName, sqlMes);
        json = Json(dt2);
        jsonPro = Json(dtPro);
        jsonMes = Json(dtMes);
    }
    public string Json(DataTable table)
    {
        {
            string JSONString = string.Empty;
            JSONString = Newtonsoft.Json.JsonConvert.SerializeObject(new { sub = table });
            return JSONString;
        }
    }

}