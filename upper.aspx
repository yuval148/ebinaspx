
<!doctype html>
<html dir="rtl">
    <head> 
                                <!-- ver 003.009.004--!>
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
        <!--rtl-->
        <link rel="stylesheet" href="css/style.css">
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
        <a class="mdl-navigation__link" href="tops.aspx">המובילים</a>
           <div class="w3-dropdown-hover w3-right" >
               <button class="w3-button" style="font-family:Heebo; font-weight:500">תרגילים</button>
                    <div class="w3-dropdown-content w3-bar-block w3-card-4">
                        
                        <a class="w3-bar-item w3-button" href="targil1.aspx">1תרגיל</a>
                        <a class="w3-bar-item w3-button" href="targil2.aspx">2תרגיל</a>
                        <a class="w3-bar-item w3-button" href="targil3.aspx">3תרגיל</a>
                        <a class="w3-bar-item w3-button" href="targil4.aspx">4תרגיל</a>
                        <a class="w3-bar-item w3-button" href="targil5.aspx">5תרגיל</a>
                        <a class="w3-bar-item w3-button" href="targil6.aspx">6תרגיל</a>
                        <a class="w3-bar-item w3-button" href="targil7.aspx">7תרגיל</a>
                        <a class="w3-bar-item w3-button" href="targil8.aspx">8תרגיל</a>
                        <a class="w3-bar-item w3-button" href="targil9.aspx">9תרגיל</a>
                        <a class="w3-bar-item w3-button" href="targil10.aspx">10תרגיל</a>
                        <a class="w3-bar-item w3-button" href="targil11.aspx">11תרגיל</a>
                    </div>
               </div>
        <a class="mdl-navigation__link" href="login.aspx">התחברות</a>
        <a class="mdl-navigation__link" href="signup.aspx">הרשמה</a>
      </nav>
    </div>
  </header>
  <div class="mdl-layout__drawer" style="font-family: 'Heebo', sans-serif; font-weight:300;">
    <span class="mdl-layout-title"><img src="media/LOGO.png" style="height:10% ; width: 10%; position:absolute;"/></span>
    <nav class="mdl-navigation">
      <a class="mdl-navigation__link" href="home.aspx">בית</a>
        <a class="mdl-navigation__link" href="tops.aspx">המובילים</a>
         <div class="w3-dropdown-hover w3-right" >
               <button class="w3-button" style="font-family:Heebo; font-weight:500">תרגילים</button>
                    <div class="w3-dropdown-content w3-bar-block w3-card-4">
                        
                        <a class="w3-bar-item w3-button" href="targil1.aspx">1תרגיל</a>
                        <a class="w3-bar-item w3-button" href="targil2.aspx">2תרגיל</a>
                        <a class="w3-bar-item w3-button" href="targil3.aspx">3תרגיל</a>
                        <a class="w3-bar-item w3-button" href="targil4.aspx">4תרגיל</a>
                        <a class="w3-bar-item w3-button" href="targil5.aspx">5תרגיל</a>
                        <a class="w3-bar-item w3-button" href="targil6.aspx">6תרגיל</a>
                        <a class="w3-bar-item w3-button" href="targil7.aspx">7תרגיל</a>
                        <a class="w3-bar-item w3-button" href="targil8.aspx">8תרגיל</a>
                        <a class="w3-bar-item w3-button" href="targil9.aspx">9תרגיל</a>
                        <a class="w3-bar-item w3-button" href="targil10.aspx">10תרגיל</a>
                        <a class="w3-bar-item w3-button" href="targil11.aspx">11תרגיל</a>
                    </div>
               </div>
        <a class="mdl-navigation__link" href="login.aspx">התחברות</a>
        <a class="mdl-navigation__link" href="signup.aspx">הרשמה</a>
    </nav>
  </div>
    </body>
    </html>