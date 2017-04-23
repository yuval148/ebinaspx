<%@ Page Language="C#" AutoEventWireup="true" CodeFile="tatmT.aspx.cs" Inherits="tatmT" %>
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
    <div class="w3-row">
    <div id="pro-div" class="w3-panel w3-row w3-left w3-half"></div>
        <div id="sub-div" class="w3-panel w3-row w3-right w3-half"></div>
        </div>
 <div id="form" style="opacity:100; text-align:center" runat="server">
    <form method="post">
     <table align="center">
          <tr>
     <td>נושא  </td>
      <td>
         <select id="subject" name="subject" class="w3-select">
             <option value="0">בחר נושא</option>
           <option value="1">פרבולות</option>
             <option value="2">טריגונומטריה</option>
             <option value="3">אלגברה</option>
            <option value="4">הסתברות</option>
             <option value="5">פיזיקה</option>
             <option value="6">אזרחות</option>
             <option value="7">היסטוריה</option>
             <option value="8">לשון</option>
             <option value="9">ספרות</option>
              <option value="10">כימיה</option>
             <option value="11">סוציולוגיה</option>
                </select> 
                </td>
      </tr>
            <tr>
                <td>תלמיד</td>
                <td>
              
                    <div id="student_selection">
    </div>
                    </td></tr>
            </table>
         <input type="submit" name="submit" id="Submit" value="צפה בתלמיד" />
        <br />
        <%=Session["errform"] %>
            </form>
        </div>
    <div id="stuopc" style="opacity:0;width:80%;margin-left:auto;margin-right:auto" class="w3-responsive" runat="server">
        <div id="stu-div"></div>
</div>
                 

    
    

        <script id="pro-temp" type="text/x-handlebars-template">
                    {{#each stu}}
                    <div class="w3-half" style="top:200px">
                        <span style="font-size:50px;font-weight:700;font-family:Heebo;"> {{name}} </span>
                        <br />
                        <span style="font-size:20px; font-weight:300;font-family:Heebo; line-height:80%; text-align:right">{{kita}}, קבוצת  {{team}}</span>                     

                    </div>
                               <img src="media/{{pic}}" style="width:120px; height:120px;margin:10px;" class="w3-circle w3-center w3-half">
                    {{/each}}
                </script>
    
    <script id="sub-temp" type="text/x-handlebars-template">
                    {{#each stu}}
                    <div class="w3-half" style="top:200px">
                        <span style="font-size:50px;font-weight:700;font-family:Heebo;"> {{subject}} </span>
                        <br />
                        <span style="font-size:30px; font-weight:500;font-family:Heebo; line-height:80%; text-align:right">{{diff}} יח"ל</span>    
                        <br />
                        <span style="font-size:20px; font-weight:300;font-family:Heebo; line-height:80%; text-align:right">{{ctargil}} תרגילים נשלחו, {{cou}} מתוכם נפתרו.</span>    
                                         

                    </div>          
                    {{/each}}
                </script>

    <script id="stu-temp" type="text/x-handlebars-template">
        <table class="w3-table-all w3-card">
            <tr>
                <th>מספר סידורי של תרגיל</th>
                <th>קישור</th>
                <th>תשובה</th>
                <th>האם התרגיל נפתר?</th>
                <th>תאריך יצירה</th>
                <th>תאריך תפוגה</th>
                <th>המורה המפיץ</th>
            </tr>
            {{#each stu}}
            <tr>
                <td>{{ID}}</td>
                <td><a href="{{location}}">צפייה בתרגיל</a></td>
                <td>{{answ}}</td>
                <td> <i class="material-icons">{{Geticon iscomplete}}</i></td>
                <td>{{datec}}</td>
                <td>{{exp}}</td>
                <td>{{byy}}</td>
            </tr>
            {{/each}}
        </table>
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            var newSelect = document.createElement('select');
            newSelect.id="ID";
            newSelect.name="ID";
            newSelect.className="w3-select"
            var selectHTML = "";
            var data = (<%=this.json%>);
            var choices = $.map(data, function(el) { return el; })
            for (i = 0; i < choices.length; i = i + 1) {
                var x = choices[i]["ID"];
                var y = choices[i]["name"];
                selectHTML += "<option value='" + x + "'>" + y + "</option>";
            }
            selectHTML += "</select>";

            newSelect.innerHTML = selectHTML;
            document.getElementById('student_selection').appendChild(newSelect);
            Handlebars.registerHelper('Geticon', function (iscomplete) {
                if(iscomplete== "true" || iscomplete=="1" || iscomplete=="True")
                {
                    var r = "done";
                }
                else if(iscomplete== "false" || iscomplete=="0" || iscomplete=="False")
                {
                    var r="clear";
                }
                else
                {
                    var r="texture";
                }
                return r;
             });
             
        var stuInfo = document.getElementById("stu-temp").innerHTML;
        var stuTemplate = Handlebars.compile(stuInfo);
        var stuData = stuTemplate(<%=this.json2%>);
        document.getElementById("stu-div").innerHTML += stuData;

        var proInfo = document.getElementById("pro-temp").innerHTML;
        var proTemplate = Handlebars.compile(proInfo);
        var proData = proTemplate(<%=this.json3%>);
        document.getElementById("pro-div").innerHTML += proData; 
        
        var subInfo = document.getElementById("sub-temp").innerHTML;
        var subTemplate = Handlebars.compile(subInfo);
        var subData = subTemplate(<%=this.json4%>);
        document.getElementById("sub-div").innerHTML += subData; 
        });
    </script>
</body>
</html>
