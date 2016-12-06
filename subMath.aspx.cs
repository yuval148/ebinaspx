using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class subMath : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userName"] == null)
        {
            Response.Redirect("login.aspx");
        }

        double prog = 50;
        int level = Int32.Parse(Session["level"].ToString());
        double curxp = Double.Parse(Session["xpp"].ToString()) - 250;
        prog = (curxp / 250) * 100;
        refali.Style["width"] = String.Format("{0}%", (int)prog);
    }
}