<%@ Page Language="C#" AutoEventWireup="true" CodeFile="signup.aspx.cs" Inherits="signup" %>
<!--#include file="upper.aspx"-->

<html>
  <head>
  <title>הרשמה</title>
  <style>
        body {
                background: url("/media/bg5.jpg");
                background-size: 100%, 100%;
                background-repeat: no-repeat;
            }
    </style>
      <script type="text/javascript">
          function check() {
              var formValid = true;
              name = document.f.name.value;
              if (name.length <= 2) {
                  formValid = false;
                  alert("name is too short");
              }

              ID = document.f.ID.value;
              for (i = 0; i < ID.length; i++) {
                  if (!(ID.charAt(i) >= '0' && ID.charAt(i) <= '9') || (ID.charAt(i) == '-')) {
                      formValid = false;
                      alert("there cant be signs in the ID number who are not numbers or dashes");
                      break;
                  }
              }

              userPass = document.f.userPass.value;
              if (userPass.length <= 2) {
                  formValid = false;
                  alert("password is too short");
                  }
                return formValid;
            }
      </script>
  </head>
<body style="font-family:Arial, Helvetica, Sans-Serif; text-align:center;">
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
</body>
</html>
