
<!doctype html>
<html dir="rtl">
    <head> 
    <!-- ver 005.004.003--!>
        <!--mobile confg-->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <!--handlebars-->
        <script src="js/handlebars-v4.0.5.js"></script>
        <!--javascript & css-->
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Heebo:300,500,700,900&amp;subset=hebrew">
        <script defer src="https://code.getmdl.io/1.2.1/material.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <!--colors-->
        <link rel="stylesheet" href="https://code.getmdl.io/1.2.1/material.indigo-blue.min.css" /> 
        <link href="css/notiflications.css" rel="stylesheet" />
        <link rel="stylesheet" href="css/upper.css">
        <script src="js/google_a.js"></script>
    </head>
    <body dir="rtl">
        <div class="topnav w3-card-4" id="myTopnav" style="font-family: 'Heebo', sans-serif; font-weight:300;">
  <a> <img src="media/LOGO.png" style="float:right; width:170px;"/></a>
  <a href="home.aspx">בית</a>
  <a href="tops.aspx">המובילים</a>
  <a href="login.aspx" id="login">התחברות</a>
  <a href="signup.aspx" id="signup">הרשמה</a>
  <a href="javascript:void(0);" style="font-size:15px;" id="after" class="icon" onclick="myFunction()">&#9776;</a>
</div>

<script>
function myFunction() {
    var x = document.getElementById("myTopnav");
    if (x.className === "topnav") {
        x.className += " responsive";
    } else {
        x.className = "topnav";
    }
}
</script>
    </body>
    </html>