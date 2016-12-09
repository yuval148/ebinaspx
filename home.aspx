<%@ Page Language="C#" CodeFile="home.aspx.cs" Inherits="home" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<!--#include file="upper.aspx"-->

<!doctype html>
<html dir="rtl">
    <head> 
        <title></title>
        <style>
           body {
                background: url("/media/bg5.jpg");
                background-size: 100%, 100%;
                background-repeat: no-repeat;
            }
            .sub{
                width:320px;
                height:320px;
                display:none;
                margin: 10px 10px 10px 10px;
                right:390px;
                float:right;
            }

            #pro {
                top: 50px;
                width: 320px;
                height: 700px;
                                margin: 10px 10px 10px 10px;

            }
            .img-circle {
                border-radius: 50%;
                width:150px;
                height:150px;
                align-self:center;
                margin-top:50px;
                margin-bottom:50px;
                
            }
            #pd{
                text-align:center;
            }
            .demo-card-square1 > .mdl-card__title {
                color: #fff;background: url('/media/math.png') bottom right  no-repeat #283593;
            }
            .demo-card-square2 > .mdl-card__title {
                color: #fff;background: url('/media/math.png') bottom right  no-repeat #283593;
            }
            .demo-card-square3 > .mdl-card__title {
                color: #fff;background: url('/media/math.png') bottom right  no-repeat #283593;
            }
            .demo-card-square4 > .mdl-card__title {
                color: #fff;background: url('/media/math.png') bottom right  no-repeat #283593;
            }
            .demo-card-square5 > .mdl-card__title {
                color: #fff;background: url('/media/math.png') bottom right  no-repeat #283593;
            }
            .demo-card-square6 > .mdl-card__title {
                color: #fff;background: url('/media/math.png') bottom right  no-repeat #283593;
            }
            .demo-card-square7 > .mdl-card__title {
                color: #fff;background: url('/media/math.png') bottom right  no-repeat #283593;
            }
            .demo-card-square8 > .mdl-card__title {
                color: #fff;background: url('/media/math.png') bottom right  no-repeat #283593;
            }
            .demo-card-square9 > .mdl-card__title {
                color: #fff;background: url('/media/math.png') bottom right  no-repeat #283593;
            }
            .demo-card-square10 > .mdl-card__title {
                color: #fff;background: url('/media/math.png') bottom right  no-repeat #283593;
            }
        </style> 
    </head>
    <body> 
        <main class="mdl-layout__content">
            <div class="left-pro" style="font-family:'Heebo'">
                <div id="pro" class=" mdl-card mdl-shadow--2dp">
                    <img src="media/lion.jpg" class="img-circle">
                    <div id="pd">
                        <span style="font-size:40px; line-height:80%" >קבוצת  <%=Session["team"]%> </span><hr /> <br>
                        <span style="font-size:40px; font-weight:bold"> <%=Session["name"]%></span><hr /><br>
                        <!-- Simple MDL Progress Bar -->
                        <div id="p1" class="mdl-progress mdl-js-progress"></div>
                        <script>
                            document.querySelector('#p1').addEventListener('mdl-componentupgraded', function () {
                            this.MaterialProgress.setProgress('<%=Session["prog"]%>');
                            });
                        </script>
                        <span style="font-size:25px;line-height:200%"> <%=Session["xpp"]%> נקודות</span><hr /> <br>
                        <span style="font-size:40px; line-height:80%" >שלב  <%=Session["level"]%> </span><hr /> <br>
                        <span style="font-size:40px; line-height:80%" ><%=Session["kita"]%> </span> <br>
                    </div>
                </div>
            </div>
            <div class="page-content">  
                <!-- Wide card with share menu button -->
                    <style>
                        .demo-card-wide.mdl-card {
                            width: 1000px;
                            right:400px;
                            display:block;
                            top:-660px;
                        }
                        .demo-card-wide > .mdl-card__title {
                            color: #fff;
                            height: 176px;
                            background: url('../assets/demos/welcome_card.jpg') center / cover;
                        }
                        .demo-card-wide > .mdl-card__menu {
                            color: #fff;
                        }
                    </style>   
                <div class="demo-card-wide mdl-card mdl-shadow--2dp">
                    <div class="mdl-card__title">
                        <h2 class="mdl-card__title-text">Welcome</h2>
                    </div>
                    <div class="mdl-card__supporting-text">
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                        Mauris sagittis pellentesque lacus eleifend lacinia...
                    </div>
                    <div class="mdl-card__actions mdl-card--border">
                        <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
                            Get Started
                        </a>
                    </div>
                    <div class="mdl-card__menu">
                        <button class="mdl-button mdl-button--icon mdl-js-button mdl-js-ripple-effect">
                            <i class="material-icons">share</i>
                        </button>
                    </div>
                </div>
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
                        <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
                            View Updates
                        </a>
                    </div>
                </div>
                <div id="2" class="sub demo-card-square2 mdl-card mdl-shadow--2dp ">
                    <div class="mdl-card__title mdl-card--expand">
                        <h2 class="mdl-card__title-text" style="font-family:'Heebo';font-weight:300;font-size:35px">מדעי המחשב</h2>
                    </div>
                    <div class="mdl-card__supporting-text">
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                        Aenan convallis.
                    </div>
                    <div class="mdl-card__actions mdl-card--border">
                        <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
                            View Updates
                        </a>
                    </div>
                </div>
                <div id="3"class="sub demo-card-square3 mdl-card mdl-shadow--2dp ">
                    <div class="mdl-card__title mdl-card--expand">
                        <h2 class="mdl-card__title-text" style="font-family:'Heebo';font-weight:300;font-size:35px">מתמטיקה</h2>
                    </div>
                    <div class="mdl-card__supporting-text">
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                        Aenan convallis.
                    </div>
                    <div class="mdl-card__actions mdl-card--border">
                        <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
                            המשך
                        </a>
                    </div>
                </div>
                <div id="4" class="sub demo-card-square4 mdl-card mdl-shadow--2dp ">
                    <div class="mdl-card__title mdl-card--expand">
                        <h2 class="mdl-card__title-text" style="font-family:'Heebo';font-weight:300;font-size:35px">ערבית</h2>
                    </div>
                    <div class="mdl-card__supporting-text">
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                        Aenan convallis.
                    </div>
                    <div class="mdl-card__actions mdl-card--border">
                        <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
                            View Updates
                        </a>
                    </div>
                </div>
                <div id="5" class="sub demo-card-square5 mdl-card mdl-shadow--2dp ">
                    <div class="mdl-card__title mdl-card--expand">
                        <h2 class="mdl-card__title-text" style="font-family:'Heebo';font-weight:300;font-size:35px">פיזיקה</h2>
                    </div>
                    <div class="mdl-card__supporting-text">
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                        Aenan convallis.
                    </div>
                    <div class="mdl-card__actions mdl-card--border">
                        <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
                            View Updates
                        </a>
                    </div>
                </div>
                <div id="6" class="sub demo-card-square6 mdl-card mdl-shadow--2dp ">
                    <div class="mdl-card__title mdl-card--expand">
                        <h2 class="mdl-card__title-text" style="font-family:'Heebo';font-weight:300;font-size:35px">אזרחות</h2>
                    </div>
                    <div class="mdl-card__supporting-text">
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                        Aenan convallis.
                    </div>
                    <div class="mdl-card__actions mdl-card--border">
                        <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
                            View Updates
                        </a>
                    </div>
                </div>
                <div id="7" class="sub demo-card-square7 mdl-card mdl-shadow--2dp ">
                    <div class="mdl-card__title mdl-card--expand">
                        <h2 class="mdl-card__title-text" style="font-family:'Heebo';font-weight:300;font-size:35px">היסטוריה</h2>
                    </div>
                    <div class="mdl-card__supporting-text">
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                        Aenan convallis.
                    </div>
                    <div class="mdl-card__actions mdl-card--border">
                        <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
                            View Updates
                        </a>
                    </div>
                </div>
                <div id="8" class="sub demo-card-square8 mdl-card mdl-shadow--2dp ">
                    <div class="mdl-card__title mdl-card--expand">
                        <h2 class="mdl-card__title-text" style="font-family:'Heebo';font-weight:300;font-size:35px">לשון</h2>
                    </div>
                    <div class="mdl-card__supporting-text">
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                        Aenan convallis.
                    </div>
                    <div class="mdl-card__actions mdl-card--border">
                        <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
                            View Updates
                        </a>
                    </div>
                </div>
                <div id="9" class="sub demo-card-square9 mdl-card mdl-shadow--2dp ">
                    <div class="mdl-card__title mdl-card--expand">
                        <h2 class="mdl-card__title-text" style="font-family:'Heebo';font-weight:300;font-size:35px">ספרות</h2>
                    </div>
                    <div class="mdl-card__supporting-text">
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                        Aenan convallis.
                    </div>
                    <div class="mdl-card__actions mdl-card--border">
                        <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
                            View Updates
                        </a>
                    </div>
                </div>
                <div id="10" class="sub demo-card-square10 mdl-card mdl-shadow--2dp ">
                    <div class="mdl-card__title mdl-card--expand">
                        <h2 class="mdl-card__title-text" style="font-family:'Heebo';font-weight:300;font-size:35px">כימיה</h2>
                    </div>
                    <div class="mdl-card__supporting-text">
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                        Aenan convallis.
                    </div>
                    <div class="mdl-card__actions mdl-card--border">
                        <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
                            View Updates
                        </a>
                    </div>
                </div>
            </div>
        </main>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
        <script src="js/circle.js"></script>

<div id="circle">
    <style>
        #circle{
            display:none;
            top:150px;
            right:400px;
        }
    </style>
</div>

<script>
    $('#circle').circleProgress({
        value: 0.8,
        size: 150,
        fill: {
            gradient: ["red", "orange"]
        }
    });
</script>
  
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
            arr = arr.sort(function (a, b) { return a - b });
            var vr = document.querySelectorAll(".sub");
            for (var i = 0; i < vr.length; i++) {
                for (var v = 0; v < arr.length; v++) {
                    if (vr[i].id == arr[v]) {
                        vr[i].style.display = "inline-flex";
                    }
                }
                if (i < 3) {
                    vr[i].style.top = "-650px";
                }
                else if (i < 6) {
                    vr[i].style.top = "-1010px";

                }

            }
            
        </script>
</body>
</html>