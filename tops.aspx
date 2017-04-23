<%@ Page Language="C#" AutoEventWireup="true" CodeFile="tops.aspx.cs" Inherits="culture" %>
<!--#include file="upper.aspx"-->
<html>
<head>
    <title></title>
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
<br />
    <h1>
        צפייה בטבלת הנקודות</h1>
    <form action="" method="post">
    <input type="submit" name="submit" id="Submit" value="צפייה בלוח המובילים " />
    </form>
    <div style="width: 50%; margin:0 auto;">
    <%=printDataStr%>
    <%=Session["printDataStr"]%>
        </div>
</body>
</html>
