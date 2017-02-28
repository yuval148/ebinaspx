using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using System.Data.SqlClient;
using System.Data;


public partial class targil : System.Web.UI.Page
{
    public string json = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        string sql = "";
        string tableName = "ID" + Session["ID"];
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

}


