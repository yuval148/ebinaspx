﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="upload.aspx.cs" Inherits="upload" %>
<!--#include file="upper.aspx"-->

<html>
  <head>    
      <script type ="text/javascript">
    var validFilesTypes=["bmp","gif","png","jpg","jpeg"];
    function ValidateFile()
    {
      var file = document.getElementById("<%=FileUpload1.ClientID%>");
      var label = document.getElementById("<%=Label1.ClientID%>");
      var path = file.value;
      var ext=path.substring(path.lastIndexOf(".")+1,path.length).toLowerCase();
      var isValidFile = false;
      for (var i=0; i<validFilesTypes.length; i++)
      {
        if (ext==validFilesTypes[i])
        {
            isValidFile=true;
            break;
        }
      }
      if (!isValidFile)
      {
        label.style.color="red";
        label.innerHTML="Invalid File. Please upload a File with" +
         " extension:\n\n"+validFilesTypes.join(", ");
      }
      if(isValidFile) {
         alert("התמונה הועלתה בהצלחה!")
      }
      return isValidFile;
     }
</script>
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
    <form runat="server">
    <asp:FileUpload ID="FileUpload1" runat="server" EnableViewState="false"/>
<asp:Button ID="btnUpload" runat="server" Text="Upload"  
           OnClientClick = "return ValidateFile()"  OnClick="Upload"  />

<hr />

<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" ShowHeader="false">
    <Columns>
        <asp:BoundField DataField="Text" />
        <asp:ImageField DataImageUrlField="Value" ControlStyle-Height="100" ControlStyle-Width="100" />
    </Columns>
</asp:GridView>
<asp:Label ID="Label1" runat="server" Text="" />

        </form>
            <h1>התמונות נמצאות בImages </h1>



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
