<%@ Page Language="C#" AutoEventWireup="true" CodeFile="404.aspx.cs" Inherits="e404" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--#include file="upper.aspx"-->

<html xmlns="http://www.w3.org/1999/xhtml">
<head >
    <title>הדף לא נמצא - תירגולית</title>
    <meta name="theme-color" content="#3f51b5"/>
    <style>
        body {
                background: url("media/bg5.jpg");
                background-size: 100%, 100%;
                background-repeat: no-repeat;
            }
                   @media screen and (max-width: 480px) {

           body {
               background: url("media/bgphone.png");
               background-size: 100% 100%;
           }
       }

    </style>
</head>
<body style="font-family:Arial; text-align:center;">
    <form id="form1" runat="server" dir="rtl"  >
   
    <div  align="center">
    <img src="media/404.png" style="width:50%;"/>
    </div>
    </form>
</body>
</html>
