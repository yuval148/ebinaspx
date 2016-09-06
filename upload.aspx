<%@ Page Language="C#" AutoEventWireup="true" CodeFile="upload.aspx.cs" Inherits="upload" %>
<!--#include file="upper.aspx"-->

<html>
  <head>
  <title>דף העלאה</title>
  <style>
        body
        {
            background: url("bg2.jpg");
            background-size: 100%, 100%;
            background-repeat:no-repeat;
        }
    </style>
  </head>
<body style="font-family:Arial, Helvetica, Sans-Serif; text-align:center;">
    <form name="f" method="post" onsubmit="return check();">
     
     <table align=center>
     <tr>
     <td>subject  </td>
      <td><input type="text" id="subject" name="subject" maxlength="50" size="15"/></td>
      </tr>
       <tr>
      <td>tat</td>
      <td><input type="text" id="tat" name="tat" maxlength="145" size="15"/></td>
       </tr>
       <tr>
       <td>link</td>
       <td><input type="text" id="link" name="link"  maxlength="16" 
               size="15" /></td>
       </tr>
        <tr>
      <td>ctargil</td>
      <td><input type="text" id="ctargil" name="ctargil" maxlength="16" size="15"/></td>
       </tr>
          <tr>
      <td>xp</td>
      <td><input type="text" id="xp" name="xp" maxlength="9" size="9"/></td>
       </tr>
       
         <td> <input type="submit" value="שלח" name="submit"/></td>  
    </table>
    </form>
    


<p align="center" style="height: 96px ;font-size:50px">
<%=Session["ErrIsertForm"]%>
</body>
</html>
