<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DistributT.aspx.cs" Inherits="Distribut"%>
<!--#include file="upperT.aspx"-->

<html>
  <head>    
  <title>דף הפצה</title>
  <style>
        body {
                background: url("/media/bfg5.jpg");
                background-size: 100%, 100%;
                background-repeat: no-repeat;
            }
    </style>
          <script type="text/javascript">
      function validate(evt) {
  var theEvent = evt || window.event;
  var key = theEvent.keyCode || theEvent.which;
  key = String.fromCharCode( key );
  var regex = /[0-9]|\./;
  if( !regex.test(key) ) {
    theEvent.returnValue = false;
    if(theEvent.preventDefault) theEvent.preventDefault();
  }
      }
              </script>
  </head>
<body style="font-family:Arial, Helvetica, Sans-Serif; text-align:center;">
    <h3 style="font-family:Heebo;">מערכת הפצת תרגילים</h3>
    <form method="post">
        <table align=center>
     <tr>
     <td>נושא  </td>
      <td>
         <select id="subject" name="subject" class="w3-select">
             <option value="0">בחר נושא</option>
           <option value="1">פרבולות</option>
             <option value="2">טריגונומטריה</option>
             <option value="3">אלגברה</option>
            <option value="4">סטטיסטיקה והסתברות</option>
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
      <td>מספר התרגילים למשיכה</td>
      <td><input type="text" id="numof" name="numof" class="w3-input" maxlength="145" size="15"onkeypress='validate(event)'/></td>
       </tr>
         <tr>
       <td>דרגת קושי</td>
       <td><select id="diff" name="diff" class="w3-select">
             <option value="0">בחר דרגת קושי</option>
             <option value="3">3 יחידות</option>
            <option value="4">4 יחידות</option>
           <option value="5">5 יחידות</option>
           </select> 
           </td>
           </tr>
                     <tr>
                         
       <td>תאריך תפוגה</td>
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
        <br />
        <input class="w3-button w3-red" type="submit" value="שלח" name="submit"/>
    </form>
    
  <br />

    <%=Session["ErrIsertForm"] %>
</body>
</html>
