<%@ Page Language="C#" AutoEventWireup="true" CodeFile="studentT.aspx.cs" Inherits="studentT" %>
<!--#include file="upperT.aspx"-->
<html>
<head>
    <title></title>
   <script>
       
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
            #div{
                 width:500px;
                 height:250px;
            }
    </style>
    <link href="css/homeT.css" rel="stylesheet" />
</head>
<body>
    <div id="page-wrap">
        <div id="div"><canvas id="myChart"></canvas></div>
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
        <script src="js/studentT.js"></script>
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
        var canvas = document.getElementById('myChart');
        var yLabels = {
            0 : 'בכלל לא',
            4 : 'טיפה',
            10 : 'ערב קוקטיילים',
            14 : 'האדמין האשכנזי',
            16 : 'תכנית אירוח של צביקה הדר',
            20 : 'הקומיט הזה'
        }
        var data = {
            labels: ["January", "February", "March", "April", "May", "June", "July"],
            datasets: [
                {
                    label: "כמה גרוע אתה בגרף ובאיזה חודשים",
                    fill: false,
                    lineTension: 0.1,
                    backgroundColor: "rgba(75,192,192,0.4)",
                    borderColor: "rgba(75,192,192,1)",
                    borderCapStyle: 'butt',
                    borderDash: [],
                    borderDashOffset: 0.0,
                    borderJoinStyle: 'miter',
                    pointBorderColor: "rgba(75,192,192,1)",
                    pointBackgroundColor: "#fff",
                    pointBorderWidth: 1,
                    pointHoverRadius: 5,
                    pointHoverBackgroundColor: "rgba(75,192,192,1)",
                    pointHoverBorderColor: "rgba(220,220,220,1)",
                    pointHoverBorderWidth: 2,
                    pointRadius: 5,
                    pointHitRadius: 10,
                    data: [0,20, 16, 10, 4, 7,14],//להחליף בג'ייסון
                }
            ]
        };

        var option = {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true,
                        callback: function(value, index, values) {
                            return yLabels[value];
                        }
                    }
                }]
            }
        };
        var myLineChart = Chart.Line(canvas,{
            data:data,
            options:option
        });
    </script>
</body>
</html>
