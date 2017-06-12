<%@ Page Language="C#" CodeFile="homeT.aspx.cs" Inherits="homeT" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
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
      <header class="header black-bg-t">
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
                            <span id="notBadge" class="badge bg-theme"><!--< %=this.notifi.ToString()%> !--></span>
                        </a>
                        <ul id="not-div" class="dropdown-menu extended inbox"></ul>
                    </li>
                    <!-- inbox dropdown end -->
                </ul>
                <!--  notification end -->
            </div>
            <div class="top-menu">
            	<ul class="nav pull-left top-menu">
                    <li><a class="logout-t" href="login.aspx">התנתק</a></li>
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
                  
						
                  <div id="sub-div" class="col-lg-9 main-chart">

                      <div class="row mtbox">
                  		<div class="col-md-2 col-sm-2 col-md-offset-1 box0">
                  			<div class="box1">
					  			<span class="lnr lnr-map"></span>
					  			<h3>אירועים</h3>
                  			</div>
					  			<p>טיול שנתי 27/10/2017</p>
                              	<p>מוזיאון תל אביב לאומנות כותב שם ממש ארוך לבדוק מה יקרה 27/10/2017</p>
                  		</div>
                  		<div class="col-md-2 col-sm-2 box0">
                  			<div class="box1">
					  			<span class="lnr lnr-graduation-hat"></span>
					  			<h3>מבחנים</h3>
                  			</div>
					  			<p>שכבת יב - מתמטיקה</p>
                                <p>שכבת יב - מתמטיקה</p>
                                <p>שכבת יב - מתמטיקה</p>
                                <p>שכבת יב - מתמטיקה</p>
                                <p>שכבת יב - מתמטיקה</p>
                  		</div>
                  		<div class="col-md-2 col-sm-2 box0">
                  			<div class="box1">
					  			<span class="lnr lnr-star"></span>
					  			<h3>אלגברה</h3>
                  			</div>
					  			<p>המקצוע הכי טוב שלך הוא אלגברה!</p>
                  		</div>
                  		<div class="col-md-2 col-sm-2 box0">
                  			<div class="box1">
					  			<span class="lnr lnr-sad"></span>
					  			<h3>פרבולות</h3>
                  			</div>
					  			<p>נראה שאתה מסתבך טיפה עם פרבולות</p>
                  		</div>
                  		<div class="col-md-2 col-sm-2 box0">
                  			<div class="box1">
					  			<span class="lnr lnr-star-half"></span>
					  			<h3><!-- < %=tilnext.ToString()%>!--></h3>
                  			</div>
					  			<!-- <p>רק < %=tilnext.ToString()%> נקודות עד הרמה הבאה!</p>!-->
                  		</div>
                  	
                  	</div><!-- /row mt -->	
                  </div>
                  <!-- **********************************************************************************************************************************************************
      RIGHT SIDEBAR CONTENT
      *********************************************************************************************************************************************************** -->                  
                  <div class="col-lg-3 ds">
                      <div id="mes-div">
                      </div>

                      <!-- 
                       <!-- USERS ONLINE SECTION 
						<h3>TEAM MEMBERS</h3>
                      <!-- First Member 
                      <div class="desc">
                      	<div class="thumb">
                      		<img class="img-circle" src="assets/img/ui-divya.jpg" width="35px" height="35px" align="">
                      	</div>
                      	<div class="details">
                      		<p><a href="#">DIVYA MANIAN</a><br/>
                      		   <muted>Available</muted>
                      		</p>
                      	</div>
                      </div>
                      <!-- Second Member
                      <div class="desc">
                      	<div class="thumb">
                      		<img class="img-circle" src="assets/img/ui-sherman.jpg" width="35px" height="35px" align="">
                      	</div>
                      	<div class="details">
                      		<p><a href="#">DJ SHERMAN</a><br/>
                      		   <muted>I am Busy</muted>
                      		</p>
                      	</div>
                      </div>
                      <!-- Third Member
                      <div class="desc">
                      	<div class="thumb">
                      		<img class="img-circle" src="assets/img/ui-danro.jpg" width="35px" height="35px" align="">
                      	</div>
                      	<div class="details">
                      		<p><a href="#">DAN ROGERS</a><br/>
                      		   <muted>Available</muted>
                      		</p>
                      	</div>
                      </div>
                      <!-- Fourth Member 
                      <div class="desc">
                      	<div class="thumb">
                      		<img class="img-circle" src="assets/img/ui-zac.jpg" width="35px" height="35px" align="">
                      	</div>
                      	<div class="details">
                      		<p><a href="#">Zac Sniders</a><br/>
                      		   <muted>Available</muted>
                      		</p>
                      	</div>
                      </div>
                      <!-- Fifth Member
                      <div class="desc">
                      	<div class="thumb">
                      		<img class="img-circle" src="assets/img/ui-sam.jpg" width="35px" height="35px" align="">
                      	</div>
                      	<div class="details">
                      		<p><a href="#">Marcel Newman</a><br/>
                      		   <muted>Available</muted>
                      		</p>
                      	</div>
                      </div>
                      -->
                      

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
                <script src="js/handlebars-v4.0.5.js"></script>
                  <script id="modal-temp" type="text/x-handlebars-template">
                      <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						        <h4 class="modal-title" id="myModalLabel">דו קרב</h4>
						      </div>
						      <div class="modal-body">
                                  <span>הזמן את חבריך לדו קרב</span>
                                  <div class="content-panel">
	                          <table class="table table-hover">
	                  	  	  <h4>Hover Table</h4><i class="fa fa-user-plus"></i>
	                  	  	  <hr>
	                              <thead>
	                              <tr>
	                                  <th>#</th>
	                                  <th>שם</th>
	                                  <th>רמה</th>
	                                  <th>עמודה שלישית</th>
	                              </tr>
	                              </thead>
	                              <tbody>
                                    {{#each sub}}
	                              <tr>
	                                  <td>1</td>
	                                  <td>Mark</td>
	                                  <td>Otto</td>
	                                  <td>@mdo</td>
                                      <td><button type="button" class="list-group-item btn-play">שחק עם Mark</button></td>
	                              </tr>
                                      {{/each}}
	                              </tbody>
	                          </table>
	                  	  </div>
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-default" data-dismiss="modal">סגור</button>
						      </div>
						    </div>
						  </div>
						</div> 
                  </script>
            <script id="taskbar-temp" type="text/x-handlebars-template">
                <div class="notify-arrow notify-arrow-green"></div>
                            <li>
                                <p class="green">יש לך 4 משימות שלא הושלמו</p>
                            </li>
                            {{#each sub}}
                            <li>
                                <a href="home.aspx#">
                                    <div class="task-info">
                                        <div class="desc">DashGum Admin Panel</div>
                                        <div class="percent">40%</div>
                                    </div>
                                    <div class="progress progress-striped">
                                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                            <span class="sr-only">40% Complete (success)</span>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            {{/each}}
                            <li class="external">
                                <a href="#">See All Tasks</a>
                            </li>
            </script>
            <script id="not-temp" type="text/x-handlebars-template">
                <li>
                  <!--  <p style="text-align:right;" class="green">יש לך < %=this.notifi.ToString()%> התראות חדשות</p>!-->
                </li>
                {{#each_upto sub 6}}
                <li>
                    <a href="home.aspx#">
                       <span class="photo"><i class="material-icons" style="font-size:15px">{{icon}}</i></span>
                        <span class="subject">
                            <span class="from" style="font-family:Rubik;font-weight:700;text-align:right">{{title}}</span><br />
                            <span class="time" style="font-family:Rubik;font-weight:300">{{datec}}</span>
                        </span>
                        <span class="message">
                        </span>
                    </a>
                </li> 
                {{/each_upto}}    
            </script>
                <script id="pro-temp" type="text/x-handlebars-template">
                    
                    {{#each sub}}
                    <p class="centered"><img src="media/pic/{{pic}}" class="img-circle" width="60"></p>
              	    <h5 class="centered" style="font-family:Rubik;font-weight:700; font-size:20px">{{name}}</h5>
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
                            <i class="fa fa-desktop"></i>
                            <span>UI Elements</span>
                        </a>
                        <ul class="sub">
                            <li><a  href="general.html">General</a></li>
                            <li><a  href="buttons.html">Buttons</a></li>
                            <li><a  href="panels.html">Panels</a></li>
                        </ul>
                    </li>
                    

                    {{/each}}
                </script>
                <script id="mes-temp" type="text/x-handlebars-template">
                    	<h3 style="font-family:Rubik;font-weight:900;font-size:25px">הודעות</h3>
                        {{#each sub}}
                    <div id="{{title}}" style="display:{{CheckClass kita title}}">
                        <div class="desc" >
                      	    <div class="thumb">
                      		    <span class="badge bg-theme"><i class="material-icons" style="font-size:15px">{{icon}}</i></span>
                      	    </div>
                      		<p style="font-family:Rubik;font-weight:700;text-align:right">{{title}}<br/>
                      		   <p style="font-family:Rubik;font-weight:500">{{msg}}</p>
                                  <p style="font-family:Rubik;font-weight:400">{{kita}}</p>
                               <p style="font-family:Rubik;font-weight:300">{{byy}},  {{datec}}  </p>                    		
                      		</p>
                      	</div>
                      </div>
                    </div>
                        {{/each}}
              </script>
              </section>
            <!-- js placed at the end of the document so the pages load faster -->
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/jquery-1.8.3.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="assets/js/jquery.scrollTo.min.js"></script>
    <script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>
    <script src="assets/js/jquery.sparkline.js"></script>


    <!--common script for all pages-->
    <script src="assets/js/common-scripts.js"></script>
    
    <script type="text/javascript" src="assets/js/gritter/js/jquery.gritter.js"></script>
    <script type="text/javascript" src="assets/js/gritter-conf.js"></script>

    <!--script for this page-->
    <script src="assets/js/sparkline-chart.js"></script>    
	<script src="assets/js/zabuto_calendar.js"></script>	
	
	<script type="text/javascript">
        /*
        $(document).ready(function () {
        var unique_id = $.gritter.add({
            // (string | mandatory) the heading of the notification
            title: 'ליונתן היה ממש משעמם!',
            // (string | mandatory) the text inside the notification
            text: 'ההתראה הזאת יכולה להישאר פה עד שסוגרים אותה או אחרי כמה שניות! דרך אגב ממש צריך לסדר את הפונטים בעברית',
            // (string | optional) the image to display on the right
            image: 'media/0pres.png',
            // (bool | optional) if you want it to fade out on its own or just sit there
            sticky: false,
            // (int | optional) the time you want it to be alive for before fading out
            time: '10000',
            // (string | optional) the class name you want to apply to that specific message
            class_name: 'my-sticky-class',
            position: 'top-left',
        });

        return false;
        });
        */
	</script>
	
	<script type="application/javascript">
        $(document).ready(function () {
            $("#date-popover").popover({html: true, trigger: "manual"});
            $("#date-popover").hide();
            $("#date-popover").click(function (e) {
                $(this).hide();
            });
        
            $("#my-calendar").zabuto_calendar({
                action: function () {
                    return myDateFunction(this.id, false);
                },

                action_nav: function () {
                    return myNavFunction(this.id);
                },
                ajax: {
                    url: "show_data.php?action=1",
                    modal: true
                },
                legend: [
                    {type: "text", label: "Special event", badge: "00"},
                    {type: "block", label: "Regular event", }
                ]
            });
        });
        
        
        function myNavFunction(id) {
            $("#date-popover").hide();
            var nav = $("#" + id).data("navigation");
            var to = $("#" + id).data("to");
            console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
        }
    </script>
                <script type="text/javascript">
                    var data = '<ul><li id="noti_Container"><div id="noti_Counter"></div><div id="noti_Button"></div></li></ul>';
                    Handlebars.registerHelper('CheckClass', function (kita,title){
                        var kita = kita.split(",");
                        var Mykita = "<%=Session["kita"]%>";
                        for (var i = 0; i < kita.length; i++) {
                            if(kita[i] == Mykita){
                                return "initial";
                                break;
                            }
                        }
                        return "none";      
                    });
                    Handlebars.registerHelper('each_upto', function (ary, max, options) {
                        if (!ary || ary.length == 0)
                            return options.inverse(this);

                        var result = [];
                        for (var i = 0; i < max && i < ary.length; ++i)
                            result.push(options.fn(ary[i]));
                        return result.join('');
                    });
                    Handlebars.registerHelper('GetMasterColor', function(master) {
                            if (master<25){
                                return "red";
                            }
                            else if (master<50){
                                return "orange";
                            }
                            else if (master<75){
                                return "yellow";
                            }
                            else if (master>=75){
                                return "green";
                            }
                    });
                    Handlebars.registerHelper('GetMasterColor2', function (master) {
                        if (master < 25) {
                            return "e53935";
                        }
                        else if (master < 50) {
                            return "ff6d00";
                        }
                        else if (master < 75) {
                            return "fbc02d";
                        }
                        else if (master >= 75) {
                            return "5fd400";
                        }
                    });
                    Handlebars.registerHelper('GetMasterColorClass', function (master) {
                        if (master < 25) {
                            return "c100r";
                        }
                        else if (master < 50) {
                            return "c100y";
                        }
                        else if (master < 75) {
                            return "c100o";
                        }
                        else if (master >= 75) {
                            return "c100g";
                        }
                    });
                    Handlebars.registerHelper('GetMasterPrecent', function (cou, ctargil) {
                        var pre = parseInt(cou) / parseInt(ctargil);
                        var final = pre * 100;
                        return parseInt(final);

                    });
                    Handlebars.registerHelper('GetLeft', function (cou, ctargil) {
                        var left = parseInt(ctargil) - parseInt(cou);
                        return parseInt(left);
                    });
                    Handlebars.registerHelper('GetLevel', function (xp) {
                        if (xp >= 0 && xp < 100)
                        {
                            r = 1;
                        }
                        if (xp >= 100 && xp < 250)
                        {
                            r = 2;
                        }
                        if (xp >= 250 && xp < 500)
                        {
                            r = 3;
                        }
                        if (xp >= 500 && xp < 900)
                        {
                            r = 4;
                        }
                        if (xp >= 900 && xp < 1450)
                        {
                            r = 5;
                        }
                        return r;
                    });
                    var proInfo = document.getElementById("pro-temp").innerHTML;
                    var proTemplate = Handlebars.compile(proInfo);
                    var proData = proTemplate(<%=this.jsonPro%>);
                    document.getElementById("nav-accordion").innerHTML += proData;
                    /*
                        var subInfo = document.getElementById("sub-temp").innerHTML;
                        var subTemplate = Handlebars.compile(subInfo);
                        var subData = subTemplate(< %=this.json%>);
                        document.getElementById("sub-div").innerHTML += subData;
                        
                        

                        var mesInfo = document.getElementById("mes-temp").innerHTML;
                        var mesTemplate = Handlebars.compile(mesInfo);
                        var mesData = mesTemplate(< %=this.jsonMes%>);
                    document.getElementById("mes-div").innerHTML += mesData;

                        var notInfo = document.getElementById("not-temp").innerHTML;
                        var notTemplate = Handlebars.compile(notInfo);
                        var notData = notTemplate(< %=this.jsonnotifi%>);
                        document.getElementById("not-div").innerHTML += notData;
                      // document.getElementById("not-div").innerHTML += notData;

                        /*var masterInfo = document.getElementById("master-temp").innerHTML;
                        var masterTemplate = Handlebars.compile(masterInfo);
                        var masterData = masterTemplate(< %=this.jsonPro%>);
                        document.getElementById("master-div").innerHTML += masterData;
                        
                        var taskbarInfo = document.getElementById("taskbar-temp").innerHTML;
                        var taskbarTemplate = Handlebars.compile(taskbarInfo);
                        var taskbarData = taskbarTemplate(< %=this.json%>);
                    document.getElementById("taskbar-ul").innerHTML += taskbarData;

                    var modalInfo = document.getElementById("modal-temp").innerHTML;
                    var modalTemplate = Handlebars.compile(modalInfo);
                    var modalData = modalTemplate(< %=this.json%>);
                    document.getElementById("modal-div").innerHTML += modalData;
                        if ("< %=Session["userName"]%>" != null)
                        {
                            
                        }
                    var x;
                    function isEmpty(el) {
                        return !$.trim(el.html())
                    }
                    $(document).ready(function () {
                        if (document.getElementById('notBadge').innerHTML == 0) {
                            document.getElementById('notBadge').style.display = 'none';
                        }
                    });
                    */
                </script>                
              </section> 
          </section>    
</body>
</html>