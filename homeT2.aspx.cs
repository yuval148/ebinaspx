using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Services;


public partial class homeT2 : System.Web.UI.Page
{
    public string json = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userNameT"] == null)
        {
            Response.Redirect("loginT.aspx");
        }
        DataTable dt;
        string sql = "";
        string fileName = "db1.mdb"; //שם המסד
        sql = "SELECT DISTINCT kita FROM users;";
        dt = MyAdoHelper.ExecuteDataTable(fileName, sql);
        json = Json(dt);

    }
    public string Json(DataTable table)
    {
        {
            string JSONString = string.Empty;
            JSONString = Newtonsoft.Json.JsonConvert.SerializeObject(new { stu = table });
            return JSONString;
        }
    }
    [WebMethod]
    public static string getkita(string kita)
    {
        string json3 = string.Empty;
        if (kita != "")
        {
            string sql2 = "SELECT * FROM users WHERE kita='" + kita + "';";
            string filename = "db1.mdb";
            DataTable dtu = MyAdoHelper.ExecuteDataTable(filename, sql2);
            json3 = Newtonsoft.Json.JsonConvert.SerializeObject(new { kitaa = dtu });
        }
        return json3;
    }
}