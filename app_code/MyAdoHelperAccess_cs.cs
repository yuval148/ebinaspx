using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.OleDb;

/// <summary>
/// Summary description for MyAdoHelper
/// ôòåìåú òæø ìùéîåù áîñã ðúåðéí îñåâ à÷ññ
///  App_Data äîñã îîå÷í áú÷éä 
/// </summary>

public class MyAdoHelper
{
    public MyAdoHelper()
    {
        //
        // TODO: Add constructor logic here
        //
    }


    public static OleDbConnection ConnectToDb(string fileName)
    {
        string path = HttpContext.Current.Server.MapPath("App_Data/");//îé÷åí îñã áôåøåéé÷è
        path += fileName;
        //string path = HttpContext.Current.Server.MapPath("App_Data/" + fileName);//îàúø àú îé÷åí îñã äðúåðéí îäùåøù åòã äú÷ééä áä îîå÷í äîñã
        string connString = "Provider=Microsoft.Jet.OLEDB.4.0;Data source=" + path;//ðúåðé ääúçáøåú äëåììéí îé÷åí åñåâ äîñã
        OleDbConnection conn = new OleDbConnection(connString);
        return conn;
    }

    /// <summary>
    /// To Execute update / insert / delete queries
    ///  äôòåìä î÷áìú ùí ÷åáõ åîùôè ìáéöåò åîáöòú àú äôòåìä òì äîñã
    /// </summary>

    public static void DoQuery(string fileName, string sql)//äôòåìä î÷áìú ùí îñã ðúåðéí åîçøåæú îçé÷ä/ äåñôä/ òãëåï
    //åîáöòú àú äô÷åãä òì äîñã äôéæé
    {

        OleDbConnection conn = ConnectToDb(fileName);
        conn.Open();
        OleDbCommand com = new OleDbCommand(sql, conn);
        com.ExecuteNonQuery();
        com.Dispose();
        conn.Close();

    }


    /// <summary>
    /// To Execute update / insert / delete queries
    ///  äôòåìä î÷áìú ùí ÷åáõ åîùôè ìáéöåò åîçæéøä àú îñôø äùåøåú ùäåùôòå îáéöåò äôòåìä
    /// </summary>
    public static int RowsAffected(string fileName, string sql)//äôòåìä î÷áìú îñìåì îñã ðúåðéí åô÷åãú òãëåï
    //åîáöòú àú äô÷åãä òì äîñã äôéæé
    {

        OleDbConnection conn = ConnectToDb(fileName);
        conn.Open();
        OleDbCommand com = new OleDbCommand(sql, conn);
        int rowsA = com.ExecuteNonQuery();
        conn.Close();
        return rowsA;
    }

    /// <summary>
    /// äôòåìä î÷áìú ùí ÷åáõ åîùôè ìçéôåù òøê - îçæéøä àîú àí äòøê ðîöà åù÷ø àçøú
    /// </summary>
    public static bool IsExist(string fileName, string sql)//äôòåìä î÷áìú ùí ÷åáõ åîùôè áçéøú ðúåï åîçæéøä àîú àí äðúåðéí ÷ééîéí åù÷ø àçøú
    {

        OleDbConnection conn = ConnectToDb(fileName);
        conn.Open();
        OleDbCommand com = new OleDbCommand(sql, conn);
        OleDbDataReader data = com.ExecuteReader();
        bool found;
        found = (bool)data.Read();// àí éù ðúåðéí ì÷øéàä éåùí àîú àçøú ù÷ø - äòøê ÷ééí áîñã äðúåðéí
        conn.Close();
        return found;

    }
    //øåòé
    //îé æä øåòé?
    public static DataTable ExecuteDataTable(string fileName, string sql)
    {
        OleDbConnection conn = ConnectToDb(fileName);
        conn.Open();
        OleDbDataAdapter tableAdapter = new OleDbDataAdapter(sql, conn);
        DataTable dt = new DataTable();
        tableAdapter.Fill(dt);
        return dt;
    }


    public void ExecuteNonQuery(string fileName, string sql)
    {
        OleDbConnection conn = ConnectToDb(fileName);
        conn.Open();
        OleDbCommand command = new OleDbCommand(sql, conn);
        command.ExecuteNonQuery();
        conn.Close();
    }

    public static string printDataTable(string fileName, string sql)//äôòåìä î÷áìú ùí ÷åáõ åîùôè áçéøú ðúåï åîçæéøä àîú àí äðúåðéí ÷ééîéí åù÷ø àçøú
    {


        DataTable dt = ExecuteDataTable(fileName, sql);

        string printStr = "<table border='1'>";

        foreach (DataRow row in dt.Rows)
        {
            printStr += "<tr>";
            foreach (object myItemArray in row.ItemArray)
            {

                printStr += "<td>" + myItemArray.ToString() + "</td>";
            }
            printStr += "</tr>";
        }
        printStr += "</table>";

        return printStr;
    }

}