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
    <form method="post">
        <table align=center>
     <tr>
     <td>נושא  </td>
      <td>
         <select id="subject" name="subject">
             <option value="0">בחר נושא</option>
           <option value="1">אנגלית</option>
             <option value="2">מדעי המחשב</option>
             <option value="3">מתמטיקה</option>
            <option value="4">ערבית</option>
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
      <td><input type="text" id="numof" name="numof" maxlength="145" size="15"onkeypress='validate(event)'/></td>
       </tr>
         <tr>
       <td>דרגת קושי</td>
       <td><select id="diff" name="diff">
             <option value="0">בחר דרגת קושי</option>
             <option value="3">3 יחידות</option>
            <option value="4">4 יחידות</option>
           <option value="5">5 יחידות</option>
           </select> 
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
                    </td></tr><tr>
            <td> <input type="submit" value="שלח" name="submit"/></td>  </tr>
    </table>
    </form>
    
  

    <%=Session["ErrIsertForm"] %>
</body>
</html>
