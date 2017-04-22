<%@ Page Language="C#" AutoEventWireup="true" CodeFile="maagarT.aspx.cs" Inherits="maagarT" %>
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
       <td>תאריך יצירה</td>
                         <td class="w3-third"><select id="yyyy" name="yyyy" class="w3-select">
               <option value="0">שנה</option>
               <option>2017</option>       
               <option>2018</option> 
               <option>2019</option>       
               <option>2020</option>
               <option>2021</option>       
               <option>2022</option>  
               </select>
       
           <td class="w3-third"><select id="mm" name="mm" class="w3-select">
               <option value="0">חודש</option>
                <option>01</option>       
            <option>02</option>       
            <option>03</option>       
            <option>04</option>       
            <option>05</option>       
            <option>06</option>       
            <option>07</option>       
            <option>08</option>       
            <option>09</option>       
            <option>10</option>       
            <option>11</option>       
            <option>12</option>  
               </select></td>
                             <td class="w3-third"><select id="dd" name="dd" class="w3-select">
            <option value="0">יום</option>
            <option>01</option>       
            <option>02</option>       
            <option>03</option>       
            <option>04</option>       
            <option>05</option>       
            <option>06</option>       
            <option>07</option>       
            <option>08</option>       
            <option>09</option>       
            <option>10</option>       
            <option>11</option>       
            <option>12</option>       
            <option>13</option>       
            <option>14</option>       
            <option>15</option>       
            <option>16</option>       
            <option>17</option>       
            <option>18</option>       
            <option>19</option>       
            <option>20</option>       
            <option>21</option>       
            <option>22</option>       
            <option>23</option>       
            <option>24</option>       
            <option>25</option>       
            <option>26</option>       
            <option>27</option>       
            <option>28</option>       
            <option>29</option>       
            <option>30</option>       
            <option>31</option>   
                   </select></td> 
           

           </td>
           </tr>

            </table>
         <input type="submit" name="submit" id="Submit" value="צפייה" />
            </form>
        </div>
    <div id="jsn1" style="opacity:0;width:80%;margin-left:auto;margin-right:auto" class="w3-responsive" runat="server">
        <div id="stu-div"></div>
        <div id="tat-div"></div>
        </div>

     <script id="stu-temp" type="text/x-handlebars-template">
        <table id="table" class="w3-table-all w3-card">
                <tr>
                <th>מספר סידורי של תרגיל</th>
                <th>האם נפתר</th>
                <th>תאריך הפצה</th>
                <th>תאריך תפוגה</th>
                <th>הופץ ע"י</th>
                <th>שם התלמיד</th>
                <th>כיתה</th>
                <th>תמונה</th>
            </tr>
            {{#each stu}}
            <tr id="{{ID}}">
                <td>{{ID}}</td>
                <td> <i class="material-icons">{{Geticon iscomplete}}</i></td>
                <td>{{datec}}</td>
                <td>{{exp}}</td>
                <td>{{byy}}</td>
                <td>{{name}}</td>
                <td>{{kita}}</td>
                <td><img src="media/{{pic}}" style="width:60px; height:60px;margin:10px;" class="w3-circle w3-center w3-half"></td>
            </tr>
            {{/each}}
        </table>
    </script>
    <script id="tat-temp" type="text/x-handlebars-template">
         <table class="w3-table-all w3-card">
            <tr>
                <th>מספר סידורי של תרגיל</th>
                <th>קישור</th>
                <th>תשובה</th>
                <th>דרגת קושי</th>
            </tr>
            {{#each stu}}         
                <tr>
                    <td>{{ID}}</td>
                    <td><a href="{{location}}">צפייה בתרגיל</a></td>
                    <td>{{answ}}</td>
                    <td>{{diff}} יח"ל</td>
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

            var tatInfo = document.getElementById("tat-temp").innerHTML;
            var tatTemplate = Handlebars.compile(tatInfo);
            var tatData = tatTemplate(<%=this.json2%>);
            document.getElementById("tat-div").innerHTML += tatData;
            /*
            var array = [];
            var headers = [];
            $('#table th').each(function (index, item) {
                headers[index] = $(item).html();
            });
            $('#table tr').has('td').each(function () {
                var arrayItem = {};
                $('td', $(this)).each(function (index, item) {
                    arrayItem[headers[index]] = $(item).html();
                });
                array.push(arrayItem);
            });
            array = JSON.stringify(array);
            alert(array);
                
            document.getElementById("btn").addEventListener('click', function myFunction() {
                var x = document.getElementById("Demo2");
                if (x.className.indexOf("w3-show") == -1) {
                    x.className += " w3-show";
                } else {
                    x.className = x.className.replace(" w3-show", "");
                }
            });*/
            });
            Handlebars.registerHelper('Geticon', function (iscomplete) {
                if (iscomplete == "true" || iscomplete == "1" || iscomplete == "True") {
                    var r = "done";
                }
                else if (iscomplete == "false" || iscomplete == "0" || iscomplete == "False") {
                    var r = "clear";
                }
                else {
                    var r = "texture";
                }
                return r;
               
            });
           
    </script>
            <%=Session["errform"] %>
</body>
</html>
