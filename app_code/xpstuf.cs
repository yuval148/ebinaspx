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
    }

//קואלות