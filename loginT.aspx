<%@ Page Language="C#" AutoEventWireup="true" CodeFile="loginT.aspx.cs" Inherits="login" %>
<!--#include file="upperT.aspx"-->
  <html>  
  <head>
  <title> התחברות</title>
   <style>
            body {
                background: url("/media/bfg5.jpg");
                background-size: 100%, 100%;
                background-repeat: no-repeat;
            }
            .mdl-components__warning {
    width: 100%;
    max-width: 640px;
    margin: 0 auto;
    background-color: #FFF9C4;
    padding: 16px;
    border-radius: 2px;
    color: #212121;
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
      <br />
      <br />
       <button class="mdl-button mdl-js-button mdl-button--accent">
          <a style="text-decoration:none" href="/login.aspx">תלמיד? כנס כאן!</a>
       </button>
                <div class="mdl-components__warning"><%=Session["ErrLogin"] %></div>

</form>
    
    </body>
   </html> 

