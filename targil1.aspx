<%@ Page Language="C#" AutoEventWireup="true" CodeFile="targil1.aspx.cs" Inherits="targil1" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="Newtonsoft" %>
<!DOCTYPE html>
<html lang="heb" dir="rtl">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>Playground</title>

    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="//cdn.rawgit.com/morteza/bootstrap-rtl/v3.3.4/dist/css/bootstrap-rtl.min.css">

    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="assets/css/zabuto_calendar.css">
    <link rel="stylesheet" type="text/css" href="assets/js/gritter/css/jquery.gritter.css" />
    <link rel="stylesheet" type="text/css" href="assets/lineicons/style.css">    
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
    <link href="css/circle.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">

    <!-- Custom styles for this template -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">

    <script src="assets/js/chart-master/Chart.js"></script>
    
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
 <body style="font-family:Rubik">
  <section id="container" >
      <!-- **********************************************************************************************************************************************************
      TOP BAR CONTENT & NOTIFICATIONS
      *********************************************************************************************************************************************************** -->
      <!--header start-->
      <header class="header black-bg">
              <div class="sidebar-toggle-box">
                  <div class="fa fa-bars tooltips" style="color:#ffffff!important" data-placement="left" data-original-title="הסתר פרופיל"></div>
              </div>
            <!--logo start-->
            <a href="home.aspx" class="logo"><img src="media/LOGOr.png" style="float:right; width:170px;" /></a>
            <!--logo end-->
            <div class="nav notify-row" id="top_menu">
                <!--  notification start -->
                <ul class="nav top-menu">
                    <!-- settings start -->
                    <li class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="home.aspx#">
                            <i class="material-icons">toc</i>
                            <span class="badge bg-theme">4</span>
                        </a>
                        <ul id="taskbar-ul" class="dropdown-menu extended tasks-bar">
                            
                        </ul>
                    </li>
                    <!-- settings end -->
                    <!-- inbox dropdown start-->
                    <li id="header_inbox_bar" class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="home.aspx#">
                            <i class="material-icons">notifications</i>
                            <span id="notBadge" class="badge bg-theme">2</span>
                        </a>
                        <ul id="not-div" class="dropdown-menu extended inbox"></ul>
                    </li>
                    <!-- inbox dropdown end -->
                </ul>
                <!--  notification end -->
            </div>
            <div class="top-menu">
            	<ul class="nav pull-left top-menu">
                    <li><a class="logout" href="login.aspx">התנתק</a></li>
            	</ul>
            </div>
        </header>
      <!-- **********************************************************************************************************************************************************
      MAIN SIDEBAR MENU
      *********************************************************************************************************************************************************** -->
      <!--sidebar start-->
      <aside>
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu" id="nav-accordion">        
              	  <p class="centered"><img src="media/pic/314668690.png" class="img-circle" width="60"></p>
              	    <h5 class="centered" style="font-family:Rubik;font-weight:700; font-size:20px">יובל מרגלית</h5>
                    <div class="progress" style="margin:5px">
						  <div class="progress-bar progress-bar-info" role="progressbar" id=progi runat="server" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 75%">
						  </div>
						</div>
                    <h5 class="centered" style="font-family:Rubik;font-size:15px;line-height:20%;font-weight:400">נותרו עוד 2 תרגילים בפרבולות</h5>             	  	
                    <li class="mt">
                      <a class="active" href="home.aspx">
                          <i class="fa fa-home"></i>
                          <span>דף הבית</span>
                      </a>
                    </li>
                    <li style="cursor:pointer" class="ml">
                    <a  data-toggle="modal" data-target="#myModal">
                            <i class="fa fa-trophy"></i>
                            <span>דו קרב</span>
                    </a>
                    </li>
                        <li class="sub-menu">
                        <a href="javascript:;" >
                            <i class="fa fa-group"></i>
                            <span>הקבוצה שלי</span>
                        </a>
                        <ul class="sub">
                            <li><a  href="general.html">General</a></li>
                            <li><a  href="buttons.html">Buttons</a></li>
                            <li><a  href="panels.html">Panels</a></li>
                        </ul>
                    </li>
              </ul>
              <!-- sidebar menu end-->
          </div>
      </aside>
      <!--sidebar end--> 
      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
      <!--main content start-->
        <section id="main-content">
            <section class="wrapper">
                <div class="row">
			        <div id="modal-div"></div>		
                    <div class="col-lg-9 main-chart">
                         <div id="exercise" class="w3-card w3-panel"></div><br />
                         <button class="btn btn-default"><a href="#">מתקשה עם התרגיל? שלח/י הודעה למורה</a></button>
                         <button class="btn btn-default"><a href="#">בקש עזרה מחברים</a></button>
                        <hr />
        <div class="row">
            <form class="col-lg-9"id="ans">
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                        <input class="mdl-textfield__input" type="text" pattern="-?[0-9]*(\.[0-9]+)?" id="numb">
                            <label class="mdl-textfield__label" for="sample4">הכנס ערך X</label>
                    </div>
                </form>
            <div id="ansBtn" dir="ltr"  class="col-lg-3" style="width:auto">
                    <button class="btn" id="skip">דלג</button>
                    <button id="Btn" class="btn btn-default" type="button">בדוק תשובה</button>             
            </div>
              
        </div>
                    </div>
       
        
     <!--             
<div id="modal">
    <div id="id01" class="w3-modal w3-animate-opacity w3-center">
    <div class="w3-modal-content w3-card-4">
      <header class="w3-container w3-indigo"> 
        <span onclick="document.getElementById('id01').style.display='none'" 
        class="w3-button w3-display-topright">&times;</span>
        <h2>תשובה נכונה!</h2>
      </header>
      <div class="w3-container">
        <p>כל הכבוד! עבודה קשה משתלמת</p>
      </div>
      <footer class="w3-container w3-indigo">
   <button class="w3-button w3-indigo w3-hover-indigo" id="next">לתרגיל הבא</button>      
      </footer>
    </div>
  </div>
         <div id="id02" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-center">
      <header class="w3-container w3-red"> 
        <span onclick="document.getElementById('id02').style.display='none'" 
        class="w3-button w3-display-topright">&times;</span>
        <h2>תשובה שגויה</h2>
      </header>
      <div class="w3-container">
        <p>לא נורא, תמיד אפשר לנסות שוב!</p>
      </div>
      <footer class="w3-container w3-red">
          <button class="w3-button" id="skip2">נסה שוב</button>      

      </footer>
    </div>
  </div>
    </div>
        </div> !-->
                <!-- **********************************************************************************************************************************************************
      RIGHT SIDEBAR CONTENT
      *********************************************************************************************************************************************************** -->                  
                  <div class="col-lg-3 ds">
                      <div id="infoDiv">
                      <h3 style="font-family:Rubik;font-weight:900;font-size:25px">עזרה</h3>
                          <div class="mes">
                        <div>
                            <div class="desc" >
                      	        <div class="thumb">
                      		        <span class="badge bg-theme"><i class="material-icons" style="font-size:15px">info</i></span>
                      	        </div>
                      		    <p style="font-family:Rubik;font-weight:700;text-align:right">נוסחת השורשים<br/>
                      		       <p style="font-family:Rubik;font-weight:500">שימוש בנוסחאת השורשים נעשה כאשר יש משוואה משתי מעלות</p>
                            <img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/a62e1c4fb012beb24706443a8482872d6c36b667" alt="{\displaystyle x_{1,2}={\frac {-b\pm {\sqrt {b^{2}-4ac}}}{2a}}}"/></span>
                      		    </p>
                      	    </div>
                          </div>
                              <div>
                            <div class="desc" >
                      	        <div class="thumb">
                      		        <span class="badge bg-theme"><i class="material-icons" style="font-size:15px">error_outline</i></span>
                      	        </div>
                      		    <p style="font-family:Rubik;font-weight:700;text-align:right">לא לשכוח לסדר את המשוואה<br/>
                      		       <p style="font-family:Rubik;font-weight:500">חשוב לשים לב שהמשוואה מסודרת כראוי</p>
                            <img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/23e70cfa003f402d108ec04d97983fb62f69536e" alt="{\displaystyle ax^{2}+bx+c=0}"/></span>
                      		    </p>
                      	    </div>
                          </div>
                              <div>
                            <div class="desc" >
                      	        <div class="thumb">
                      		        <span class="badge bg-theme"><i class="material-icons" style="font-size:15px">help</i></span>
                      	        </div>
                      		    <p style="font-family:Rubik;font-weight:700;text-align:right">עדיין מתקשה?<br/>
                      		       <p style="font-family:Rubik;font-weight:500">צפה בסרטון לדוגמא על הנושא</p>
                            <button class="btn pull-left btn-default"><a href="https://www.youtube.com/watch?v=38_XIEnjo80">לחץ כאן</a></button>
                      		    </p>
                      	    </div>
                          </div>
                        </div>   
              
                    
             </div>  
                  </div><!-- /col-lg-3 -->  
                    </div><!--row!-->

   <script type="text/javascript">
       var images = '';
       var nextBtn = document.querySelector("#next"); var skipBtn =document.querySelector("#skip"); var skipBtn2 =document.querySelector("#skip2");
       var imagePointer = 0; var answerPointer = 0;
       var data = (<%=this.json%>); var count = data.sub.length;
       var ans = data.sub[answerPointer].answ;
       var isC = false;
       var id=(data.sub[imagePointer].ID);

       updateImage();
       updateAnswer();
       imagePointer++;
       answerPointer++;

       function updateImage() {
           if(imagePointer >= count) imagePointer = 0;
           images = '<img class="img w3-center" src="' + data.sub[imagePointer].location+'" />';
           document.getElementById( 'exercise' ).innerHTML = images;
           //alert(exercise.innerHTML);
           id =(data.sub[imagePointer].ID);
       }
       function updateAnswer() {
           if(answerPointer >= count) answerPointer = 0;
           answers = data.sub[answerPointer].answ ; 
           ans = answers;
           //alert(ans);
       }

       nextBtn.addEventListener('click', function() {
           $( "#modal" ).click(function() {
               $( "#id01" ).fadeOut();
           });
           updateImage();
           updateAnswer();
           imagePointer++;
           answerPointer++;

       });

       skipBtn.addEventListener('click', function() {
           updateImage();
           updateAnswer();
           imagePointer++;
           answerPointer++;

       });
       skipBtn2.addEventListener('click', function() {
           $( "#modal" ).click(function() {
               $( "#id02" ).fadeOut();
           });

       });
       (function check () {
            
           var btn = document.querySelector('#Btn');
           btn.addEventListener('click', function () {
               'use strict';
               
               var x = document.getElementById("numb").value;
               if (x == ans) {
                   document.getElementById('id01').style.display='block';
                   $.ajax({
                    type: "POST",
                    url: "targil1.aspx/change",
                    data:'{"tatID":'+id+',"ID":'+<%=Session["ID"]%>+' }',
                    contentType: "application/json; charset=utf-8",
                    success: function() {
                        alert("yayyyy");
                    },
                    failure: function() {
                        alert("oy");
                    }
                });
               }
               else {
                   document.getElementById('id02').style.display='block';

               }

           });
       }());
  </script>
</body>

</html>
