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
        <div class="w3-row w3-mobile" id="page-wrap"><!-- נותן מסגרת לאתר, !-->
            <div id="welcome" class="w3-container w3-row w3-mobile w3-white w3-card w3-cell w3-threequarter">              
                <div class="w3-third w3-center">    
                    <header class="w3-container">
                        <h5>צריך עזרה?</h5>
                    </header> 
                    <div class="w3-container">
                        <div class="c100 small p23 red">
                            <span>23%</span>
                            <div class="slice"><div class="bar"></div><div class="fill"></div></div>
                        </div>
                        <p>מילים מילים מילים מילים מילים מילים?</p>
                    </div>
                    <footer class="w3-container">
                        <button class="w3-button w3-indigo">כניסה לפורום    </button>
                    </footer>
                </div>
                 <div id="b" class="w3-third w3-center">    
                    <header class="w3-container">
                        <h5>צריך עזרה?</h5>
                    </header> 
                    <div class="w3-container">
                        <div class="c100 small p23 red">
                            <span>23%</span>
                            <div class="slice"><div class="bar"></div><div class="fill"></div></div>
                        </div>
                        <p>מילים מילים מילים מילים מילים מילים?</p>
                    </div>
                    <footer class="w3-container">
                        <button class="w3-button w3-indigo">כניסה לפורום    </button>
                    </footer>
                </div>
                    <div id="a" class="w3-third w3-center">    
                        <header class="w3-container">
                            <h5>צריך עזרה?</h5>
                        </header> 
                        <div class="w3-container">
                            <ul class="demo-list-icon mdl-list">
                            <li class="mdl-list__item">
                                <span class="mdl-list__item-primary-content">
                                    <i class="material-icons mdl-list__item-icon">today</i>
                                    המבחן הקרוב ביותר: מתמטיקה-24.1.17
                                </span>
                            </li>
                        </ul>
                         </div>
                        <footer class="w3-container">
                            
                        </footer>        
                    </div>     
                </div>             
                <div id="left-pro" style="font-family:'Heebo'">
                    <div id="pro" class="w3-container w3-mobile w3-white w3-card w3-cell w3-quarter">
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
                <br />
                
                <br />
                <h2 style="font-family:'Heebo';font-weight:700;font-size:45px">נושאים</h2><hr />
                <div class="w3-cell-row" id="subDiv"></div>
                <script src="js/handlebars-v4.0.5.js"></script>
                <script id="sub-temp" type="text/x-handlebars-template">
                    {{#each sub}}
                    <div class="sub w3-quarter w3-card w3-container w3-cell w3-center w3-mobile w3-white">
                        <header class="w3-container  w3-center">
                            <h2 style="font-family:'Heebo';font-weight:300;font-size:35px">{{subject}}</h2>
                        </header>
                        <div class="w3-container  w3-center">
                            <br />
                            <div class="c100 small p{{cou}} {{GetMasterPrecent cou}} center"> <!-- צריך לחלק פה סאיו בסיתרגיל! !-->
                                <span>{{cou}}%</span>
                                <div class="slice">
                                    <div class="bar"></div>
                                    <div class="fill"></div>
                                </div>
                            </div>
                        </div>
                        <footer class="w3-container w3-center">
                           <a href="targil3.aspx" class="w3-button">Link Button</a>
                         </footer>
                    </div>
                    {{/each}}
                </script>
                <script type="text/javascript">
                    Handlebars.registerHelper('GetMasterPrecent', function(master) {
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
                        var subInfo = document.getElementById("sub-temp").innerHTML;
                        var template = Handlebars.compile(subInfo);
                        var data = template(<%=this.json%>);
                        document.getElementById("subDiv").innerHTML += data;
                </script>                
        </div>    
</body>
</html>