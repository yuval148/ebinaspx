<%@ Page Language="C#" AutoEventWireup="true" CodeFile="signup.aspx.cs" Inherits="signup" %>
<!--#include file="upper.aspx"-->

<html>
 <head>
    <title>הרשמה</title>
    <link href="css/signup.css" rel="stylesheet" />
    <script src="js/signup.js"></script>
 </head>
<body style="font-family:Arial, Helvetica, Sans-Serif; text-align:center;">
    <div id="page-wrap">
         <div class="w3-card w3-panel">
            <ul class="progressbar">
                <li class="active">צעד 1</li>
                <li id="2">צעד 2</li>
                <li>צעד 3</li>
                <li>צעד 4</li>
            </ul>
         </div>
    <button onclick="update()">לחץ עליי</button>
    <form name="f" method="post" onsubmit="return check();">    
     <table align=center>
     <tr>
     <td>שם  </td>
      <td><input type="text" id="name" name="name" maxlength="50" size="15"/></td>
      </tr>
       <tr>
      <td>שם משתמש</td>
      <td><input type="text" id="userName" name="userName" maxlength="145" size="15"/></td>
       </tr>
       <tr>
       <td>סיסמה</td>
       <td><input type="password" id="userPass" name="userPass"  maxlength="16" 
               size="15" /></td>
       </tr>
        <tr>
      <td>קבוצה</td>
      <td><input type="text" id="team" name="team" maxlength="16" size="15"/></td>
       </tr>
           <tr>
      <td>כיתה</td>
      <td><input type="text" id="kita" name="kita" maxlength="4" size="15"/></td>
       </tr>
          <tr>
      <td>מספר ת.ז</td>
      <td><input type="text" id="ID" name="ID" maxlength="9" size="9"/></td>
       </tr>   
         <td> <input type="submit" value="שלח" name="submit"/></td>  
    </table>
    </form>
    
<p align="center" style="height: 96px ;font-size:50px"></p>
<div class="mdl-components__warning"><%=Session["ErrIsertForm"] %></div>
        </div>
</body>
</html>
