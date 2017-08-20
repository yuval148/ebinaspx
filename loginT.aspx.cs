using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Services;


public partial class login : System.Web.UI.Page
{
    public int opc;
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["userName"] = null;
        string tableName = "morim";//שם הטבלה
        string fileName = "db1.mdb";
        string userName, userPass, name;
        string userName2, ID, pic;
        opc = 0;
        string ip = xpstuf.GetUserIPAddress();
        string userAgent = xpstuf.GetUserEnvironment(Request);
        userAgent += " from loginT";
        DateTime timeUtc = DateTime.UtcNow;
        TimeZoneInfo easternZone = TimeZoneInfo.FindSystemTimeZoneById("Israel Standard Time");
        DateTime datehortod = TimeZoneInfo.ConvertTimeFromUtc(timeUtc, easternZone);
        string dathour = datehortod.ToString("dd/MM/yyyy HH:mm:ss");
        string sqlcouner = "INSERT INTO entrys (ip, userAgent, dathour) VALUES ('" + ip + "','" + userAgent + "','" + dathour + "');";
        MyAdoHelper.DoQuery(fileName, sqlcouner);



        userName = Request.Form["userName"];
        userPass = Request.Form["userPass"];
        if (Request.Form["userName"] == "" || Request.Form["userPass"] == "")
        {
            opc = 100;
            Session["ErrLogin"] = "יש למלא שם וסיסמה";
            
        }
        else
        {
            fileName ="db1.mdb";
            string sql = "select * from "+ tableName + " where userName='" + Request.Form["userName"] + "'";
            sql += "AND userPass ='" + Request.Form["userPass"] + "'";
            if (MyAdoHelper.IsExist(fileName, sql)) //שימוש בפעולה אם המשתמש קיים 
            {
                DataTable dt;
                dt = MyAdoHelper.ExecuteDataTable(fileName, sql);

                Session["userNameT"] = dt.Rows[0]["userName"].ToString();
                userName2 = dt.Rows[0]["userName"].ToString();
                Session["nameT"] = dt.Rows[0]["name"].ToString(); ;     
                name = dt.Rows[0]["name"].ToString();
                Session["IDT"] = dt.Rows[0]["ID"].ToString();
                ID = dt.Rows[0]["ID"].ToString();
                Session["picT"] = dt.Rows[0]["pic"].ToString();
                pic = dt.Rows[0]["pic"].ToString();
                opc = 100;
                Session["ErrLogin"] = " שלום " + name;
                Response.Redirect("homeT.aspx");
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
    [WebMethod]
    public static string Login(string userName, string userPass)
    {
        string tableName = "morim";
        string sql = "select * from " + tableName + " where userName='" + userName + "'";
        sql += "AND userPass ='" + userPass + "'";
        string sql2 = "select * from " + tableName + " where userName='" + userName + "'";
        string fileName = "db1.mdb";
        string empty = "שם משתמש או סיסמא ריקים!";
        string diff = "סיסמא או שם משתמש שגויים!";
        string NE = "משתמש לא קיים!";
        if (userName == "" || userPass == "")
        {
            return empty;
        }
        else if (MyAdoHelper.IsExist(fileName, sql2) && !(MyAdoHelper.IsExist(fileName, sql)))
        {
            return diff;
        }
        else if(!(MyAdoHelper.IsExist(fileName, sql2)))
        {
            return NE;
        }
        else
        {
            return "noErr";
        }
    }
    }


