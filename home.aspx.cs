using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


public partial class home : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userName"] == null)
        {
            Response.Redirect("login.aspx");
        }

        //double prog = 50;
        //int level = Int32.Parse(Session["level"].ToString());
        //double curxp = Double.Parse(Session["xpp"].ToString()) - 250;
        //prog = (curxp / 250) * 100;
        //refali.Style["width"] = String.Format("{0}%", (int)prog);

            DataTable dt;
            Session["sendr"] = "";
            string sendr = "";
            int f = 0;
            string sql = "";
            string tableName = "ID" + Session["ID"];//שם הטבלה
            string fileName = "db1.mdb"; //שם המסד

            //טעינת הנתונים ממסד הנתונים
            sql = "select DISTINCT subjectID from " + tableName;//sql  יצירת מחרוזת שליפה מטבלה ואיחסונה במשתנה
            dt = MyAdoHelper.ExecuteDataTable(fileName, sql);
            foreach (DataRow Row in dt.Rows)
            {
                if (dt.Rows[f][0].ToString() == "0")
                    f++;
                else
                {
                    sendr = sendr + dt.Rows[f][0].ToString() + ".";
                    f++;
                }
            }
            Session["sendr"] = sendr;

    }
protected void BtnSubmit_Click(object sender, EventArgs e)
    {
        String str = "";

       

    }
}