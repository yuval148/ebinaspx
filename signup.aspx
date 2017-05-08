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
                <p>פסקה זו תספק הסבר קצר למשתמש על מה שקורה עכשיו. בוא נתחיל!</p>
            </article>        
            <hr />
            <footer class="w3-container">
                <ul class="progressbar">
                    <li>הכנסת פרטים</li>
                    <li>צעד 2</li>
                    <li>צעד 3</li>
                    <li>צעד 4</li>
                </ul>
            </footer>
        </div>
        <div class="w3-card" style="text-align:center">
        <form name="f" method="post" class="w3-container" onsubmit="return check();">
            <div id="0" class="w3-hide w3-animate-left">
                <p><label>שם</label> <input type="text" class="w3-input" id="name" name="name" maxlength="50" size="15"/></p> 
                <p><label>כיתה</label> <input type="text" class="w3-input" id="kita" name="kita" maxlength="4" size="15"/></p>
                <p><label>מספר ת.ז</label> <input type="text" class="w3-input" id="ID" name="ID" maxlength="9" size="9" /></p>  
            </div>  
            <div id="1" class="w3-hide w3-animate-left"> 
                <p><label>שם משתמש</label> <input type="text" class="w3-input" id="userName" name="userName" maxlength="145" size="15"/></p> 
                <p><label>סיסמה</label> <input type="password"  class="w3-input" id="userPass" name="userPass"  maxlength="16" size="15" /></p> 
                <p><label>קבוצה</label> <input type="text" class="w3-input" id="team" name="team" maxlength="16" size="15" /></p> 
                <input type="submit" class="w3-button w3-indigo" value="הירשם" name="submit" />
            </div> 
    </form>  
                        <button id="btn" class="w3-button w3-teal" onclick="update()">בוא נתחיל</button>

            </div>  
    
<p align="center" style="height: 96px ;font-size:50px"></p>
<div class="mdl-components__warning"><%=Session["ErrIsertForm"] %></div>
        </div>
        <script src="js/signup.js" charset="utf-8"></script>
</body>
</html>
