using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Services;


public partial class homeT : System.Web.UI.Page
{
    public string json = "", jsonPro = "", jsonMes = "", jsonnotifi = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userNameT"] == null)
        {
            Response.Redirect("loginT.aspx");
        }
        string fileName = "db1.mdb"; //שם המסד
        DataTable dt, dt2, dtPro, dtMes, dtnotif;
        string sql = "", sql2 = "", sqlPro = "", sqlMes = "", sqlnotifi = "";
        sqlPro = "SELECT * FROM morim WHERE ID='" + Session["IDT"] + "';";
        dtPro = MyAdoHelper.ExecuteDataTable(fileName, sqlPro);
        jsonPro = Json(dtPro);
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