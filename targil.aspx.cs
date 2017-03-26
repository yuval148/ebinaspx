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



public partial class targil : System.Web.UI.Page
{
    public string json = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userName"] == null)
        {
            Response.Redirect("login.aspx");
        }
        string sql = "";
        string tableName = "TAT" + "3_" + Session["ID"];
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
        string tableName = "TAT" + "3_" + ID;
        string fileName = "db1.mdb";
        string sql = "UPDATE " + tableName + " SET iscomplete='1' WHERE ID='" + tatID + "';";
        MyAdoHelper.DoQuery(fileName, sql);
    }
    [System.Web.Services.WebMethod]
    public static string Fuck(string name)
    {
        return ("your name is" + name);
    }

}