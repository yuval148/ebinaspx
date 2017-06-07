<%@ Page Language="C#" AutoEventWireup="true" CodeFile="signupT.aspx.cs" Inherits="signupT" %>
<!--#include file="upperT.aspx"-->

<html>
  <head>
  <title>הרשמה</title>
  <style>
body {
	background: url("/media/bfg5.jpg");
	background-size: 100%, 100%;
    background-repeat: no-repeat;
    background-attachment: fixed;
	}
      @media screen and (max-width: 480px) {
          body {
              background: url("/media/bgphoneT.png");
              background-size: 100%;
              background-repeat: no-repeat;
          }
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
<body style="font-family:Arial, Heebo, Sans-Serif; text-align:center;">.
    <h2 style="font-family:Heebo;">הרשמת מורה</h2>
    <form name="f" id="f" method="post" class="w3-container" runat="server" onsubmit="return check();">
     
     <table align=center>
     <tr>
     <td>שם מלא</td>
      <td><input type="text" id="name" name="name" maxlength="50" size="15" class="w3-input"/></td>
      </tr>
       <tr>
      <td>שם משתמש</td>
      <td><input type="text" id="username" name="username" maxlength="145" size="15" class="w3-input"/></td>
       </tr>
       <tr>
       <td>סיסמה</td>
       <td><input type="password" id="userpass" name="userpass"  maxlength="16" size="15" class="w3-input" /></td>
       </tr>
        <tr>
      <td>מספר ת.ז</td>
      <td><input type="text" id="ID" name="ID" maxlength="9" size="9" class="w3-input"/></td>
       </tr>
        <tr>
            <td>העלאת תמונת פרופיל - אופציונלי</td>
            <td>
        <asp:FileUpload ID="FileUpload1" runat="server"/>
                </td>
        </tr>
         <tr>
             <td></td>
             <td>
                <asp:Button ID="btnUpload" class="w3-button w3-red" runat="server" Text="סיים" type="submit" OnClick="submit"  />
             </td>
         </tr>
    </table>
    </form>
<p align="center" style="height: 96px ;font-size:30px; font-family:Heebo">
    <br />
<%=Session["ErrIsertForm"]%></p>
</body>
</html>
