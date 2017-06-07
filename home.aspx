<%@ Page Language="C#" CodeFile="home.aspx.cs" Inherits="home" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<!--#include file="upper.aspx"-->
<!doctype html>
<html dir="rtl">
    <head>
        <title>פלייגראונד-בית</title>         
        <link rel="stylesheet" href="css/circle.css">
        <link href="css/home.css" rel="stylesheet" /> 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery.perfect-scrollbar/0.6.10/css/perfect-scrollbar.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.perfect-scrollbar/0.6.10/js/perfect-scrollbar.jquery.js"></script>
    </head>
    <body>
        <div class="w3-row w3-mobile" id="page-wrap">
            <div id="welcome" class="w3-container w3-row w3-mobile w3-white w3-card w3-cell w3-quarter">
                <div id="a" class="w3-third">    
                    <header class="w3-container w3-center">
                        <h5> שליטה כללית בחומר</h5>
                    </header> 
                    <div id="master-div" class="w3-container w3-panel">
                           
                    </div>
                    <footer class="w3-container">
                            
                    </footer>        
                 </div>                 
                 <div id="b" class="w3-twothird w3-contanier w3-display-container">    
                   <h2 id="hh2">ברוכים הבאים לפלייגרואנד!</h2>
                     <h5 style="font-style: italic">מערכת לימודית שעוצבה לתלמידים, על ידי תלמידים.</h5>
                     <p >שחקו ושפרו את שליטכם בחומר הנלמד בכיתה ועזרו לקבוצה שלכם להגיע לראש טבלת המובילים!
                            הפלייגראונד נועד לעזור לך לתרגל, ללמוד, ולשפר את החוויה הלימודית שלך.                   
                     </p><br>
                    <img id="logo"  class="w3-display-bottomleft w3-panel" src="media/LOGO1b.png" />

                 </div>         
             </div>             
                <div id="pro-div" style="font-family:'Heebo'"></div>
                <br />
                <br />
            <!--מכאן!-->
            <div id="subs" class="w3-container w3-mobile w3-threequarter">
                <h2 style="font-family:'Heebo';font-weight:900;font-size:45px">נושאים</h2><hr />
                <div class="w3-cell-row" id="sub-div"></div>
            </div>
                              <div id="not-div"></div>

                        <!--מכאן!-->
                <script src="js/handlebars-v4.0.5.js"></script>
            <script id="not-temp" type="text/x-handlebars-template">
                 <div id="notifications">
                    <h3>התראות</h3>
                    <div style="height:300px;padding:8px;">
                           {{#each_upto sub 6}}
                              <div class="noti-div">
                                  <i style="float:right" class="material-icons">{{icon}}</i><span>{{title}}</span>
                                <span style="color:#9e9e9e; font-size:10px;"> {{datec}}</span>
                                  <hr />
                              </div>                         
                        {{/each_upto}}
                    </div>
                    <div class="seeAll"><a href="#">הראה את כולם</a></div>
                </div>
            </script>
            <script id="master-temp" type="text/x-handlebars-template">
                 <div id="master" class="c100 dark small p<%=Session["shlita"] %> {{GetMasterColor <%=Session["shlita"] %>}} center" > <!-- צריך לחלק פה סאיו בסיתרגיל! !-->
                                <span><%=Session["shlita"] %>%</span>
                                <div class="slice">
                                    <div class="bar"></div>
                                    <div class="fill"></div>
                                </div>
                            </div>
            </script>
                <script id="sub-temp" type="text/x-handlebars-template">
                    {{#each sub}}
                    <div class="sub w3-quarter w3-card w3-container w3-cell w3-center w3-mobile w3-white" style="background-size:cover; background-position: center; 
background-image: url(../media/new/{{subjectID}}.png);border-top:solid #{{GetMasterColor2 (GetMasterPrecent cou ctargil)}} 7.5px">
                        <header class="w3-container w3-center">
                            <h2 class="subH">{{subject}}</h2>
                        </header>
                        <div class="w3-container w3-center">                            
                            <div class="c100 small p{{GetMasterPrecent cou ctargil}} {{GetMasterColor (GetMasterPrecent cou ctargil)}} center" > <!-- צריך לחלק פה סאיו בסיתרגיל! !-->
                                <span>{{GetMasterPrecent cou ctargil}}%</span>
                                <div class="slice">
                                    <div class="bar"></div>
                                    <div class="fill"></div>
                                </div>
                            </div>
                            <br />
                            <span style="font-family:Heebo;font-size:15px;color:#ffffff">נותרו {{GetLeft cou ctargil}} תרגילים</span>
                            <hr />
                        </div>
                        <footer class="w3-container w3-center">
                           <a href="targil{{subjectID}}.aspx" style="color:white" class="w3-button w3-hover-indigo">לתרגילים</a>
                         </footer>
                    </div>
                    {{/each}}
                </script>
                <script id="pro-temp" type="text/x-handlebars-template">
                    {{#each sub}}
                    <div class="w3-container w3-mobile w3-center w3-white w3-card w3-cell w3-quarter">
                        <img src="{{pic}}" id="img" class="img-circle">
                        <div>
                            <span style="font-size:20px; font-weight:bold"> {{name}} </span><hr /><br>
                            <span style="font-size:20px; line-height:70%" >קבוצת  {{team}} </span><hr /> <br>
                            <div class="w3-light-grey w3-round-xlarge">
                                <div class="w3-container w3-indigo w3-round-xlarge" id=progi style="width:25%" runat="server"><%=prog.ToString()%>%</div>
                            </div><br />                                
                            <span style="font-size:20px;line-height:20%"> {{xpp}} נקודות</span><br>
                            <span style="font-size:10px;line-height:20%"> <%=tilnext.ToString()%> נקודות עד הרמה הבאה</span>
                            <hr /> <br>
                            <span style="font-size:20px; line-height:80%" >שלב  <span class="mdl-badge" data-badge="{{GetLevel xpp}}"></span> </span><hr /> <br>
                            <span style="font-size:20px; line-height:80%" >{{kita}}<br><br></span>
                        </div>
                    </div>
                    {{/each}}
                </script>
                <script id="mes-temp" type="text/x-handlebars-template">
                    <div style="float:right;margin-top:10px;margin-bottom:10px" class="w3-container w3-white w3-card w3-quarter">
                        <h3 style="font-family:'Heebo';font-weight:700; text-align:center;">הודעות</h3>
                        <hr>
                        {{#each sub}}
                             <div id="{{title}}" style="display:{{CheckClass kita title}};">
                            <div class="w3-padding-16">
                                <i class="material-icons">{{icon}}</i>
                                <span class="w3-large">{{title}}</span><br>
                                <span>{{msg}}</span>,
                                <span style="color:#3f51b5">{{kita}}</span><br>
                                <span style="color:#9e9e9e; font-size:10px;">{{datec}}</span>
                                <span style="color:#9e9e9e; font-size:10px;">{{byy}}</span>
                                
                            </div>
                            </div>
                        {{/each}}
                    </div> 
                </script>
                <script type="text/javascript">
                    var data = '<ul><li id="noti_Container"><div id="noti_Counter"></div><div id="noti_Button"></div></li></ul>';
                    $(data).insertAfter($("#after"));
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
                        var subInfo = document.getElementById("sub-temp").innerHTML;
                        var subTemplate = Handlebars.compile(subInfo);
                        var subData = subTemplate(<%=this.json%>);
                        document.getElementById("sub-div").innerHTML += subData;
                        
                        var proInfo = document.getElementById("pro-temp").innerHTML;
                        var proTemplate = Handlebars.compile(proInfo);
                        var proData = proTemplate(<%=this.jsonPro%>);
                        document.getElementById("pro-div").innerHTML += proData;
                        var img = document.getElementById("img").src;
                        $('<img style="width:23px;height:23px;line-height:23px;border-radius:50%;margin-top:5px" src="' + img + '"/>').appendTo("#noti_Button");

                        var mesInfo = document.getElementById("mes-temp").innerHTML;
                        var mesTemplate = Handlebars.compile(mesInfo);
                        var mesData = mesTemplate(<%=this.jsonMes%>);
                        document.getElementById("pro-div").innerHTML += mesData;

                        var notInfo = document.getElementById("not-temp").innerHTML;
                        var notTemplate = Handlebars.compile(notInfo);
                        var notData = notTemplate(<%=this.jsonnotifi%>);
                        document.getElementById("not-div").innerHTML += notData;

                        var masterInfo = document.getElementById("master-temp").innerHTML;
                        var masterTemplate = Handlebars.compile(masterInfo);
                        var masterData = masterTemplate(<%=this.jsonPro%>);
                    document.getElementById("master-div").innerHTML += masterData;
                        if ("<%=Session["userName"]%>" != null)
                        {
                            document.getElementById("login").innerHTML="התנתק";  
                            document.getElementById("signup").style.display="none"
                        }
                    var x;
                    function isEmpty(el) {
                        return !$.trim(el.html())
                    }
                    if (isEmpty($('#sub-div'))) {
                        var data = "לא נמצאו תרגילים כרגע";
                        var dataLight = "הרבה לא יודעים אבל השטח פרסום הזה למכירה.";
                        document.getElementById("sub-div").innerHTML = "<h2 style='font-family:Heebo; color:#888888;font-weight:300'>" + dataLight + "</h2>";
                        document.getElementById("sub-div").innerHTML += "<h1 style='font-family:Heebo; color:#888888'>" + data + "</h1>";
                    }
                    $(document).ready(function () {

                        // ANIMATEDLY DISPLAY THE NOTIFICATION COUNTER.
                        $('#noti_Counter')
                            .css({ opacity: 0 })
                            .text('<%=this.notifi.ToString()%>')// ערך דינמי
                            .css({ top: '-10px' })
                            .animate({ top: '-2px', opacity: 1 }, 500);

                        $('#noti_Button').click(function () {

                            $('#notifications').fadeToggle('fast', 'linear', function () {
                                if ($('#notifications').is(':hidden')) {
                                    $('#noti_Button').css('background-color', '#2E467C');
                                }
                                else $('#noti_Button').css('background-color', '#FFF');
                            });

                            $('#noti_Counter').fadeOut('slow');                

                            return false;
                        });

                        $(document).click(function () {
                            $('#notifications').hide();

                            if ($('#noti_Counter').is(':hidden')) {
                                $('#noti_Button').css('background-color', '#2E467C');
                            }
                        });

                        $('#notifications').click(function () {
                            return false; 
                        });
                    });
                    $('#notifications').perfectScrollbar();
                </script>                
        </div>    
</body>
</html>