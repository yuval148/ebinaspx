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
        if (Session["userNameT"] == null)
        {
            Response.Redirect("loginT.aspx");
        }

    }
protected void BtnSubmit_Click(object sender, EventArgs e)
    {
        String str = "";

       

    }
}