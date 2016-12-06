using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class economy : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string fileName = "db1.mdb";
        string sql;
        string name = "ספרות";
        string tableName = "Table1";
        MyAdoHelper.DoQuery(fileName, sql);

    }
}
