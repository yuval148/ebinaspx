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
    <form runat="server">
        <asp:FileUpload ID="FileUpload1" runat="server" EnableViewState="false"/>
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
       <td>דרגשת קושי</td>
       <td><select id="diff" name="diff">
             <option value="0">בחר דרגת קושי</option>
             <option value="3">3 יחידות</option>
            <option value="4">4 יחידות</option>
           <option value="5">5 יחידות</option>
           </select> 
           </td>
           </tr>
     
    </table>
        <asp:Button ID="btnUpload" runat="server" Text="Upload"  
           OnClientClick = "return ValidateFile()" type="submit" value="שלח" name="submit"  />
        <hr />
        <asp:Label ID="Label1" runat="server" Text="" />
    </form>

    <%=Session["ErrIsertForm"] %>
</body>
</html>
