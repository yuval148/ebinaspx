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



public partial class targil11 : System.Web.UI.Page
{
    public string json = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        string fileName = "db1.mdb"; //שם המסד
        string check = "SELECT * FROM ID" + Session["ID"] + " WHERE subjectID='11';";
        if (Session["userName"] == null)
        {
            Response.Redirect("login.aspx");
        }
        else if (MyAdoHelper.IsExist(fileName, check))
        {
            string sql = "";
            string tableName = "TAT" + "11_" + Session["ID"];

            sql = "SELECT * FROM " + tableName + " WHERE iscomplete=false;";
            DataTable dt;
            dt = MyAdoHelper.ExecuteDataTable(fileName, sql);
            if (dt.Rows.Count == 0)
            {
                Response.Redirect("dinial.aspx");
            }
            CheckDatemsg(dt);
            dt = MyAdoHelper.ExecuteDataTable(fileName, sql);
            if (dt.Rows.Count == 0)
            {
                Response.Redirect("dinial.aspx");
            }
            else
            {
                CheckDatemsg(dt);
                dt = MyAdoHelper.ExecuteDataTable(fileName, sql);
                json = Json(dt);
            }
        }
        else
        {
            Response.Redirect("dinial.aspx");
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
                string sqlDel = "DELETE FROM TAT11_" + Session["ID"] + " WHERE ID='" + table.Rows[i]["ID"].ToString() + "' AND datec='" + table.Rows[i]["datec"].ToString() + "' AND exp='" + table.Rows[i]["exp"].ToString() + "';";
                MyAdoHelper.DoQuery(fileName, sqlDel);
            }
        }
    }
    [WebMethod]
    public static void change(string tatID, string ID)
    {
        string tableName = "TAT" + "11_" + ID;
        string fileName = "db1.mdb";
        DataTable dtID, dtat;
        //לעדכן בטבלה אישית ++ 
        //לבדוק שהיה אפס קודם
        string sql1 = "SELECT * FROM ID" + ID +" WHERE subjectID='11';";  //עדכון טבלה אישית מרכזית
        string sql2 = "SELECT * FROM TAT11_" + ID + " WHERE ID='" + tatID + "';"; //בדיקה האם התרגיל כבר בוצע
        
        dtID = MyAdoHelper.ExecuteDataTable(fileName, sql1);
        dtat = MyAdoHelper.ExecuteDataTable(fileName, sql2);
        int cou = int.Parse(dtID.Rows[0][4].ToString());
        cou++;
        bool iff = Convert.ToBoolean(dtat.Rows[0][3].ToString());
        if (!iff)
            {
            string sql = "UPDATE " + tableName + " SET iscomplete='1' WHERE ID='" + tatID + "';";
            MyAdoHelper.DoQuery(fileName, sql);
            string sql3 = "UPDATE ID" + ID + " SET cou='" +cou +"' WHERE subjectID='11';";
            MyAdoHelper.DoQuery(fileName, sql3);
            }
    }
    [System.Web.Services.WebMethod]
    public static string Fuck(string name)
    {
        return ("your name is" + name);
    }

}