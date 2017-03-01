
<!doctype html>
<html dir="rtl">
    <head> 
        <title></title>
        <!--mobile confg-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--handlebars-->
        <script src="js/main.js"></script>
        <script src="js/handlebars-v4.0.5.js"></script>
        <!--javascript & css-->
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Heebo:300,500,700,900&amp;subset=hebrew">
        <script defer src="https://code.getmdl.io/1.2.1/material.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <!--colors-->
        <link rel="stylesheet" href="https://code.getmdl.io/1.2.1/material.indigo-blue.min.css" /> 
        <!--rtl-->
        <link rel="stylesheet" href="css/style.css">

        <style>

        </style>

        <!--rtl script-->
        <script>
            $(document).click(function () {if ($(".mdl-layout__drawer").hasClass("is-visible")) {$(".mdl-layout__drawer").removeClass("hide-drawer");$(".mdl-layout__drawer").addClass("right-drawer");}else {$(".mdl-layout__drawer").removeClass("right-drawer");$(".mdl-layout__drawer").addClass("hide-drawer");}});
        </script>
    </head>
    <body dir="rtl">
     <!-- Always shows a header, even in smaller screens. -->
    <div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
    <header class="mdl-layout__header">
    <div class="mdl-layout__header-row" style="font-family: 'Heebo', sans-serif; font-weight:300;"> <!-- TODO: FONT-WEIGHT CORRECT -->
      <!-- Title -->
      <span class="mdl-layout-title"></span><img src="media/LOGO.png" style="height:45% ; width:128px;"/>
      <!-- Add spacer, to align navigation to the right -->
      <!-- Navigation. We hide it in small screens. -->
      <nav class="mdl-navigation mdl-layout--large-screen-only">
        <a class="mdl-navigation__link" href="home.aspx">בית</a>
        <a class="mdl-navigation__link" href="culture.aspx">המובילים</a>
        <a class="mdl-navigation__link" href="targil.aspx">תרגיל</a>
        <a class="mdl-navigation__link" href="upload.aspx">העלאת תרגיל </a> 
        <a class="mdl-navigation__link" href="login.aspx">התחברות</a>
        <a class="mdl-navigation__link" href="signup.aspx">הרשמה</a>
      </nav>
    </div>
  </header>
  <div class="mdl-layout__drawer" style="font-family: 'Heebo', sans-serif; font-weight:300;">
    <span class="mdl-layout-title"><img src="media/LOGO.png" style="height:10% ; width: 10%; position:absolute;"/></span>
    <nav class="mdl-navigation">
      <a class="mdl-navigation__link" href="home.aspx">בית</a>
        <a class="mdl-navigation__link" href="culture.aspx">המובילים</a>
        <a class="mdl-navigation__link" href="targil.aspx">תרגיל</a>
        <a class="mdl-navigation__link" href="upload.aspx">העלאת תרגיל </a> 
        <a class="mdl-navigation__link" href="login.aspx">התחברות</a>
        <a class="mdl-navigation__link" href="signup.aspx">הרשמה</a>
    </nav>
  </div>
    </body>
    </html>