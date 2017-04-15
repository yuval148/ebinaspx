<%@ Page Language="C#" CodeFile="homeT.aspx.cs" Inherits="home" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<!--#include file="upperT.aspx"-->

<!doctype html>
<html dir="rtl">
    <head> 
        <link rel="stylesheet" href="css/circle.css">
        <link href="css/home.css" rel="stylesheet" />
        <title></title>
        <style>
        </style>
    </head>
    <body>
        <div class="w3-row" id="page-wrap">
            <div id="bot-div"class="w3-card w3-half"></div>
            <div id="top-div"class="w3-card w3-half"></div>
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
            <script type="text/javascript">
                var botInfo = document.getElementById("bot-temp").innerHTML;
                var botTemplate = Handlebars.compile(botInfo);
                var botData = botTemplate(<%=this.json%>);
                document.getElementById("bot-div").innerHTML += botData;
                        
                var topInfo = document.getElementById("top-temp").innerHTML;
                var topTemplate = Handlebars.compile(topInfo);
                var topData = topTemplate(<%=this.json%>);
                document.getElementById("top-div").innerHTML += topData;
            </script>
        </div>   
    </body>
</html>