<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>
<!--#include file="upper.aspx"-->
  <html>  
  <head>
  <title> התחברות</title>
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
    <br /><!-- Textfield with Floating Label -->

  <form id="myform1" method="post" dir="rtl">
  <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
    <input class="mdl-textfield__input" type="text" id="userName" name="userName">
    <label class="mdl-textfield__label" for="sample3">שם משתמש</label>
  </div>
      <br />
      <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
    <input class="mdl-textfield__input" type="password"id="userPass" name="userPass" >
    <label class="mdl-textfield__label" for="sample3">סיסמה</label>
  </div>
      <br />
      <!-- Colored raised button -->
<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored"type="submit" name="submit">
  היכנס
</button>
</form>
    
    </body>
   </html> 

