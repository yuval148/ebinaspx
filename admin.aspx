<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin.aspx.cs" Inherits="admin" %>

<!--#include file="upper.aspx"-->
<html>
<head>
    <title>דף ניהול</title>
    <style>
        body
        {
            background: url("bg2.jpg");
            background-size: 100%, 100%;
            background-repeat:no-repeat;
        }
    </style>

</head>
<body style="font-family:Arial; text-align:center;">
<br />
  דף מנהל.
    <h1>
        צפייה ברשימת הרשומים לאתר</h1>
    <form action="" method="post">
    <input type="submit" name="submit" id="Submit" value="רשימת רשומים " />
    </form>
    <%=printDataStr%>
    <%=Session["printDataStr"]%>
</body>
</html>
