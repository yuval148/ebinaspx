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

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userName"] == null)
        {
            Response.Redirect("login.aspx");
        }
        //חישוב XP TODO
        //חיבור כל הCOU
        //ללא עמודת XPP בטבלה USERS

        //חישוב שליטה בחומר
        //COU
        //לחלק
        //בCTARGIL
        // *100

        //TODO!
        double prog = 50;
        int level = Int32.Parse(Session["level"].ToString());
        double curxp = Double.Parse(Session["xpp"].ToString()) - 250;
        prog = (curxp / 250) * 100;
        Session["prog"] = prog;

        DataTable dt, dt2, dtPro,dtMes;
        Session["sendr"] = "";
        string sendr = "";
        int f = 0;
        string sql = "", sql2 = "", sqlPro = "",sqlMes="";
        string tableName = "ID" + Session["ID"];//שם הטבלה
        string fileName = "db1.mdb"; //שם המסד
        //טעינת הנתונים ממסד הנתונים
        sql = "select DISTINCT subjectID from " + tableName;//sql  יצירת מחרוזת שליפה מטבלה ואיחסונה במשתנה
        sql2 = "select *from " + tableName;
        sqlPro = "SELECT * FROM users WHERE ID='" + Session["ID"] + "';";
        sqlMes="SELECT * FROM MSG;";

        dt = MyAdoHelper.ExecuteDataTable(fileName, sql);
        dt2 = MyAdoHelper.ExecuteDataTable(fileName, sql2);
        dtPro = MyAdoHelper.ExecuteDataTable(fileName, sqlPro);
        dtMes = MyAdoHelper.ExecuteDataTable(fileName, sqlMes);
        CheckDate(dtMes);//קורא לפעולה
        foreach (DataRow Row in dt.Rows)
        {
            if (dt.Rows[f][0].ToString() == "0")
                f++;
            else
            {
                sendr = sendr + dt.Rows[f][0].ToString() + ".";
                f++;
            }
        }
        sendr = sendr.Remove(sendr.Length - 1);
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
    public void CheckDate(DataTable table)
    {
        string exp;
        string fileName = "db1.mdb";
        for (int i = 0; i < table.Rows.Count; i++)
        {
            exp = table.Rows[i]["exp"].ToString();
            DateTime dt = Convert.ToDateTime(exp);
            if (DateTime.Now > dt)
            {
                string sqlDel = "DELETE FROM MSG WHERE title='" + table.Rows[i]["title"].ToString() + "' AND datec='" + table.Rows[i]["datec"].ToString() + "' AND exp='" + table.Rows[i]["exp"].ToString() + "';";
                MyAdoHelper.DoQuery(fileName, sqlDel);
            }
        }
    }
}