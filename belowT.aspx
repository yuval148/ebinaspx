<%@ Page Language="C#" AutoEventWireup="true" CodeFile="belowT.aspx.cs" Inherits="belowT" %>
<!--#include file="upperT.aspx"-->
<html>
<head>
    <title></title>
 <style>
            body {
                background: url("/media/bfg5.jpg");
                background-size: 100%, 100%;
                background-repeat: no-repeat;
            }
                   @media screen and (max-width: 480px) {

           body {
               background: url("media/bgphoneT.png");
               background-size: 100% 100%;
           }
       }
            #stu-div{
                margin:10px;
            }
    </style>

</head>
<body>
    <br />
    <br />
    <span style="font-size:50px;font-weight:700;font-family:Heebo;">תלמידים שרמת השליטה שלהם מתחת ל55% </span>
        <br />
    <div id="stu-div"></div>
    <script id="stu-temp" type="text/x-handlebars-template">
        <table class="w3-table-all w3-card">
            <tr>
                <th>שם תלמיד</th>
                <th>קבוצה</th>
                <th>ת.ז</th>
                <th>כיתה</th>
                <th>שליטה כללית בחומר</th>
                <th>תמונה</th>
            </tr>
            {{#each stu}}
            <tr>
                <td>{{name}}</td>
                <td>{{team}}</td>
                <td>{{ID}}</td>
                <td>{{kita}}</td>
                <td>{{shlita}}%</td>
                <td><img src="media/{{pic}}" style="width:60px; height:60px;margin:10px;" class="w3-circle w3-center w3-half"></td>
            </tr>
            {{/each}}
        </table>
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
        
         
        var stuInfo = document.getElementById("stu-temp").innerHTML;
        var stuTemplate = Handlebars.compile(stuInfo);
        var stuData = stuTemplate(<%=this.json%>);
        document.getElementById("stu-div").innerHTML += stuData;

            });

    </script>
</body>
</html>
