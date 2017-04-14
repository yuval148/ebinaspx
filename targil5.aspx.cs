using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using System.Data.SqlClient;
using System.Data;
using System.Web.Services;



public partial class targil5 : System.Web.UI.Page
{
    public string json = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userName"] == null)
        {
            Response.Redirect("login.aspx");
        }
        string sql = "";
        string tableName = "TAT" + "5_" + Session["ID"];
        string fileName = "db1.mdb"; //שם המסד
        sql = "select * from " + tableName;
        DataTable dt;
        dt = MyAdoHelper.ExecuteDataTable(fileName, sql);
        json = Json(dt);
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
    [WebMethod]
    public static void change(string tatID, string ID)
    {
        string tableName = "TAT" + "5_" + ID;
        string fileName = "db1.mdb";
        DataTable dtID, dtat;
        //לעדכן בטבלה אישית ++ 
        //לבדוק שהיה אפס קודם
        string sql1 = "SELECT * FROM ID" + ID +" WHERE subjectID='5';";  //עדכון טבלה אישית מרכזית
        string sql2 = "SELECT * FROM TAT5_" + ID + " WHERE ID='" + tatID + "';"; //בדיקה האם התרגיל כבר בוצע
        
        dtID = MyAdoHelper.ExecuteDataTable(fileName, sql1);
        dtat = MyAdoHelper.ExecuteDataTable(fileName, sql2);
        int cou = int.Parse(dtID.Rows[0][4].ToString());
        cou++;
        bool iff = Convert.ToBoolean(dtat.Rows[0][3].ToString());
        if (!iff)
            {
            string sql = "UPDATE " + tableName + " SET iscomplete='1' WHERE ID='" + tatID + "';";
            MyAdoHelper.DoQuery(fileName, sql);
            string sql3 = "UPDATE ID" + ID + " SET cou='" +cou +"' WHERE subjectID='5';";
            MyAdoHelper.DoQuery(fileName, sql3);
            }
    }
    [System.Web.Services.WebMethod]
    public static string Fuck(string name)
    {
        return ("your name is" + name);
    }

}