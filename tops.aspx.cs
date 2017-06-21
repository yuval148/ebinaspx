using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class tops : System.Web.UI.Page
{
    protected void Page_Load()
    {
        if (Session["userName"] == null)
        {
            Response.Redirect("login.aspx");
        }      
    }

}


