using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class secretT : System.Web.UI.Page
{
    public string json = "";

    protected void Page_Load()
    {
        if (Session["userNameT"] == null)
        {
            Response.Redirect("loginT.aspx");
        }
        string fileName = "db1.mdb"; //שם המסד
        string sql = "SELECT * FROM entrys;";
        DataTable dt = MyAdoHelper.ExecuteDataTable(fileName, sql);
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

    protected void del(Object sender, EventArgs e)
    {
        string fileName = "db1.mdb";
        string sqldel = "DELETE * FROM entrys;";
        MyAdoHelper.DoQuery(fileName, sqldel);
    }

}


