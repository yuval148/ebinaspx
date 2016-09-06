using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class culture : System.Web.UI.Page
{
    public string printDataStr = "";//משתנה להצגת נתוני השליפה 
    protected void Page_Load()
    {
        if (Session["userName"] == null)
        {
            Response.Redirect("login.aspx");
        }
        DataTable dt;
        int sum = 0;
        string sumtemp;
        int length;
        int f = 0;
        if (Session["name"] != null)//שמירה שרק מנהל יכנס לדף זה
        {
            //הגדרת צורת ההתחברות 
            string sql = "";
            string tableName = "table1";//שם הטבלה
            string fileName = "db1.mdb"; //שם המסד


            //שליפת רשימת משתמשים
            if (Request.Form["submit"] != null)
            {
                //טעינת הנתונים ממסד הנתונים
                sql = "select * from " + tableName;//sql  יצירת מחרוזת שליפה מטבלה ואיחסונה במשתנה
                dt = MyAdoHelper.ExecuteDataTable(fileName, sql);
                //foreach(DataRow dr in dt.Rows)
                //{
                    foreach(DataRow Row in dt.Rows)
                    {
                        
                    sumtemp = dt.Rows[f][4].ToString();
                    sum += int.Parse(sumtemp);
                    f++;
                        
                    }

                //}

                length = dt.Rows.Count;
                sum = sum / length;
                if (length > 0)
                {
                    //הכנת מחרוזת המכילה את נתוני הטבלה שיש להציג
                    printDataStr += "<table   border='1'>";
                    printDataStr += "<tr>";
                    printDataStr += "<th>שם</th>";
                    printDataStr += "<th> קבוצה</th>";
                    printDataStr += "<th> נקודות</th>";
                    printDataStr += "</tr>";
                    MyAdoHelper.ExecuteDataTable(fileName, sql);
                    for (int i = 0; i < length; i++)
                    {
                        printDataStr += "<tr>";
                        printDataStr += "<td>" + dt.Rows[i]["name"] + "</td>";                //TODO: Arreange by xpp
                        printDataStr += "<td>" + dt.Rows[i]["team"] + "</td>";
                        printDataStr += "<td>" + dt.Rows[i]["xpp"] + "</td>";         // foreach 
                        printDataStr += "</tr>";
                    }
                    printDataStr += "<tr><td>ממוצע הנקודות</td><td></td><td>" + sum +"</td>";
                    printDataStr += "</table><form action='' method='post'> <input  type='submit' name='close' id='close' value='סגור '  /></form>";
                    string userCount = length.ToString();
                }

            }
        }
    }

}


