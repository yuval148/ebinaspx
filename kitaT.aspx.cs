using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class kitaT : System.Web.UI.Page
{
    public string json = "", json2 = "", json3 = "",kita;
    public string userPass, userName;

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

            sql = "SELECT DISTINCT kita FROM users";//USERS
            DataTable users = MyAdoHelper.ExecuteDataTable(fileName, sql);
            json = Json(users);
            if (Request.Form["submit"] != null)
            {
                kita = Request.Form["kita"];
                form.Style["opacity"] = "0";
                stuopc.Style["opacity"] = "100";
                string sql2 = "SELECT * FROM users WHERE kita='" + kita + "';";
                DataTable dtu = MyAdoHelper.ExecuteDataTable(fileName, sql2);
                json3 = Json(dtu);
             
            }
        }
    }
    public string Json(DataTable table)
    {
        {
            string JSONString = string.Empty;
            JSONString = Newtonsoft.Json.JsonConvert.SerializeObject(new { stu = table });
            return JSONString;
        }
    }


}


