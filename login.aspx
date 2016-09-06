<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>
<!--#include file="upper.aspx"-->
  <html>  
  <head>
  <title> התחברות</title>
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
    <br />
    <form id="myform1" method="post" action="">
    <table align=center>
     <tr>
     <td>שם משתמש  </td>
      <td><input type="text" id="userName" name="userName" /></td>
      </tr>
      
      <tr>
      <td>סיסמה</td>
      <td><input type="password" id="userPass" name="userPass" /></td>
       </tr>
      
       <tr>
          <td> <input type="submit" value="שלח" name="submit" /></td>
      </tr>
    </table>
    <b> <font size="4" color="blue"> <%=Session["ErrLogin"]%></font></b><br />
    
    </form>
    
    </body>
   </html> 

