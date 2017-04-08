<%@ Page Language="C#" CodeFile="home.aspx.cs" Inherits="home" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<!--#include file="upper.aspx"-->
<!doctype html>
<html dir="rtl">
    <head>
        <title>תרגולית-בית</title>         
        <link rel="stylesheet" href="css/circle.css">
        <link href="css/home.css" rel="stylesheet" />
    </head>
    <body>
            <div id="page-wrap">
                <div id="left-pro" style="font-family:'Heebo'">
                    <div id="pro" class=" mdl-card mdl-shadow--2dp">
                        <img src="media/<%=Session["pic"]%>" class="img-circle">
                        <div id="pd">
                            <span style="font-size:20px; font-weight:bold"> <%=Session["name"]%></span><hr /><br>
                            <span style="font-size:20px; line-height:70%" >קבוצת  <%=Session["team"]%> </span><hr /> <br>
                            <!-- Simple MDL Progress Bar -->
                            <div id="p1" class="mdl-progress mdl-js-progress"></div>
                                <script>
                                    document.querySelector('#p1').addEventListener('mdl-componentupgraded', function () {
                                    this.MaterialProgress.setProgress('<%=Session["prog"]%>');
                                    });
                                </script>
                                <span style="font-size:20px;line-height:20%"> <%=Session["xpp"]%> נקודות</span><hr /> <br>
                                <span style="font-size:20px; line-height:80%" >שלב  <span class="mdl-badge" data-badge="<%=Session["level"]%>"></span> </span><hr /> <br>
                                <span style="font-size:20px; line-height:80%" ><%=Session["kita"]%><br><br></span>
                        </div>
                    </div>
                    
                </div> 
                <!-- Wide card with share menu button -->.
                <br />
                <div class="demo-card-wide mdl-card mdl-shadow--2dp">
                    <div class="float">
                    <div class="widecard" id="a">
<!-- Icon List -->


<ul class="demo-list-icon mdl-list">
  <li class="mdl-list__item">
    <span class="mdl-list__item-primary-content">
    <i class="material-icons mdl-list__item-icon">today</i>
    המבחן הקרוב ביותר: מתמטיקה-24.1.17
</span>
  </li>
  <li class="mdl-list__item">
    <span class="mdl-list__item-primary-content">
    <i class="material-icons mdl-list__item-icon">info</i>
    הגשת העבודה הועברה ליום רביעי.
  </span>
  </li>
  <li class="mdl-list__item">
    <span class="mdl-list__item-primary-content">
    <i class="material-icons mdl-list__item-icon">person</i>
        הניקוד שלך עלה ב-50 נקודות!
  </span>
  </li>
</ul>                                          
                    </div>
                    <div class="widecard" id="b">
                        <div class="c100 p86 green" style="float:right;margin-top:40px">
                    <span>86%</span>
                    <div class="slice">
                        <div class="bar"></div>
                        <div class="fill"></div>
                    </div>
                </div>
                        <h2 class="mdl-card__title-text" style="float:left;margin-left:45px;margin-top:10px;font-family:'Heebo';font-weight:500;">כל הכבוד!</h2>
                         <div class="mdl-card__supporting-text" style="clear:left;font-family:'Heebo'">
                             אתה שולט ב86% <br />מהחומר בשברים!
                             <br /> 
                             אולי תעזור לחבריך בפורום?
                         </div>
                        <button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" style="float:left;top:27px;left:50px;font-family:'Heebo'">
                            כניסה לפורום
                        </button>
                            

                    </div>
                        
                    <div class="widecard"  id="c">
                <div class="c100 p23 red" style="float:right;margin-top:40px">
                    <span>23%</span>
                    <div class="slice">
                        <div class="bar"></div>
                        <div class="fill"></div>
                    </div>
                </div>
                        <h2 class="mdl-card__title-text" style="float:left;margin-left:45px;margin-top:10px; font-family:'Heebo';font-weight:500;">צריך עזרה?</h2>
                         <div class="mdl-card__supporting-text" style="clear:left; font-family:'Heebo'">
                             שמנו לב שאתה שולט ב23% <br />מהחומר באלגברה. <br />
                             צריך עזרה? <br />
                             פנה למורה או לפורום!
                         </div>
                        <button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" style="float:left;top:10px;left:50px;font-family:'Heebo'">
                            כניסה לפורום
                        </button>
                    </div>
                        
                </div>             
                </div>
                <br />
                <h2 style="font-family:'Heebo';font-weight:700;font-size:45px">נושאים</h2><hr />
                <div class="w3-row" id="Data"></div>
                <script src="js/handlebars-v4.0.5.js"></script>
                <script id="sub-temp" type="text/x-handlebars-template">
                    {{#each sub}}
                    <div class="sub w3-card w3-quarter w3-white">
                        <header class="w3-container">
                            <h2 style="font-family:'Heebo';font-weight:300;font-size:35px">{{subject}}</h2>
                        </header>
                        <div class="w3-container">
                            {{subjectID}}
                        </div>
                        <footer class="w3-container">
                           <a href="targil.aspx" class="w3-button">Link Button</a>
                         </footer>
                    </div>
                    {{/each}}
                </script>
                <script type="text/javascript">
                    var subInfo = document.getElementById("sub-temp").innerHTML;
                    var template = Handlebars.compile(subInfo);
                    var data = template(<%=this.json%>);
                    document.getElementById("Data").innerHTML += data;
                </script>                
        </div>
            <style>
           .tank{
                width:25%;
                height:200px;
                float:right;
                position: relative;

            }
           .widecarda{
                width:45%;
                height:200px;
                float:right;
            }
            #a,#b{
                border-left: solid #DCDCDC;
            }
            #iddk{
                margin-top:-20px;
            }
            #p2{
                width:90%;
                height:10px;
                margin:auto;
                margin-top:30px;
            }
            #targilP{
                text-align:center;
                margin:auto;
            }
        </style>
            <div class="demo-card-wide mdl-card mdl-shadow--2dp">
                <div class="float">
                    <div class="tank" id="a">
                        <div id="iddk">
                        <h4 style="text-align:center">אלגברה</h4>
                        <div class="c100 p23 red" style="margin-left:25%;">
                            <span>23%</span>
                            <div class="slice">
                                <div class="bar"></div>
                                <div class="fill"></div>
                            </div>
                        </div>
                            </div>                               
                    </div>
                    <div class="widecarda" id="b">
                            <div id="p2" class="mdl-progress mdl-js-progress"></div>
                            <script>
                                document.querySelector('#p2').addEventListener('mdl-componentupgraded', function() {
                                this.MaterialProgress.setProgress(40); 
                                });
                            </script>
                            <h4 style="text-align:center">נותרו 6 תרגילים</h4> 
                        <button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" style="display:block;margin:auto;" font-family:'Heebo'>
                            כניסה לפורום
                        </button>
                    </div>
                        
                    <div class="tank" id="c">
                        <h4>רצף של 5 תשובות נכונות</h4>
                        <button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" style="display:block;margin:auto;" font-family:'Heebo'>
                            שחק
                        </button>
                    </div>

                </div>             

            </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
        <script type="text/javascript">
            function cleanArray(actual) {
                var newArray = new Array();
                for (var i = 0; i < actual.length; i++) {
                    if (actual[i]) {
                        newArray.push(actual[i]);
                    }
                }
                return newArray;
            }
            var str = (<%=this.json%>);
            var arr = [];
            for (var i = 0; i < str.length; i++) {
                if (String(str).charAt(i) != "." && String(str).charAt(i + 1) != ".") {
                    arr[i] = String(str).charAt(i) + String(str).charAt(i + 1);
                    i++;
                }
                else if (String(str).charAt(i) != ".") {
                    arr[i] = String(str).charAt(i);
                }
            }
            arr = cleanArray(arr);
            var counter = 0;
            var arrL=[]
            arr = arr.sort(function (a, b) { return a - b });
            var vr = document.querySelectorAll(".sub");
            for (var i = 0; i < vr.length; i++) {
                for (var v = 0; v < arr.length; v++) {
                    if (vr[i].id == arr[v]) {
                        vr[i].style.display = "inline-flex";
                        arrL[v] = vr[i];
                    }
                }   
            }
            
        </script>
        <script>
            // progressbar.js@1.0.0 version is used
            // Docs: http://progressbarjs.readthedocs.org/en/1.0.0/

            var bar = new ProgressBar.Circle(container, {
                color: '#aaa',
                // This has to be the same size as the maximum width to
                // prevent clipping
                strokeWidth: 4,
                trailWidth: 1,
                easing: 'easeInOut',
                duration: 1400,
                text: {
                    autoStyleContainer: false
                },
                from: { color: '#aaa', width: 1 },
                to: { color: '#333', width: 4 },
                // Set default step function for all animate calls
                step: function (state, circle) {
                    circle.path.setAttribute('stroke', state.color);
                    circle.path.setAttribute('stroke-width', state.width);

                    var value = Math.round(circle.value() * 100);
                    if (value === 0) {
                        circle.setText('');
                    } else {
                        circle.setText(value);
                    }

                }
            });
            bar.text.style.fontFamily = '"Raleway", Helvetica, sans-serif';
            bar.text.style.fontSize = '2rem';

            bar.animate(0.5);  // Number from 0.0 to 1.0
</script>
        
            
</body>
</html>