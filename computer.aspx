<%@ Page Language="C#" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>

<script runat="server">
    string msg = "";
    
    protected void Page_Load()
    {
        
        if (Session["userName"] != null)
        {
            msg = " ברוך הבא " + Session["userName"];
        }
        else
        {

            
            Response.Redirect("userDinial.aspx");
        }

    }
</script>

<!--#include file="upper.aspx"-->
<html dir="rtl">
<head>
    <title></title> 
    <style>
        body {
                background: url("/media/bg5.jpg");
                background-size: 100%, 100%;
                background-repeat: no-repeat;
            }
    </style>
</head>
<body style="font-family:Arial; text-align:center;">
<br />
<table border='1'>
<tr>
<th>אתגר</th>
<th>רמת קושי</th>
<th>בונוס נקודות</th>
</tr>
<tr>
<td><a href="computer.html">אתגר 1</a> </td>
<td>קל</td>
<td><b>+5</b></td>
</tr>
    <tr>
<td><a href="computer.html">אתגר 2</a> </td>
<td>בורגני</td>
<td><b>+10</b></td>
</tr>
    <tr>
<td><a href="computer.html">אתגר 3</a> </td>
<td>קשה מאוד</td>
<td><b>+20</b></td>
</tr>
</table>
    


</body>
</html>
