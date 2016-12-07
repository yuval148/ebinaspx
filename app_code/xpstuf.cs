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
}

//TODO: add public static int tatID(string tat)