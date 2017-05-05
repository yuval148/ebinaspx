
<!doctype html>
<html dir="rtl">
    <head> 
    <!-- ver 004.010.008--!>
        <!--mobile confg-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <!--handlebars-->
        <script src="js/main.js"></script>
        <script src="js/handlebars-v4.0.5.js"></script>
        <!--javascript & css-->
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Heebo:300,500,700,900&amp;subset=hebrew">
        <script defer src="https://code.getmdl.io/1.2.1/material.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
        <!--colors-->
        <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.red-pink.min.css" />
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
      <span class="mdl-layout-title"></span><img src="media/LOjGO.png" style="height:45% ; width:128px;"/>
      <!-- Add spacer, to align navigation to the right -->
      <!-- Navigation. We hide it in small screens. -->
      <nav class="mdl-navigation mdl-layout--large-screen-only">
        <a class="mdl-navigation__link" href="homeT.aspx">בית</a>
          <div class="w3-dropdown-hover w3-right" >
               <button class="w3-button" style="font-family:Heebo; font-weight:500">דוחות</button>
                    <div class="w3-dropdown-content w3-bar-block w3-card-4">
                        <a class="w3-bar-item w3-button" href="topsT.aspx">מצב הנקודות</a>
                        <a class="w3-bar-item w3-button" href="studentT.aspx">צפייה בתלמיד</a>
                        <a class="w3-bar-item w3-button" href="kitaT.aspx">צפייה בכיתה</a>
                        <a class="w3-bar-item w3-button" href="tatmT.aspx">צפייה במאגר התרגילים האישי</a>
                        <a class="w3-bar-item w3-button" href="maagarT.aspx">צפייה בכל התרגילים בנושא</a>
                        </div>
              </div>
        <a class="mdl-navigation__link" href="DistributT.aspx">הפצת תרגילים</a>
        <a class="mdl-navigation__link" href="uploadT.aspx">העלאת תרגיל </a> 
        <a class="mdl-navigation__link" href="msgT.aspx">הפצת הודעות</a>
        <a class="mdl-navigation__link" href="loginT.aspx">התחברות</a>
      </nav>
    </div>
  </header>
  <div class="mdl-layout__drawer" style="font-family: 'Heebo', sans-serif; font-weight:300;">
    <span class="mdl-layout-title"><img src="media/LOGO.png" style="height:10% ; width: 10%; position:absolute;"/></span>
    <nav class="mdl-navigation">
      <a class="mdl-navigation__link" href="homeT.aspx">בית</a>
          <div class="w3-dropdown-hover w3-right" >
               <button class="w3-button" style="font-family:Heebo; font-weight:500">דוחות</button>
                    <div class="w3-dropdown-content w3-bar-block w3-card-4">
                        <a class="w3-bar-item w3-button" href="topsT.aspx">מצב הנקודות</a>
                        <a class="w3-bar-item w3-button" href="studentT.aspx">צפייה בתלמיד</a>
                        <a class="w3-bar-item w3-button" href="kitaT.aspx">צפייה בכיתה</a>
                        <a class="w3-bar-item w3-button" href="tatmT.aspx">צפייה במאגר התרגילים האישי</a>
                        <a class="w3-bar-item w3-button" href="maagarT.aspx">צפייה בכל התרגילים בנושא</a>
                        </div>
              </div>
        <a class="mdl-navigation__link" href="DistributT.aspx">הפצת תרגילים</a>
        <a class="mdl-navigation__link" href="uploadT.aspx">העלאת תרגיל </a> 
        <a class="mdl-navigation__link" href="msgT.aspx">הפצת הודעות</a>
        <a class="mdl-navigation__link" href="loginT.aspx">התחברות</a>
    </nav>
  </div>
    </body>
    </html>