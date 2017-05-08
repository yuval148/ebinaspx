<%@ Page Language="C#" AutoEventWireup="true" CodeFile="signup.aspx.cs" Inherits="signup" %>
<!--#include file="upper.aspx"-->

<html>
 <head>
    <title>הרשמה</title>
    <link href="css/signup.css" rel="stylesheet" />
 </head>
<body style="font-family:Arial, Helvetica, Sans-Serif">
    <div id="page-wrap">
        <div class="w3-panel w3-card">
            <header class="w3-container">
                <h2>ברוך הבא</h2>
            </header>     
            <article class="w3-container"> 
               <div class="w3-panel w3-rightbar w3-border-blue">
 <p id="info">פסקה זו תספק הסבר קצר למשתמש על מה שקורה עכשיו. בוא נתחיל!</p></div>
            </article>        
            <hr />
            <footer class="w3-container">
                <ul class="progressbar">
                    <li> הכנסת פרטים בסיסיים</li>
                    <li>בחירת שם משתמש וסיסמא</li>
                    <li>העלאת תמונת פרופיל</li>
                    <li>סיום ההרשמה</li>
                </ul>
            </footer>
        </div>
        <div id="signupForm" class="w3-card w3-white w3-panel" style="text-align:center">
        <form name="f" id="f" method="post" class="w3-container" runat="server" onsubmit="return check();">
            <div id="0" class="w3-hide w3-animate-left">
                <p><label>שם</label> <input type="text" class="w3-input" id="name" name="name" maxlength="50" size="15"/></p> 
                <p><label>כיתה</label> <input type="text" class="w3-input" id="kita" name="kita" maxlength="4" size="15"/></p>
                <p><label>מספר ת.ז</label> <input type="text" class="w3-input" id="ID" name="ID" maxlength="9" size="9" /></p>  
            </div>  
            <div id="1" class="w3-hide w3-animate-left"> 
                <p><label>שם משתמש</label> <input type="text" class="w3-input" id="userName" name="userName" maxlength="145" size="15"/></p> 
                <p><label>סיסמה</label> <input type="password"  class="w3-input" id="userPass" name="userPass"  maxlength="16" size="15" /></p> 
                <p><label>קבוצה</label> <input type="text" class="w3-input" id="team" name="team" maxlength="16" size="15" /></p> 
                <input type="submit" class="w3-button w3-indigo" onclick="profile()" value="הירשם" name="submit" />
            </div>
            <div id="2" class="w3-hide w3-animate-left">
                     <asp:FileUpload ID="FileUpload1" runat="server"/>
                <asp:Button ID="btnUpload" class="w3-button w3-indigo" runat="server" Text="העלה" OnClick="Upload" />
               
            </div>
    </form>  
   <button id="btn" class="w3-button w3-teal" onclick="update()">בוא נתחיל</button>

            </div>  
    
<div id="p-alert" class="w3-panel w3-card w3-green w3-round w3-hide">
    <h3>Success!</h3>
    <p id="p"> <%=Session["ErrIsertForm"] %></p>
</div>
        </div>
        <script src="js/signup.js" charset="utf-8"></script>
</body>
</html>
