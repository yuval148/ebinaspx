using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class culture : System.Web.UI.Page
{
    public string json = "";
    protected void Page_Load()
    {
        if (Session["userNameT"] == null)
        {
            Response.Redirect("loginT.aspx");
        }
        if (Session["nameT"] != null)
        {

            string sql = "";
            string fileName = "db1.mdb"; //שם המסד

            sql = "SELECT * FROM users";//USERS
            DataTable users = MyAdoHelper.ExecuteDataTable(fileName, sql);
            json = Json(users);
            if (Request.Form["submit"] != null)
            {
                string ID = Request.Form["ID"];
                form.Style["opacity"] = "0";
                string sql2 = "SELECT * FROM users WHERE ID='" + ID + "';";
                DataTable dtu = MyAdoHelper.ExecuteDataTable(fileName, sql);
                string sql3 = "SELECT * FROM ID" + ID + ";";
                DataTable dtid = MyAdoHelper.ExecuteDataTable(fileName, sql);





            }
        }
    }
    public string Json(DataTable table)
    {
        {
            string JSONString = string.Empty;
            JSONString = Newtonsoft.Json.JsonConvert.SerializeObject(new { Class = table });
            return JSONString;
        }
    }

}


