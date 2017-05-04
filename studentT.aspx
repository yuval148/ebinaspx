<%@ Page Language="C#" AutoEventWireup="true" CodeFile="studentT.aspx.cs" Inherits="studentT" %>
<!--#include file="upperT.aspx"-->
<html>
<head>
    <title></title>
    <script src="js/jquery.flot.min.js"></script>
    <script>
        $(document).ready(function () {
            var graphData = [{
                // Visits
                data: [ [6, 1300], [7, 1600], [8, 1900], [9, 2100], [10, 2500], [11, 2200], [12, 2000], [13, 1950], [14, 1900], [15, 2000] ],
                color: '#71c73e'
            }, {
                // Returning Visits
                data: [ [6, 500], [7, 600], [8, 550], [9, 600], [10, 800], [11, 900], [12, 800], [13, 850], [14, 830], [15, 1000] ],
                color: '#77b7c5',
                points: { radius: 4, fillColor: '#77b7c5' }
            }
            ];
       
        $.plot($('#graph-lines'), graphData, {
            series: {
                points: {
                    show: true,
                    radius: 5
                },
                lines: {
                    show: true
                },
                shadowSize: 0
            },
            grid: {
                color: '#646464',
                borderColor: 'transparent',
                borderWidth: 20,
                hoverable: true
            },
            xaxis: {
                tickColor: 'transparent',
                tickDecimals: 2
            },
            yaxis: {
                tickSize: 1000
            }
        });
 
        // Bars
        $.plot($('#graph-bars'), graphData, {
            series: {
                bars: {
                    show: true,
                    barWidth: .9,
                    align: 'center'
                },
                shadowSize: 0
            },
            grid: {
                color: '#646464',
                borderColor: 'transparent',
                borderWidth: 20,
                hoverable: true
            },
            xaxis: {
                tickColor: 'transparent',
                tickDecimals: 2
            },
            yaxis: {
                tickSize: 1000
            }
        });
        });
</script>
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
            table.w3-table-all td {
                text-align:center;
            }
            table.w3-table-all th {
                text-align:center;
            }
            .graph-container,
.graph-container div,
.graph-container a,
.graph-container span {
    margin: 0;
    padding: 0;
}
            .graph-container, #tooltip, .graph-info a {
    background: #ffffff;
    background: -moz-linear-gradient(top, #ffffff 0%, #f9f9f9 100%);
    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#ffffff), color-stop(100%,#f9f9f9));
    background: -webkit-linear-gradient(top, #ffffff 0%,#f9f9f9 100%);
    background: -o-linear-gradient(top, #ffffff 0%,#f9f9f9 100%);
    background: -ms-linear-gradient(top, #ffffff 0%,#f9f9f9 100%);
    background: linear-gradient(to bottom, #ffffff 0%,#f9f9f9 100%);
 
    -webkit-border-radius: 3px;
    -moz-border-radius: 3px;
    border-radius: 3px;
}
            .graph-container {
    position: relative;
    width: 550px;
    height: 300px;
    padding: 20px;
 
    -webkit-box-shadow: 0px 1px 2px rgba(0,0,0,.1);
    -moz-box-shadow: 0px 1px 2px rgba(0,0,0,.1);
    box-shadow: 0px 1px 2px rgba(0,0,0,.1);
}
 
.graph-container > div {
    position: absolute;
    width: inherit;
    height: inherit;
    top: 10px;
    left: 25px;
}
 
.graph-info {
    width: 590px;
    margin-bottom: 10px;
}
    </style>
    <link href="css/homeT.css" rel="stylesheet" />
</head>
<body>
    <div id="graph-wrapper">
<div class="graph-info">
        <a href="javascript:void(0)" class="visitors">Visitors</a>
        <a href="javascript:void(0)" class="returning">Returning Visitors</a>
        <a href="#" id="bars"><span></span></a>
        <a href="#" id="lines" class="active"><span></span></a>
    </div>
<div class="graph-container">
<div id="graph-lines"></div>
<div id="graph-bars"></div>
    </div>
</div>
    <div id="page-wrap">
        <div id="form" class="w3-panel w3-card-4 " style="opacity:100">
            <form method="post">
                <div class="w3-cell">
                    <h5 class="">בחר תלמיד לצפייה</h5>
                    <div style="width:200px" id="student_selection"></div><br />
                    <input class="w3-button w3-red w3-hover-red" type="submit" name="submit" id="Submit" value="צפה בתלמיד" />
                </div>
            </form>
        </div>
        <hr />
        <div class="w3-row">
            <div id="pro-div" class="w3-panel w3-row w3-right w3-half">
                
            </div>
            <div id="changepass" style="opacity:0;float:right; margin-top:60px; font-family:Heebo" class="w3-panel w3-half" runat="server">
                    <div id="pass" style="opacity:0" runat="server">
                        <table align="center">
                            <tr>
                                <td style="font-weight:700">שם משתמש</td>
                                <td><span style="color:#9c9c9c"><%=userName %></span></td>
                            </tr>
                            <tr>
                                <td style="font-weight:700">סיסמה</td>
                                <td><input class="w3-input" type="text" name="userPass1" id="userPass1" placeholder="<%=userPass %>"></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><span style="font-family:Heebo; font-weight:300">לעדכון סיסמה, הכנס את הסיסמה החדשה ולחץ עדכן.</span></td>
                            </tr>
                        </table> 
                        <button style="margin-right:62.5%" class="w3-button w3-red w3-hover-red" name="update" id="update">עדכון סיסמה</button>
                    </div>
                    <br />
                </div>
            <div id="stuopc" style="opacity:0;width:80%;margin-left:auto;margin-right:auto" class="w3-responsive" runat="server">
            <div class="w3-panel" style="text-align:right"id="stu-div"></div>
        </div>
            </div>
        <script id="pro-temp" type="text/x-handlebars-template">
                    {{#each stu}}
                                <img src="media/{{pic}}" style="width:120px; height:120px;margin:10px;" class="w3-circle w3-right w3-half">
                    <div class="w3-half w3-right w3-cell w3-cell-middle" style="top:200px;line-height:normal">
                        <span style="font-size:50px;font-weight:700;font-family:Heebo;"> {{name}} </span>
                        <br />
                        <span style="font-size:20px; font-weight:300;font-family:Heebo; line-height:80%; text-align:right">{{kita}}, קבוצת  {{team}}</span><br />
                       <div style="margin:10px" class="w3-right"><button type="button" onclick="document.getElementById('pass').style.opacity = '100'" class="w3-button w3-center w3-red w3-hover-red">הצג סיסמה</button></div>
                    </div>
                    {{/each}}
                </script>
    <script id="stu-temp" type="text/x-handlebars-template">
        <table class="w3-table-all w3-card">
            <tr>
                <th>נושא</th>
                <th>דרגת קושי</th>
                <th>מספר התרגילים שנשלחו בנושא</th>
                <th>מספר התרגילים שנפתרו מתוכם</th>
                <th>אחוז שליטה</th>
            </tr>
            {{#each stu}}
            <tr>
                <td>{{subject}}</td>
                <td>{{diff}} יח"ל</td>
                <td>{{ctargil}}</td>
                <td>{{cou}}</td>
                <td>{{GetMasterPrecent cou ctargil}}%</td>
            </tr>
            {{/each}}
        </table>
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            var newSelect = document.createElement('select');
            newSelect.id="ID";
            newSelect.name="ID";
            newSelect.className="w3-select";
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
        var stuInfo = document.getElementById("stu-temp").innerHTML;
        var stuTemplate = Handlebars.compile(stuInfo);
        var stuData = stuTemplate(<%=this.json2%>);
        document.getElementById("stu-div").innerHTML += stuData;

        var proInfo = document.getElementById("pro-temp").innerHTML;
        var proTemplate = Handlebars.compile(proInfo);
        var proData = proTemplate(<%=this.json3%>);
        document.getElementById("pro-div").innerHTML += proData;
        
        document.getElementById("update").onclick = function() {send()};
        function send(){
            var ID="<%=ID%>";
            var up = document.getElementById("userPass1").value;
            up = '"' + up+'"';
            $.ajax({
                        type: "POST",
                        url: "studentT.aspx/changepss",
                        data:'{"userPass1":'+up+',"ID":'+ID+' }',
                        contentType: "application/json; charset=utf-8",
                        success: function() {
                            alert("yayyyy");
                        },
                        failure: function() {
                            alert("oy");
                        }
            });
            }
        });
    </script>
</body>
</html>
