<%@ Page Language="C#" AutoEventWireup="true" CodeFile="upload.aspx.cs" Inherits="upload" %>
<!--#include file="upper.aspx"-->

<html>
  <head>
  <title>דף העלאה</title>
  <style>
        body {
                background: url("/media/bg5.jpg");
                background-size: 100%, 100%;
                background-repeat: no-repeat;
            }
    </style>
  </head>
<body style="font-family:Arial, Helvetica, Sans-Serif; text-align:center;">
    <form name="f" id="f" method="post" onsubmit="return check();">
     
     <table align=center>
     <tr>
     <td>subject  </td>
      <td>
         <select id="subject" name="subject">
             <option value="מקצוע">בחר מקצוע</option>
           <option value="אנגלית">אנגלית</option>
             <option value="מדעי המחשב">מדעי המחשב</option>
             <option value="מתמטיקה">מתמטיקה</option>
            <option value="ערבית">ערבית</option>
             <option value="פיזיקה">פיזיקה</option>
             <option value="אזרחות">אזרחות</option>
             <option value="היסטוריה">היסטוריה</option>
             <option value="לשון">לשון</option>
             <option value="ספרות">ספרות</option>
              <option value="כימיה">כימיה</option>
             <option value="סוציולוגיה">סוציולוגיה</option>
                </select> 
                </td>
      </tr>
       <tr>
      <td>tat</td>
      <td><input type="text" id="tat" name="tat" maxlength="145" size="15"/></td>
       </tr>
       <tr>
       <td>link</td>
       <td><input type="text" id="link" name="link"  maxlength="16" 
               size="15" /></td>
       </tr>
        <tr>
      <td>ctargil</td>
      <td><input type="text" id="ctargil" name="ctargil" maxlength="16" size="15"/></td>
       </tr>
          <tr>
      <td>xp</td>
      <td><input type="text" id="xp" name="xp" maxlength="9" size="9"/></td>
       </tr>
       
         <td> <input type="submit" value="שלח" name="submit"/></td>  
    </table>
    </form>
    
    <div id="class_selection"></div>

<p align="center" style="height: 96px ;font-size:50px">
<%=Session["ErrIsertForm"]%>
    </p>
    <script type="text/javascript">
        $(document).ready(function () {
            var newSelect = document.createElement('select');
            var selectHTML = "";
            var choices =["יב4","יב3","יב2"] //להחליף במתשנים לא סטטים
            for (i = 0; i < choices.length; i = i + 1) {
                selectHTML += "<option value='" + choices[i] + "'>" + choices[i] + "</option>";
            }
            selectHTML += "</option>";

            newSelect.innerHTML = selectHTML;
            document.getElementById('class_selection').appendChild(newSelect);

        });
    </script>
</body>
</html>
