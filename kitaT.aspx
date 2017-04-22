<%@ Page Language="C#" AutoEventWireup="true" CodeFile="kitaT.aspx.cs" Inherits="kitaT" %>
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
            #stu-div{
                margin:10px;
            }
    </style>

</head>
<body>
   
 <div id="form" style="opacity:100; text-align:center" runat="server">
    <form method="post">
     <table align="center">
              <tr>
                <td>כיתה</td>
                <td>
              <script type="text/javascript">
        $(document).ready(function () {
            var newSelect = document.createElement('select');
            newSelect.id="kita";
            newSelect.name="kita";
            newSelect.className="w3-select"
            var selectHTML = "";
            var data = (<%=this.json%>);
            var choices = $.map(data, function(el) { return el; })
            for (i = 0; i < choices.length; i = i + 1) {
                var x = choices[i]["kita"];
                selectHTML += "<option value='" + x + "'>" + x + "</option>";
            }
            selectHTML += "</select>";

            newSelect.innerHTML = selectHTML;
            document.getElementById('class_selection').appendChild(newSelect);


        });

    </script>
                    <div id="class_selection">
    </div>
                    </td></tr>
            </table>
         <input type="submit" name="submit" id="Submit" value="צפה בכיתה" />
            </form>
        </div>
    <div id="stuopc" style="opacity:0;width:80%;margin-left:auto;margin-right:auto" class="w3-responsive" runat="server">
            <br />
           <span style="font-size:50px;font-weight:700;font-family:Heebo;"> <%=kita %> </span>
        <div id="stu-div"></div>
</div>
                 


    <script id="stu-temp" type="text/x-handlebars-template">
        <table class="w3-table-all w3-card">
            <tr>
                <th>שם תלמיד</th>
                <th>קבוצה</th>
                <th>ת.ז</th>
                <th>תמונה</th>
            </tr>
            {{#each stu}}
            <tr>
                <td>{{name}}</td>
                <td>{{team}}</td>
                <td>{{ID}}</td>
                <td><img src="media/{{pic}}" style="width:60px; height:60px;margin:10px;" class="w3-circle w3-center w3-half"></td>
            </tr>
            {{/each}}
        </table>
    </script>
    <script type="text/javascript">
        $(document).ready(function () {

     
        var stuInfo = document.getElementById("stu-temp").innerHTML;
        var stuTemplate = Handlebars.compile(stuInfo);
        var stuData = stuTemplate(<%=this.json3%>);
        document.getElementById("stu-div").innerHTML += stuData;

            });

    </script>
</body>
</html>
