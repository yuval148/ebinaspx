﻿using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class studentT : System.Web.UI.Page
{
    public string json = "", json2 = "", json3 = "", ID, jsondate="",jsonshlit="";
    public string userPass, userName;
    

    protected void Page_Load()
    {
        Session["errform"] = "null";
        if (Session["userNameT"] == null)
        {
            Response.Redirect("loginT.aspx");
        }
        if (Session["nameT"] != null)
        {

            string sql = "";
            string fileName = "db1.mdb"; //שם המסד

            sql = "SELECT * FROM users";//USERS
            DataTable users = MyAdoHelper.ExecuteDataTable(fileName, sql);
            json = Json(users);
            if (Request.Form["submit"] != null)
            {
                ID = Request.Form["ID"];
                Session["errform"] = ID;
                stuopc.Style["opacity"] = "100";
                DateTime today = DateTime.Today;
                string datee = today.ToString("dd/MM/yyyy");
                int shlita = xpstuf.memuza(ID);
                string sql4 = "SELECT * FROM GRA" + ID + " WHERE datee='" + datee + "';";
                if (MyAdoHelper.IsExist(fileName, sql4)) //אם כבר יש בתאריך הזה
                {
                    string sqlgra2 = "UPDATE GRA" + ID + " SET shlita=" + shlita + " WHERE datee='" + datee + "';";
                    MyAdoHelper.DoQuery(fileName, sqlgra2);
                }
                else
                {
                    string sqlgra1 = "INSERT INTO GRA" + ID + " (shlita, datee) VALUES(" + shlita + " ,'" + datee + "');";
                    MyAdoHelper.DoQuery(fileName, sqlgra1);
                }
                string sql2 = "SELECT * FROM users WHERE ID='" + ID + "';";
                DataTable dtu = MyAdoHelper.ExecuteDataTable(fileName, sql2);
                json3 = Json(dtu);
                string sql3 = "SELECT * FROM ID" + ID + ";";
                DataTable dtid = MyAdoHelper.ExecuteDataTable(fileName, sql3);
                string sqlgsh = "SELECT shlita FROM GRA"+ID+";";
                string sqlgda = "SELECT datee FROM GRA" + ID + ";";
                DataTable grsh = MyAdoHelper.ExecuteDataTable(fileName,sqlgsh);
                DataTable grda = MyAdoHelper.ExecuteDataTable(fileName, sqlgda);
                jsondate = Json(grda);
                jsonshlit = Json(grsh);
                changepass.Style["opacity"] = "100"; //רק בלחיצה על כפתור גילוי סיסמה
                userPass = dtu.Rows[0]["userPass"].ToString();
                userName = dtu.Rows[0]["userName"].ToString();
                json2 = Json(dtid);


            }
        }
    }
    public string Json(DataTable table)
    {
        {
            string JSONString = string.Empty;
            JSONString = Newtonsoft.Json.JsonConvert.SerializeObject(new { stu = table });
            return JSONString;
        }
    }
    [WebMethod]
    public static void changepss(string userPass1, string ID)
    {
        userPass1 = userPass1.ToString();
        if (userPass1 != "")
        {
            string sql4 = "UPDATE users SET userPass='" + userPass1 + "' WHERE ID='" + ID + "';"; //לא עובד!
            string filename = "db1.mdb";
            MyAdoHelper.DoQuery(filename, sql4);
        }
    }

}


