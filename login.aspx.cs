using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class login : System.Web.UI.Page
{
    public int opc;
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["userName"] = null;
        string tableName = "users";//שם הטבלה
        string userName, userPass, name, team, xpp;
        string userName2, ID, kita, pic;
        int level = 0;
        opc = 0;
  
        
        
        userName = Request.Form["userName"];
        userPass = Request.Form["userPass"];
        if (Request.Form["userName"] == "" || Request.Form["userPass"] == "")
        {
            opc = 100;
            Session["ErrLogin"] = "יש למלא שם וסיסמה";
            
        }
        else
        {
            string fileName ="db1.mdb";
            string sql = "select * from "+ tableName + " where userName='" + Request.Form["userName"] + "'";
            sql += "AND userPass ='" + Request.Form["userPass"] + "'";
            if (MyAdoHelper.IsExist(fileName, sql)) //שימוש בפעולה אם המשתמש קיים 
            {
                DataTable dt;
                dt = MyAdoHelper.ExecuteDataTable(fileName, sql);

                Session["userName"] = dt.Rows[0]["userName"].ToString();
                userName2 = dt.Rows[0]["userName"].ToString();
                Session["name"] = dt.Rows[0]["name"].ToString(); ;     
                name = dt.Rows[0]["name"].ToString();
                Session["team"] = dt.Rows[0]["team"].ToString();
                team = dt.Rows[0]["team"].ToString();
                Session["xpp"] = dt.Rows[0]["xpp"].ToString();
                xpp = dt.Rows[0]["xpp"].ToString();
                Session["ID"] = dt.Rows[0]["ID"].ToString();
                ID = dt.Rows[0]["ID"].ToString();
                Session["kita"] = dt.Rows[0]["kita"].ToString();
                kita = dt.Rows[0]["kita"].ToString();
                Session["pic"] = dt.Rows[0]["pic"].ToString();
                pic = dt.Rows[0]["pic"].ToString();

                Session["level"] = xpstuf.level(Int32.Parse(xpp));
                level = xpstuf.level(Int32.Parse(xpp));
                opc = 100;
                Session["ErrLogin"] = " שלום "+ name + " מקבוצת "+ team + " יש לך " + xpp + " נקודות " +"  ואתה בשלב " + level.ToString();
                Response.Redirect("home.aspx");
            }
            else if (userName == "yuval" && userPass == "1234")
            {
                Session["ErrLogin"] = "  שלום  יובל";
                Session["Admin"] = true;
                Session["userName"] = "admin" ;//פתיחת חסימה גם לכל דפי המשתמש
                Response.Redirect("admin.aspx");
            }

            else
            {
                opc = 0;
                Session["ErrLogin"] = "";
                
            }
        }
        }
    }


