using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

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
        if (xpp >= 100 && xpp < 250)
        {
            r = 2;
        }
        if (xpp >= 250 && xpp < 500)
        {
            r = 3;
        }
        if (xpp >= 500 && xpp < 900)
        {
            r = 4;
        }
        if (xpp >= 1250 && xpp < 1450)
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

    public static int subjectID(string subject)
    {
        switch (subject)
        {
            case "מקצוע": return 0;
            case "אנגלית": return 1;
            case "מדעי המחשב": return 2;
            case "מתמטיקה": return 3;
            case "ערבית": return 4;
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
            case "1": return "אנגלית";
            case "2": return "מדעי המחשב";
            case "3": return "מתמטיקה";
            case "4": return "ערבית";
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