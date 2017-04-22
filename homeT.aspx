<%@ Page Language="C#" CodeFile="homeT.aspx.cs" Inherits="home" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<!--#include file="upperT.aspx"-->

<!doctype html>
<html dir="rtl">
    <head> 
        <script type="text/javascript">
            
        </script>
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
            <div class="w3-row">
                <div id="list-div" class="w3-quarter w3-right"></div>
                <div id="class-div" class="w3-threequarter"></div> 
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
                <div id="A{{ID}}"class="w3-hide">
                    <h1>{{name}}</h1>
                </div>
            {{/each}}
        </script>
        <script id="list-temp" type="text/x-handlebars-template">
            <ul class="w3-ul w3-hoverable w3-card">
                {{#each stu}} <!--change to the relevent JSON!-->
                    <button class="w3-button w3-block w3-left-align"><li id="{{ID}}">{{name}}</li></button>
                {{/each}}
            </ul>
        </script>
            <script type="text/javascript">
                document.querySelector('body').addEventListener('click', function(event){
                    if (event.target.tagName.toLowerCase() === 'li') {
                        var id = event.target.id;
                        myFunction1(id);
                    }
                });
                function myFunction1(id) {
                    var x = document.getElementById("A"+id);
                    if (x.className.indexOf("w3-show") == -1) {
                        x.className += " w3-show";
                    } else {
                        x.className = x.className.replace(" w3-show", "");
                    }
                }
                var classInfo = document.getElementById("class-temp").innerHTML;
                var classTemplate = Handlebars.compile(classInfo);
                var classData = classTemplate(<%=this.json%>);
                document.getElementById("class-div").innerHTML += classData;

                var listInfo = document.getElementById("list-temp").innerHTML;
                var listTemplate = Handlebars.compile(listInfo);
                var listData = listTemplate(<%=this.json%>);
                document.getElementById("list-div").innerHTML += listData;
            </script>
    </body>
</html>