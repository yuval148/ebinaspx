<%@ Page Language="C#" CodeFile="homeT.aspx.cs" Inherits="home" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<!--#include file="upperT.aspx"-->

<!doctype html>
<html dir="rtl">
    <head> 
        <link rel="stylesheet" href="css/circle.css">
        <link href="css/homeT.css" rel="stylesheet" />
        <title></title>
        <style>
            .w3-red{
                float: right;
                width:50%;
                height:100%;
            }
            #c {
                clear: right;
            }
            #btns{
                display:inline-block;
                width:50%;
                height:114px;
            }
        </style>
    </head>
    <body style="font-family:Heebo">
        <div id="page-wrap">
            <div id="class-div"></div>
            <div class="w3-row  w3-panel ">
                <div id="bot-div"class="w3-card w3-half"></div>
                <div id="top-div"class="w3-card w3-half"></div>
            </div>
        </div>   
        <script id="top-temp" type="text/x-handlebars-template">
                       <h2>תלמידים במגמת עלייה</h2>
                        <ul class="w3-ul w3-card-4">
                        {{#each stu}}
                              <li class="w3-padding-16">
                                <img src="media/{{pic}}" class="w3-right w3-circle w3-margin-right" style="width:50px">
                                <span class="w3-large">{{name}}</span><br>
                                <span><b>פרבולות</b>, {{kita}}, {{team}}</span>
                              </li>
                        {{/each}}
                        </ul>
                </script>
            <script id="bot-temp" type="text/x-handlebars-template">
                        <h2>תלמידים במגמת ירידה</h2>
                        <ul class="w3-ul w3-card-4">
                        {{#each stu}}
                              <li class="w3-padding-16">
                                <img src="media/{{pic}}" class="w3-right w3-circle w3-margin-right" style="width:50px">
                                <span class="w3-large">{{name}}</span><br>
                                <span><b>פרבולות</b>,{{kita}}, {{team}}</span>
                              </li>
                        {{/each}}
                        </ul>
            </script>
            <script id="class-temp" type="text/x-handlebars-template">
                {{#each stu}}
               <button onclick="myFunction1('{{ID}}')" class="w3-button w3-block w3-black w3-left-align">Accordion</button>
<div id="{{ID}}" class="w3-hide w3-animate-opacity">
                  <div class="w3-panel w3-card w3-display-container w3-row w3-light-grey">
                    <h2 style="font-family:Heebo; font-weight:900">שכבת {{name}}</h2>
                        <hr />
                     <div class="w3-row" style="width:90%;margin:auto">

                            <ul class="w3-ul w3-border w3-half" style="float:left">
                      <li><h2 style="font-family:Heebo; font-weight:700">מבחנים קרובים</h2></li>
                      <li>מתמטיקה-</li>
                      <li>ביולגיה-יב'3</li>
                      <li>היסטוריה</li>
                    </ul>
                        <div id="btns" class="w3-half"  style="width:40%;float:right">
                    <button id="a" class="w3-large w3-button w3-quarter w3-hover-white w3-red w3-border">שלח הודעה פרטית לתלמיד</button>
                    <button id="b" class="w3-large w3-button w3-quarter w3-hover-white w3-red w3-border">הצג מצב כיתות</button>
                    <button id="c" class="w3-large w3-button w3-quarter w3-hover-white w3-red w3-border">הכנס שינוי מערכת</button>
                    <button id="d" class="w3-large w3-button w3-quarter w3-hover-white w3-red w3-border">כפתור כיפי</button>
                    </div>
                    </div>
                    <div class="w3-panel w3-card w3-white w3-border">
                        <h4 style="font-family:Heebo; font-weight:500">הבחנות מערכת</h4>
                        <p>הילדים הבאים מתקשים בחומר</p>
                       
                    </div>                    
                </div>
                  </div>
                </div>       
                {{/each}}               
            </script>

            <script type="text/javascript">
                function myFunction1(id) {
                    var x = document.getElementById(id);
                    if (x.className.indexOf("w3-show") == -1) {
                        x.className += " w3-show";
                    } else {
                        x.className = x.className.replace(" w3-show", "");
                    }
                }
                var botInfo = document.getElementById("bot-temp").innerHTML;
                var botTemplate = Handlebars.compile(botInfo);
                var botData = botTemplate(<%=this.json%>);
                document.getElementById("bot-div").innerHTML += botData;
                        
                var topInfo = document.getElementById("top-temp").innerHTML;
                var topTemplate = Handlebars.compile(topInfo);
                var topData = topTemplate(<%=this.json%>);
                document.getElementById("top-div").innerHTML += topData;

                var classInfo = document.getElementById("class-temp").innerHTML;
                var classTemplate = Handlebars.compile(classInfo);
                var classData = classTemplate(<%=this.json%>);
                document.getElementById("class-div").innerHTML += classData;
            </script>
    </body>
</html>