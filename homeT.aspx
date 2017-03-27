<%@ Page Language="C#" CodeFile="homeT.aspx.cs" Inherits="home" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<!--#include file="upperT.aspx"-->

<!doctype html>
<html dir="rtl">
    <head> 
         <link rel="stylesheet" href="css/circle.css">
        <meta name="theme-color" content="#3f51b5"/>
        <title></title>
        <style>
           body {
                background: url("/media/bg5.jpg");
                background-size: 100%, 100%;
                background-repeat: no-repeat;
                
            }
            .sub{
                width:300px;
                height:300px;
                display:none;
                float: right;
                margin: 10px 10px 10px 10px;
            }
            #pro {
                width: 20%;
                height: 550px;
                margin: 10px 10px 10px 10px;
                float:right;
            }
            .img-circle {
                border-radius: 50%;
                width:120px;
                height:120px;
                align-self:center;
                margin-top:20px;
                margin-bottom:50px;
                
            }
            #pd{
                text-align:center;
            }
            .demo-card-square1 > .mdl-card__title {
                color: #fff;background: url('/media/404.png') bottom right  no-repeat #283593;
            }
            .demo-card-square2 > .mdl-card__title {
                color: #fff;background: url('/media/new/para.png') bottom right  no-repeat #283593;
            }
            .demo-card-square3 > .mdl-card__title {
                color: #fff;background: url('/media/new/algeb.png') bottom right  no-repeat #283593;
            }
            .demo-card-square4 > .mdl-card__title {
                color: #fff;background: url('/media/404.png') bottom right  no-repeat #283593;
            }
            .demo-card-square5 > .mdl-card__title {
                color: #fff;background: url('/media/404.png') bottom right  no-repeat #283593;
            }
            .demo-card-square6 > .mdl-card__title {
                color: #fff;background: url('/media/404.png') bottom right  no-repeat #283593;
            }
            .demo-card-square7 > .mdl-card__title {
                color: #fff;background: url('/media/404.png') bottom right  no-repeat #283593;
            }
            .demo-card-square8 > .mdl-card__title {
                color: #fff;background: url('/media/404.png') bottom right  no-repeat #283593;
            }
            .demo-card-square9 > .mdl-card__title {
                color: #fff;background: url('/media/new/trig.png') bottom right  no-repeat #283593;
            }
            .demo-card-square10 > .mdl-card__title {
                color: #fff;background: url('/media/404.png') bottom right  no-repeat #283593;
            }

            .demo-card-wide.mdl-card {
                width: 950px;
            }
            
            .widecard{
                width:314px;
                height:200px;
                float:right;
            }
            #a,#b{
                border-left: solid #DCDCDC;
            }
            #container {
  margin: 20px;
  width: 200px;
  height: 200px;
  position: relative;
}
            #p1{
                margin-bottom:10px;
            }
            .demo-list-icon {
            width: 300px;
            }

</style>
        
    </head>
    <body>
        <main class="mdl-layout__content">
            <div class="page-content">
                <div class="left-pro" style="font-family:'Heebo'">
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
                <!-- Wide card with share menu button -->
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
                        <!-- Square card -->
            <div id="1" class="sub demo-card-square1 mdl-card mdl-shadow--2dp ">
                <div class="mdl-card__title mdl-card--expand">
                    <h2 class="mdl-card__title-text" style="font-family:'Heebo';font-weight:300;font-size:35px">אנגלית</h2>
                </div>
                <div class="mdl-card__supporting-text">
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                    Aenan convallis.
                </div>
                <div class="mdl-card__actions mdl-card--border">
                    <a class="mdl-button mdl-button--colored mdl-js-button">
                        לתרגילים
                    </a>
                </div>
            </div>

            <div id="2" class="sub demo-card-square2 mdl-card mdl-shadow--2dp ">
                <div class="mdl-card__title mdl-card--expand">
                    <h2 class="mdl-card__title-text" style="font-family:'Heebo';font-weight:300;font-size:35px">חדו"א</h2>
                </div>
                <div class="mdl-card__supporting-text">
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                    Aenan convallis.
                </div>
                <div class="mdl-card__actions mdl-card--border">
                    <a class="mdl-button mdl-button--colored mdl-js-button">
                        לתרגילים
                    </a>
                </div>
            </div>

            <div id="3"class="sub demo-card-square3 mdl-card mdl-shadow--2dp ">
                <div class="mdl-card__title mdl-card--expand">
                    <h2 class="mdl-card__title-text" style="font-family:'Heebo';font-weight:300;font-size:35px">אלגברה</h2>
                </div>
                <div class="mdl-card__supporting-text">
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                    Aenan convallis.
                </div>
                <div class="mdl-card__actions mdl-card--border">
                    <a class="mdl-button mdl-button--colored mdl-js-button" style="float:left" href="targil.aspx">
                        לתרגילים
                    </a>
                </div>
            </div>

            <div id="4"class="sub demo-card-square4 mdl-card mdl-shadow--2dp ">
                <div class="mdl-card__title mdl-card--expand">
                    <h2 class="mdl-card__title-text" style="font-family:'Heebo';font-weight:300;font-size:35px">ערבית</h2>
                </div>
                <div class="mdl-card__supporting-text">
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                    Aenan convallis.
                </div>
                <div class="mdl-card__actions mdl-card--border">
                    <a class="mdl-button mdl-button--colored mdl-js-button">
                        לתרגילים
                    </a>
                </div>
            </div>

            <div id="5"class="sub demo-card-square5 mdl-card mdl-shadow--2dp ">
                <div class="mdl-card__title mdl-card--expand">
                    <h2 class="mdl-card__title-text" style="font-family:'Heebo';font-weight:300;font-size:35px">פיזיקה</h2>
                </div>
                <div class="mdl-card__supporting-text">
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                    Aenan convallis.
                </div>
                <div class="mdl-card__actions mdl-card--border">
                    <a class="mdl-button mdl-button--colored mdl-js-button">
                        לתרגילים
                    </a>
                </div>
            </div>

            <div id="6"class="sub demo-card-square6 mdl-card mdl-shadow--2dp ">
                <div class="mdl-card__title mdl-card--expand">
                    <h2 class="mdl-card__title-text" style="font-family:'Heebo';font-weight:300;font-size:35px">אזרחות</h2>
                </div>
                <div class="mdl-card__supporting-text">
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                    Aenan convallis.
                </div>
                <div class="mdl-card__actions mdl-card--border">
                    <a class="mdl-button mdl-button--colored mdl-js-button">
                        לתרגילים
                    </a>
                </div>
            </div>

      <div id="7" class="sub demo-card-square7 mdl-card mdl-shadow--2dp ">
  <div class="mdl-card__title mdl-card--expand">
    <h2 class="mdl-card__title-text"style="font-family:'Heebo';font-weight:300;font-size:35px">היסטוריה</h2>
  </div>
  <div class="mdl-card__supporting-text">
    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
    Aenan convallis.
  </div>
  <div class="mdl-card__actions mdl-card--border">
                    <a class="mdl-button mdl-button--colored mdl-js-button">
      לתרגילים
    </a>
  </div>
</div>

      <div id="8" class="sub demo-card-square8 mdl-card mdl-shadow--2dp ">
  <div class="mdl-card__title mdl-card--expand">
    <h2 class="mdl-card__title-text"style="font-family:'Heebo';font-weight:300;font-size:35px">לשון</h2>
  </div>
  <div class="mdl-card__supporting-text">
    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
    Aenan convallis.
  </div>
  <div class="mdl-card__actions mdl-card--border">
                    <a class="mdl-button mdl-button--colored mdl-js-button">
      לתרגילים
    </a>
  </div>
</div>

      <div id="9" class="sub demo-card-square9 mdl-card mdl-shadow--2dp ">
  <div class="mdl-card__title mdl-card--expand">
    <h2 class="mdl-card__title-text" style="font-family:'Heebo';font-weight:300;font-size:35px">טריגונומטריה</h2>
  </div>
  <div class="mdl-card__supporting-text">
    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
    Aenan convallis.
  </div>
  <div class="mdl-card__actions mdl-card--border">
                    <a class="mdl-button mdl-button--colored mdl-js-button">
      לתרגילים
    </a>
  </div>
</div>

<div id="10" class="sub demo-card-square10 mdl-card mdl-shadow--2dp">
  <div class="mdl-card__title mdl-card--expand">
    <h2 class="mdl-card__title-text" style="font-family:'Heebo';font-weight:300;font-size:35px">כימיה</h2>
  </div>
  <div class="mdl-card__supporting-text">
    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
    Aenan convallis.
  </div>
  <div class="mdl-card__actions mdl-card--border">
                    <a class="mdl-button mdl-button--colored mdl-js-button">
      לתרגילים
    </a>
  </div>
</div>
                
        </div>
  </main>
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
            var str = '<%=Session["sendr"]%>';
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