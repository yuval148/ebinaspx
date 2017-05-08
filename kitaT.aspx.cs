using System;
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
                DataColumn shlita = new DataColumn("shlita", typeof(int));
                shlita.AllowDBNull = true;
                dtu.Columns.Add(shlita);
                DateTime today = DateTime.Today;
                string datee = today.ToString("dd/MM/yyyy");
                for (int iii =0; iii<dtu.Rows.Count; iii++)
                {
                    dtu.Rows[iii]["shlita"] = xpstuf.memuza(dtu.Rows[iii]["ID"].ToString());  //insert to new cullum
                    //update gra
                    int shlitagra = xpstuf.memuza(dtu.Rows[iii]["ID"].ToString());
                    string sql4 = "SELECT * FROM GRA" + dtu.Rows[iii]["ID"].ToString() + " WHERE datee='" + datee + "';";
                    if (MyAdoHelper.IsExist(fileName, sql4)) //אם כבר יש בתאריך הזה
                    {
                        string sqlgra2 = "UPDATE GRA" + dtu.Rows[iii]["ID"].ToString() + " SET shlita=" + shlitagra + " WHERE datee='" + datee + "';";
                        MyAdoHelper.DoQuery(fileName, sqlgra2);
                    }
                    else
                    {
                        string sqlgra1 = "INSERT INTO GRA" + dtu.Rows[iii]["ID"].ToString() + " (shlita, datee) VALUES(" + shlitagra + " ,'" + datee + "');";
                        MyAdoHelper.DoQuery(fileName, sqlgra1);
                    }
                    //end update 
                }
                shlita.AllowDBNull = false;
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


