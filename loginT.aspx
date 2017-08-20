﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="loginT.aspx.cs" Inherits="login"%>
<!DOCTYPE html>
<html lang="heb">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>Playground</title>

    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        
    <!-- Custom styles for this template -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body style="font-family:Arial;">
    <div id="login-page">
	<div class="container">
        <form id="myform1" class="form-login"  method="post" dir="rtl">
            <h2 class="form-login-heading-t"><img src="media/LOGOr.png" style="align-content:center; width:200px;" /></h2>
            <div class="login-wrap">
                <input class="form-control" placeholder="שם משתמש" type="text" id="userName" name="userName">
                <input class="form-control" placeholder="סיסמא" type="password" id="userPass" name="userPass" >
                <label class="checkbox">
		                <span class="pull-right">
		                    <a href="login.aspx">תלמיד? לחץ כאן!</a>
		                </span>
		         </label>
                <button class="btn btn-theme-t btn-block" type="submit" id="loginbtn" name="submit">
                    היכנס <i class="fa fa-lock"></i>
                </button>
                <div>
                        <span id="error"></span>
                    </div>
                <hr>
                
                <div class="registration">
		            אין לך חשבון עדיין?<br/>
		            <a class="" href="signup.aspx">
		               צור חשבון
		            </a>
		        </div>
            </div>
        </form>
  </div>

         <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="assets/js/jquery.backstretch.min.js"></script>
      <script>
          $.backstretch("media/0pres.png", {speed: 300});
          $.backstretch("media/login-bg.jpg", { speed: 500 });
          var btn = document.querySelector('#loginbtn');

           btn.addEventListener('click', function () {
            $.ajax({
                type: "POST",
                url: "loginT.aspx/Login",
                data: '{"userName":' + '"' + document.getElementById("userName").value + '"' + ',"userPass":' + '"' + document.getElementById("userPass").value + '"' + ' }',
                contentType: "application/json; charset=utf-8",
                async: false, 
                success: function (result) {
                    x = false;
                    if (result.d == "noErr") { }//כלום לא אמור לרוץ
                    else {
                        $("#error").empty();
                        $("#error").insertBefore("</hr>");
                        $("#error").append("<span>" + result.d + "</span>");
                        x = true;
                    }
                },
                error: function () {
                    console.log("ajax error");
                },
            });
                $("#myform1").submit(function (event) {
                    if (x) {
                        event.preventDefault();
                    }
                    else{
                        $(this).unbind("submit").submit()

                    }
                });

        });
        </script>
    </body>
   </html> 

