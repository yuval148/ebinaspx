using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for Class1
/// </summary>
public class xpstuf
{
    public xpstuf()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static int level(int xpp)
    {
        int r = 1;
        if (xpp >= 0 && xpp < 100)
        {
            r = 1;
        }
        else if(xpp >= 100 && xpp < 250)
        {
            r = 2;
        }
        else if(xpp >= 250 && xpp < 500)
        {
            r = 3;
        }
        else if(xpp >= 500 && xpp < 900)
        {
            r = 4;
        }
        else if(xpp >= 900 && xpp < 1400)
        {
            r = 5;
        }
        //if (xpp <= 00 && xpp > 00)
        //{
        //    r = 6;
       // }
        //if (xpp <= 00 && xpp > 00)
        //{
        //    r = 7;
        //}
        return r;
    }
    public static int precxp(int xpp)
    {
        int r = 0; ;
        double r1=0;
        if (xpp >= 0 && xpp < 100)
        {
            r = xpp;
        }
        else if(xpp >= 100 && xpp < 250)
        {
            r1 = xpp-100;
            r1 = r1 / 150;
            r1 = r1 * 100;
            r = (int) r1;
        }
        else if(xpp >= 250 && xpp < 500)
        {
            r1 = xpp - 250;
            r1 = r1 / 250;
            r1 = r1 * 100;
            r = (int)r1;
        }
        else if(xpp >= 500 && xpp < 900)
        {
            r1 = xpp - 500;
            r1 = r1 / 400;
            r1 = r1 * 100;
            r = (int)r1;
        }
        else if(xpp >= 900 && xpp < 1400)
        {
            r1 = xpp - 900;
            r1 = r1 / 500;
            r1 = r1 * 100;
            r = (int)r1;
        }
        //if (xpp <= 00 && xpp > 00)
        //{
        // }
        //if (xpp <= 00 && xpp > 00)
        //{
        //}
        return r;
    }
    public static int xptilnext(int xpp)
    {
        int r = 0; ;
        if (xpp >= 0 && xpp < 100)
        {
            r = 100- xpp;
        }
        else if (xpp >= 100 && xpp < 250)
        {
            r = 250 - xpp;
        }
        else if (xpp >= 250 && xpp < 500)
        {
            r = 500- xpp;

        }
        else if(xpp >= 500 && xpp < 900)
        {
            r = 900 - xpp;
        }
        else if(xpp >= 900 && xpp < 1400)
        {
            r = 1400 - xpp;
        }
        //if (xpp <= 00 && xpp > 00)
        //{
        // }
        //if (xpp <= 00 && xpp > 00)
        //{
        //}
        return r;
    }

    public static int subjectID(string subject)
    {
        switch (subject)
        {
            case "מקצוע": return 0;
            case "פרבולות": return 1;
            case "טריגונומטריה": return 2;
            case "אלגברה": return 3;
            case "הסתברות": return 4;
            case "פיזיקה": return 5;
            case "אזרחות": return 6;
            case "היסטוריה": return 7;
            case "לשון": return 8;
            case "ספרות": return 9;
            case "כימיה": return 10;
            case "סוציולוגיה": return 11;
            default: return 0;
        }
    }
    public static string IDsubject(string subject)
    {
        switch (subject)
        {
            case "0": return "מקצוע";
            case "1": return "פרבולות";
            case "2": return "טריגונומטריה";
            case "3": return "אלגברה";
            case "4": return "הסתברות";
            case "5": return "פיזיקה";
            case "6": return "אזרחות";
            case "7": return "היסטוריה";
            case "8": return "לשון";
            case "9": return "ספרות";
            case "10": return "כימיה";
            case "11": return "סוציולוגיה";
            default: return "מקצוע";
        }
    }
    // DEFINE RETURN VALUES

    public static int memuza(string ID)
    {
        string sql = "SELECT * FROM ID" + ID + ";";
        DataTable dt = MyAdoHelper.ExecuteDataTable("db1.mdb", sql);
        int r;
        double result , cou = 0, ctargil = 0 ;
        if (dt.Rows.Count > 0)
        {
            cou = double.Parse(dt.Rows[0]["cou"].ToString());
            ctargil = double.Parse(dt.Rows[0]["ctargil"].ToString());
            result = (cou / ctargil);
            for (int i = 1; i < dt.Rows.Count; i++)
            {
                cou = double.Parse(dt.Rows[i]["cou"].ToString());
                ctargil = double.Parse(dt.Rows[i]["ctargil"].ToString());
                result = result + (cou / ctargil);
            }
            result = result * 100;
            result = result / dt.Rows.Count;
            r = Convert.ToInt32(result);
            return r;
        }
        return 0;
    }
    public static string GetUserIPAddress()
    {
        var context = System.Web.HttpContext.Current;
        string ip = String.Empty;

        if (context.Request.ServerVariables["HTTP_X_FORWARDED_FOR"] != null)
            ip = context.Request.ServerVariables["HTTP_X_FORWARDED_FOR"].ToString();
        else if (!String.IsNullOrWhiteSpace(context.Request.UserHostAddress))
            ip = context.Request.UserHostAddress;

        if (ip == "::1")
            ip = "127.0.0.1";

        return ip;
    }

    public static string GetUserEnvironment(HttpRequest request)
    {
        var browser = request.Browser;
        var platform = GetUserPlatform(request);
        return string.Format("{0} {1} / {2}", browser.Browser, browser.Version, platform);
    }

    public static string GetUserPlatform(HttpRequest request)
    {
        var ua = request.UserAgent;

        if (ua.Contains("Android"))
            return string.Format("Android {0}", GetMobileVersion(ua, "Android"));

        if (ua.Contains("iPad"))
            return string.Format("iPad OS {0}", GetMobileVersion(ua, "OS"));

        if (ua.Contains("iPhone"))
            return string.Format("iPhone OS {0}", GetMobileVersion(ua, "OS"));

        if (ua.Contains("Linux") && ua.Contains("KFAPWI"))
            return "Kindle Fire";

        if (ua.Contains("RIM Tablet") || (ua.Contains("BB") && ua.Contains("Mobile")))
            return "Black Berry";

        if (ua.Contains("Windows Phone"))
            return string.Format("Windows Phone {0}", GetMobileVersion(ua, "Windows Phone"));

        if (ua.Contains("Mac OS"))
            return "Mac OS";

        if (ua.Contains("Windows NT 5.1") || ua.Contains("Windows NT 5.2"))
            return "Windows XP";

        if (ua.Contains("Windows NT 6.0"))
            return "Windows Vista";

        if (ua.Contains("Windows NT 6.1"))
            return "Windows 7";

        if (ua.Contains("Windows NT 6.2"))
            return "Windows 8";

        if (ua.Contains("Windows NT 6.3"))
            return "Windows 8.1";

        if (ua.Contains("Windows NT 10"))
            return "Windows 10";

        //fallback to basic platform:
        return request.Browser.Platform + (ua.Contains("Mobile") ? " Mobile " : "");
    }

    public static string GetMobileVersion(string userAgent, string device)
    {
        var temp = userAgent.Substring(userAgent.IndexOf(device) + device.Length).TrimStart();
        var version = string.Empty;

        foreach (var character in temp)
        {
            var validCharacter = false;
            int test = 0;

            if (Int32.TryParse(character.ToString(), out test))
            {
                version += character;
                validCharacter = true;
            }

            if (character == '.' || character == '_')
            {
                version += '.';
                validCharacter = true;
            }

            if (validCharacter == false)
                break;
        }

        return version;
    }

    // stop
    public enum TzStatus
    {
        R_NOT_VALID = -2,
        R_ELEGAL_INPUT = -1,
        R_VALID = 1
    };

    public static TzStatus ValidateID(string IDNum)
    {

        // Validate correct input
        if (!System.Text.RegularExpressions.Regex.IsMatch(IDNum, @"^\d{5,9}$"))
            return TzStatus.R_ELEGAL_INPUT;

        // The number is too short - add leading 0000
        if (IDNum.Length < 9)
        {
            while (IDNum.Length < 9)
            {
                IDNum = '0' + IDNum;
            }
        }

        // CHECK THE ID NUMBER
        int mone = 0;
        int incNum;
        for (int i = 0; i < 9; i++)
        {
            incNum = Convert.ToInt32(IDNum[i].ToString());
            incNum *= (i % 2) + 1;
            if (incNum > 9)
                incNum -= 9;
            mone += incNum;
        }
        if (mone % 10 == 0)
            return TzStatus.R_VALID;
        else
            return TzStatus.R_NOT_VALID;
    }
}

//TODO: add public static int tatID(string tat)