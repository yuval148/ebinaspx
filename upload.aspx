<%@ Page Language="C#" AutoEventWireup="true" CodeFile="upload.aspx.cs" Inherits="upload" %>
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
    <div id="class_selection">
         <form name="f" id="f" method="post" onsubmit="return check();">
     
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
      <td>תשובה</td>
      <td><input type="text" id="tat" name="answ" maxlength="145" size="15"/></td>
       </tr>
         <tr>
       <td>זרגשת קושי</td>
       <td><select id="diff" name="digg">
             <option value="0">בחר דרגת קושי</option>
             <option value="3">3 יחידות</option>
            <option value="4">4 יחידות</option>
           <option value="5">5 יחידות</option>
           </select> 
           </td>
           </tr>
         <tr>
         <td> <input type="submit" value="שלח" name="submit" /></td>  
             </tr>
    </table>
    </form>
    </div>
    <script type="text/javascript">
        /*
        $(document).ready(function () {
            var newSelect = document.createElement('select');
            newSelect.id="subject";
            var selectHTML = "";
            var choices =["יב4","יב3","יב2"] //להחליף במתשנים לא סטטים
            for (i = 0; i < choices.length; i = i + 1) {
                selectHTML += "<option value='" + choices[i] + "'>" + choices[i] + "</option>";
            }
            selectHTML += "</option>";

            newSelect.innerHTML = selectHTML;
            document.getElementById('class_selection').appendChild(newSelect);


        });
        */
    </script>

    
</body>
</html>
