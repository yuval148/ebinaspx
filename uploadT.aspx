<%@ Page Language="C#" AutoEventWireup="true" CodeFile="uploadT.aspx.cs" Inherits="upload" %>
<!--#include file="upperT.aspx"-->

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
                background: url("/media/bfg5.jpg");
                background-size: 100%, 100%;
                background-repeat: no-repeat;
            }
    </style>
  </head>
<body style="font-family:Arial, Helvetica, Sans-Serif; text-align:center;">

    <h3 style="font-family:Heebo;">מערכת העלאת תרגיל</h3>
    <form runat="server">
        <table align=center>
            <tr><td></td><td>        <asp:FileUpload ID="FileUpload1" runat="server" EnableViewState="false"/></td></tr>
     <tr>
     <td>נושא  </td>
      <td>
         <select id="subject" name="subject" class="w3-select">
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
      <td><input type="text" id="tat" name="answ"  class="w3-input" maxlength="255" size="15"/></td>
       </tr>
         <tr>
       <td>דרגשת קושי</td>
       <td><select id="diff" name="diff" class="w3-select">
             <option value="0">בחר דרגת קושי</option>
             <option value="3">3 יחידות</option>
            <option value="4">4 יחידות</option>
           <option value="5">5 יחידות</option>
           </select> 
           </td>
           </tr>
     
    </table>
        <br />
        <asp:Button ID="btnUpload" runat="server" Text="העלה"  
           OnClientClick = "return ValidateFile()" type="submit" value="שלח" name="submit"  />

        <asp:Label ID="Label1" runat="server" Text="" />
    </form>
    <br />
    <%=Session["ErrIsertForm"] %>
</body>
</html>
