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
/// ������ ��� ������ ���� ������ ���� ����
///  App_Data ���� ����� ����� 
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
        string path = HttpContext.Current.Server.MapPath("App_Data/");//����� ��� ���������
        path += fileName;
        //string path = HttpContext.Current.Server.MapPath("App_Data/" + fileName);//���� �� ����� ��� ������� ������ ��� ������ �� ����� ����
        string connString = "Provider=Microsoft.Jet.OLEDB.4.0;Data source=" + path;//����� �������� ������� ����� ���� ����
        OleDbConnection conn = new OleDbConnection(connString);
        return conn;
    }

    /// <summary>
    /// To Execute update / insert / delete queries
    ///  ������ ����� �� ���� ����� ������ ������ �� ������ �� ����
    /// </summary>

    public static void DoQuery(string fileName, string sql)//������ ����� �� ��� ������ ������� �����/ �����/ �����
    //������ �� ������ �� ���� �����
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
    ///  ������ ����� �� ���� ����� ������ ������� �� ���� ������ ������� ������ ������
    /// </summary>
    public static int RowsAffected(string fileName, string sql)//������ ����� ����� ��� ������ ������ �����
    //������ �� ������ �� ���� �����
    {

        OleDbConnection conn = ConnectToDb(fileName);
        conn.Open();
        OleDbCommand com = new OleDbCommand(sql, conn);
        int rowsA = com.ExecuteNonQuery();
        conn.Close();
        return rowsA;
    }

    /// <summary>
    /// ������ ����� �� ���� ����� ������ ��� - ������ ��� �� ���� ���� ���� ����
    /// </summary>
    public static bool IsExist(string fileName, string sql)//������ ����� �� ���� ����� ����� ���� ������� ��� �� ������� ������ ���� ����
    {

        OleDbConnection conn = ConnectToDb(fileName);
        conn.Open();
        OleDbCommand com = new OleDbCommand(sql, conn);
        OleDbDataReader data = com.ExecuteReader();
        bool found;
        found = (bool)data.Read();// �� �� ������ ������ ���� ��� ���� ��� - ���� ���� ���� �������
        conn.Close();
        return found;

    }
    //����
    //�� �� ����?
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

    public static string printDataTable(string fileName, string sql)//������ ����� �� ���� ����� ����� ���� ������� ��� �� ������� ������ ���� ����
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

