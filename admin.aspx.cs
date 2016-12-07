using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin : System.Web.UI.Page
{
    public string printDataStr = "";//משתנה להצגת נתוני השליפה 
    protected void Page_Load()
    {
          
            DataTable dt;
            int length;
            if (Session["Admin"] != null)//שמירה שרק מנהל יכנס לדף זה
        {
            //הגדרת צורת ההתחברות 
            string sql = "";
            string tableName = "table1";//שם הטבלה
            string fileName ="db1.mdb"; //שם המסד

            
            //שליפת רשימת משתמשים
            if (Request.Form["submit"] != null)
            {
                //טעינת הנתונים ממסד הנתונים
                sql = "select * from " + tableName;//sql  יצירת מחרוזת שליפה מטבלה ואיחסונה במשתנה
                dt=MyAdoHelper.ExecuteDataTable(fileName,sql);
                length=dt.Rows.Count;
                if (length > 0)
                {
                    //הכנת מחרוזת המכילה את נתוני הטבלה שיש להציג
                    printDataStr += "<table   border='1'>";
                    printDataStr += "<tr>";
                    printDataStr += "<th>שם</th>";
                    printDataStr += "<th> שם משתמש</th>";
                    printDataStr += "<th> סיסמה</th>";
                    printDataStr += "<th> קבוצה</th>";
                    printDataStr += "<th> נקודות</th>";
                    printDataStr += "<th> כיתה</th>";
                    printDataStr += "<th> ת.ז</th>";
                    printDataStr += "</tr>";
                    MyAdoHelper.ExecuteDataTable(fileName, sql);
                for (int i=0;i<length;i++)
                {               
                    printDataStr += "<tr>";
                    printDataStr += "<td>" + dt.Rows[i]["name"] + "</td>";
                    printDataStr += "<td>" + dt.Rows[i]["userName"] + "</td>";
                    printDataStr += "<td>" + dt.Rows[i]["userPass"] + "</td>";
                    printDataStr += "<td>" + dt.Rows[i]["team"] + "</td>";
                    printDataStr += "<td>" + dt.Rows[i]["xpp"] + "</td>";
                    printDataStr += "<td>" + dt.Rows[i]["kita"] + "</td>";
                    printDataStr += "<td>" + dt.Rows[i]["ID"] + "</td>";
                    printDataStr += "</tr>";
                }
                printDataStr += "</table><form action='' method='post'> <input  type='submit' name='close' id='close' value='סגור '  /></form>";
                string userCount=length.ToString();
            }

            }
    }
            }

}


