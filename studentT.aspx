<%@ Page Language="C#" AutoEventWireup="true" CodeFile="studentT.aspx.cs" Inherits="culture" %>
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
    </style>

</head>
<body style="font-family:Arial; text-align:center;">
<br />
    <div id="form" style="opacity:100" runat="server">
    <form method="post">
     <table align="center">
            <tr>
                <td>תלמיד</td>
                <td>
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


        });

    </script>
                    <div id="student_selection">
    </div>
                    </td></tr>
            </table>
         <input type="submit" name="submit" id="Submit" value="צפה בתלמיד" />
            </form>
        </div>
    <!-- צריך להיות פה כפתור שרק בלחיצה עליו מפעיל את הדיב הבא !-->
    <div id="changepass" style="opacity:0" runat="server">
        <form id=pass method="post">
            <table align="center">
                <tr>
                    <td>סיסמה</td>
                    <td><input class="w3-input" type="text" name="userPass1" id="userPass1" placeholder="<%=userPass %>"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><span style="font-family:Heebo; font-weight:300">לעדכון סיסמה, הכנס את הסיסמה החדשה ולחץ עדכן.</span></td>
                </tr>
            </table>
            <input type="submit" name="update" id="update" value="עדכן סיסמה" onClick="changepss" runat="server" />
        </form>
        </div>
</body>
</html>
