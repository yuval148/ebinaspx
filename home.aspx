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
        <div class="w3-row w3-mobile" id="page-wrap"><!-- נותן מסגרת לאתר !-->
            <div id="welcome" class="w3-container w3-row w3-mobile w3-white w3-card w3-cell w3-quarter">              
                <div id="c" class="w3-third w3-center">    
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
                        <div class="c100 small p89 green">
                            <span>89%</span>
                            <div class="slice"><div class="bar"></div><div class="fill"></div></div>
                        </div>
                        <p>מילים מילים מילים מילים מילים מילים?</p>
                    </div>
                    <footer class="w3-container w3-center">
                        <button class="w3-button w3-indigo">שתף</button>
                    </footer>
                </div>
                    <div id="a" class="w3-third">    
                        <header class="w3-container  w3-center">
                            <h5>צריך עזרה?</h5>
                        </header> 
                        <div class="w3-container">
                            משהו משהו משהו משהו
                         </div>
                        <footer class="w3-container">
                            
                        </footer>        
                    </div>     
                </div>             
                <div id="pro-div" style="font-family:'Heebo'">
                   
                </div>
                <br />
                <br />
            <!--מכאן!-->
            <div id="subs" class="w3-container w3-mobile w3-threequarter">
                <h2 style="font-family:'Heebo';font-weight:900;font-size:45px">נושאים</h2><hr />
                <div class="w3-cell-row" id="sub-div"></div>
            </div>
               
                        <!--מכאן!-->

                <script src="js/handlebars-v4.0.5.js"></script>
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
                        <img src="media/{{pic}}" class="img-circle">
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
                        <ul class="w3-ul">
                        {{#each sub}}
                             <div id="{{title}}" style="display:{{CheckClass kita title}}">
                            <li class="w3-padding-16">
                                <i class="material-icons">{{icon}}</i>
                                <span class="w3-large">{{title}}</span><br>
                                <span>{{msg}}</span>,
                                <span style="color:#3f51b5">{{kita}}</span><br>
                                <span style="color:#9e9e9e; font-size:10px;">{{datec}}</span>
                                <span style="color:#9e9e9e; font-size:10px;">{{byy}}</span>
                                
                            </li>
                            </div>
                        {{/each}}
                        </ul>
                    </div> 
                </script>
                <script type="text/javascript">
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

                        var mesInfo = document.getElementById("mes-temp").innerHTML;
                        var mesTemplate = Handlebars.compile(mesInfo);
                        var mesData = mesTemplate(<%=this.jsonMes%>);
                        document.getElementById("pro-div").innerHTML += mesData;
                </script>                
               
        </div>    
</body>
</html>