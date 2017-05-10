<%@ Page Language="C#" AutoEventWireup="true" CodeFile="secretT.aspx.cs" Inherits="secretT" %>
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
   
    <div id="jsn1" style="width:80%;margin-left:auto;margin-right:auto" class="w3-responsive">
        <div id="stu-div"></div>
        </div>

     <script id="stu-temp" type="text/x-handlebars-template">
        <table id="table" class="w3-table-all w3-card">
                <tr>
                <th>IP</th>
                <th>דפדפן</th>
                <th>תאריך ושעה</th>
            </tr>
            {{#each stu}}
            <tr>
                <td>{{ip}}</td>
                <td>{{userAgent}}</td>
                <td>{{dathour}}</td>
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
