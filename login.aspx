<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login"%>
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
            <h2 class="form-login-heading">היכנס עכשיו</h2>
            <div class="login-wrap">
                <input class="form-control" placeholder="שם משתמש" type="text" id="userName" name="userName">
                <input class="form-control" placeholder="סיסמא" type="password" id="userPass" name="userPass" >
                <label class="checkbox">
		                <span class="pull-right">
		                    <a href="loginT.aspx">מורה? לחץ כאן!</a>
		                </span>
		         </label>
                <button class="btn btn-theme btn-block" type="submit" id="loginbtn" name="submit">
                    היכנס <i class="fa fa-lock"></i>
                </button>
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
          <div id="errorDiv" class="mdl-components__warning"><%=Session["ErrLogin"] %></div>
                </div>

         <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="assets/js/jquery.backstretch.min.js"></script>
      <script>
          $.backstretch("media/0pres.png", {speed: 500});
          $.backstretch("assets/img/login-bg.jpg", {speed: 500});

            var opc = <%=opc%>;
            document.getElementById( 'errorDiv' ).style.opacity = opc;
        </script>
    </body>
   </html> 

