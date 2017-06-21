<%@ Page Language="C#" AutoEventWireup="true" CodeFile="tops.aspx.cs" Inherits="tops" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<!DOCTYPE html>
<html lang="heb" dir="rtl">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">


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
                    <h5 class="centered" style="font-family:Rubik;font-size:15px;line-height:20%;font-weight:400">שבוע עד הכרזת המנצחים</h5>             	  	
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
                  <div id="sub-div" class="col-lg-9 main-chart">
	                  	<table class="w3-table-all w3-card">
            <tr>
                <th>קבוצה</th>
                <th>מספר נקודות</th>
                <th>התקדמות במשימה</th>
                <th>תמונה</th>
            </tr>
            <tr>
                <td>האריות</td>
                <td><span class="label label-success label-mini">מקום ראשון!</span>22,000</td>
                <td><div class="progress" style="margin:5px">
						  <div class="progress-bar progress-bar-info" role="progressbar" id=Div1 runat="server" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 50%">
						  </div>
						</div></td>
                <td><img src="media/lion.jpg" style="width:60px; height:60px;margin:10px;" class="w3-circle w3-center w3-half"></td>
            </tr>
           <tr>
                <td>הקואלות</td>
                <td>17,000</td>
                <td><div class="progress" style="margin:5px">
						  <div class="progress-bar progress-bar-info" role="progressbar" id=Div2 runat="server" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
						  </div>
						</div></td>
                <td><img src="media/pic/123456782.png" style="width:60px; height:60px;margin:10px;" class="w3-circle w3-center w3-half"></td>
            </tr><tr>
                <td>הארנבונים</td>
                 <td>12,500</td>
                <td><div class="progress" style="margin:5px">
						  <div class="progress-bar progress-bar-info" role="progressbar" id=Div3 runat="server" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
						</div>
						</div><span class="label label-info label-mini">סיימו את המשימה</span></td>
                <td><img src="media/pic/123456782.png"style="width:60px; height:60px;margin:10px;" class="w3-circle w3-center w3-half"></td>
            </tr>
        </table>  	  
	            </div><!--/content-panel -->
                          <div class="col-lg-3 ds">
                      <div id="mes-div">
                      </div>

                      
                       <!-- USERS ONLINE SECTION !-->
				<h3 style="font-family:Rubik;font-weight:900;font-size:25px">הקבוצה שלי</h3>
                      <!-- First Member !-->
                      <div class="desc">
                      	<div class="thumb">
                      		<img class="img-circle" src="media/pic/314668690.png" width="35px" height="35px" align="">
                      	</div>
                      	<div class="details">
                      		<p><a href="#">יובל מרגלית</a><br/>
                      		   <muted>את/ה</muted>
                      		</p>
                      	</div>
                      </div>
                      <!-- Second Member!-->
                      <div class="desc">
                      	<div class="thumb">
                      		<img class="img-circle"  src="media/pic/206592941.png" width="35px" height="35px" align="">
                      	</div>
                      	<div class="details">
                      		<p><a href="#">יונתן רביצקי</a><br/>
                      		   <muted>נראה לאחרונה לפני 20 דקות</muted>
                      		</p>
                      	</div>
                      </div>
                      <!-- Third Member!-->
                      <div class="desc">
                      	<div class="thumb">
                      		<img class="img-circle" src="media/pic/203575946.png" width="35px" height="35px" align="">
                      	</div>
                      	<div class="details">
                      		<p><a href="#">טל לווינשטיין</a><br/>
                      		   <muted>מחובר/ת</muted>
                      		</p>
                      	</div>
                      </div>
                      
                  
                     
                      

                        <!-- CALENDAR-->
                        <div id="calendar" class="mb">
                            <div class="panel green-panel no-margin">
                                <div class="panel-body">
                                    <div id="date-popover" class="popover top" style="cursor: pointer; disadding: block; margin-left: 33%; margin-top: -50px; width: 175px;">
                                        <div class="arrow"></div>
                                        <h3 class="popover-title" style="disadding: none;"></h3>
                                        <div id="date-popover-content" class="popover-content"></div>
                                    </div>
                                    <div id="my-calendar"></div>
                                </div>
                            </div>
                        </div><!-- / calendar -->
                      
                  </div><!-- /col-lg-3 -->
                                           </div>
              </section>
</section>
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
                 

   <script type="text/javascript">
       var images = '';
       var nextBtn = document.querySelector("#next"); var skipBtn =document.querySelector("#skip"); var skipBtn2 =document.querySelector("#skip2");
       var imagePointer = 0; var answerPointer = 0;
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
