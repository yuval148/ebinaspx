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
        if (Session["userNameT"] == null)
        {
            Response.Redirect("loginT.aspx");
        }
        DataTable dt;
        int sum = 0;
        string sumtemp;
        int length;
        int f = 0;
        if (Session["nameT"] != null)//שמירה שרק מנהל יכנס לדף זה
        {
            //הגדרת צורת ההתחברות 
            string sql = "";
            string tableName = "users";//שם הטבלה
            string fileName = "db1.mdb"; //שם המסד


            //שליפת רשימת משתמשים
            if (Request.Form["submit"] != null)
            {
                //טעינת הנתונים ממסד הנתונים
                sql = "select * from " + tableName;//sql  יצירת מחרוזת שליפה מטבלה ואיחסונה במשתנה
                dt = MyAdoHelper.ExecuteDataTable(fileName, sql);
                //foreach(DataRow dr in dt.Rows)
                //
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
                    printDataStr += "<table class='mdl - data - table mdl - js - data - table mdl - data - table- mdl-shadow--2dp'>";
                    printDataStr += "<thead> <tr>";
                    printDataStr += "<th  class='mdl - data - table__cell--non - numeric'>שם</th>";
                    printDataStr += "<th> קבוצה</th>";
                    printDataStr += "<th> נקודות</th>";
                    printDataStr += "</tr></thead><tbody>";
                    MyAdoHelper.ExecuteDataTable(fileName, sql);
                    for (int i = 0; i < length; i++)
                    {
                        printDataStr += "<tr>";
                        printDataStr += "<td  class='mdl - data - table__cell--non - numeric'>" + dt.Rows[i]["name"] + "</td>";                //TODO: Arreange by xpp
                        printDataStr += "<td>" + dt.Rows[i]["team"] + "</td>";
                        printDataStr += "<td>" + dt.Rows[i]["xpp"] + "</td>";         // foreach 
                        printDataStr += "</tr>";
                    }
                    printDataStr += "<tr><td  class=' mdl - data - table__cell--non - numeric'>ממוצע הנקודות</td><td></td><td>" + sum +"</td>";
                    printDataStr += "</tbody> </table><form action='' method='post'> <input  type='submit' name='close' id='close' value='סגור '  /></form>";
                    string userCount = length.ToString();
                }

            }
        }
    }

}


