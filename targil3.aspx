<%@ Page Language="C#" AutoEventWireup="true" CodeFile="targil3.aspx.cs" Inherits="targil3" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="Newtonsoft" %>
<!--#include file="upper.aspx"-->

<!doctype html>
<html dir="rtl">
   
<head>
    <title>תרגולית-אלגברה</title>
    <link href="css/targil.css" rel="stylesheet" />
</head>
<body>
    <div id="page-wrap">
        <div id="exercise" class="w3-card w3-panel"></div><hr />
        <div class="w3-row">
            <div id="ansBtn" dir="ltr" class="w3-col" style="width:auto">
                    <button class="w3-btn w3-gray" id="skip">דלג</button>
                    <button id="Btn" class="w3-button w3-indigo" type="button">בדוק תשובה</button>
                    <div id="demo-toast-example" class="mdl-js-snackbar mdl-snackbar">
                        <div class="mdl-snackbar__text"></div>
                        <button class="mdl-snackbar__action" type="button"></button>
                    </div>
                <form id="ans">
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                        <input class="mdl-textfield__input" type="text" pattern="-?[0-9]*(\.[0-9]+)?" id="numb">
                            <label class="mdl-textfield__label" for="sample4">הכנס ערך X</label>
                        <span class="mdl-textfield__error">X צריך להיות מספר</span>
                    </div>
                </form>     <br />
            </div>
            <div id="infoDiv" class="w3-card w3-third w3-right">   
                <ul class="w3-ul">
                    <li class="w3-padding-16">
                        <i class="material-icons">info</i>
                        <span class="w3-large">נוסחת השורשים</span><br>
                        <span>שימוש בנוסחאת השורשים נעשה כאשר יש משוואה משתי מעלות<br />
                            <img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/a62e1c4fb012beb24706443a8482872d6c36b667" alt="{\displaystyle x_{1,2}={\frac {-b\pm {\sqrt {b^{2}-4ac}}}{2a}}}"/></span>
                    </li>
                    <li class="w3-padding-16">
                        <i class="material-icons">error_outline</i>
                        <span class="w3-large">לא לשכוח לסדר את המשוואה</span><br>
                        <span> חשוב לשים לב שהמשוואה מסודרת כראוי<br />
                            <img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/23e70cfa003f402d108ec04d97983fb62f69536e" alt="{\displaystyle ax^{2}+bx+c=0}"/></span>
                    </li>
                    <li class="w3-padding-16">
                        <i class="material-icons">help</i>
                        <span class="w3-large">עדיין מתקשה?</span><br>
                        <span>צפה בסרטון לדוגמא על הנושא
                            <button class="w3-button w3-indigo"><a style="text-decoration:none;color:white" href="https://www.youtube.com/watch?v=38_XIEnjo80">לחץ כאן</a></button>
                        </span>
                    </li>
                </ul>
             </div>   
        </div>
        
                  
<div id="modal">
    <div id="id01" class="w3-modal w3-animate-opacity w3-center">
    <div class="w3-modal-content w3-card-4">
      <header class="w3-container w3-indigo"> 
        <span onclick="document.getElementById('id01').style.display='none'" 
        class="w3-button w3-display-topright">&times;</span>
        <h2>תשובה נכונה!</h2>
      </header>
      <div class="w3-container">
        <p>כל הכבוד! עבודה קשה משתלמת</p>
      </div>
      <footer class="w3-container w3-indigo">
   <button class="w3-button w3-indigo w3-hover-indigo" id="next">לתרגיל הבא</button>      
      </footer>
    </div>
  </div>
         <div id="id02" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-center">
      <header class="w3-container w3-red"> 
        <span onclick="document.getElementById('id02').style.display='none'" 
        class="w3-button w3-display-topright">&times;</span>
        <h2>תשובה שגויה</h2>
      </header>
      <div class="w3-container">
        <p>לא נורא, תמיד אפשר לנסות שוב!</p>
      </div>
      <footer class="w3-container w3-red">
          <button class="w3-button" id="skip2">נסה שוב</button>      

      </footer>
    </div>
  </div>
    </div>
        </div>     
   <script type="text/javascript">
       var images = '';
       var nextBtn = document.querySelector("#next"); var skipBtn =document.querySelector("#skip"); var skipBtn2 =document.querySelector("#skip2");
       var imagePointer = 0; var answerPointer = 0;
       var data = (<%=this.json%>); var count = data.sub.length;
       var ans = data.sub[answerPointer].answ;
       var isC = false;
       var id=(data.sub[imagePointer].ID);

       updateImage();
       updateAnswer();
       imagePointer++;
       answerPointer++;

       function updateImage() {
           if(imagePointer >= count) imagePointer = 0;
           images = '<img class="img w3-center" src="' + data.sub[imagePointer].location+'" />';
           document.getElementById( 'exercise' ).innerHTML = images;
           //alert(exercise.innerHTML);
           id =(data.sub[imagePointer].ID);
       }
       function updateAnswer() {
           if(answerPointer >= count) answerPointer = 0;
           answers = data.sub[answerPointer].answ ; 
           ans = answers;
           //alert(ans);
       }

       nextBtn.addEventListener('click', function() {
           $( "#modal" ).click(function() {
               $( "#id01" ).fadeOut();
           });
           updateImage();
           updateAnswer();
           imagePointer++;
           answerPointer++;

       });

       skipBtn.addEventListener('click', function() {
           updateImage();
           updateAnswer();
           imagePointer++;
           answerPointer++;

       });
       skipBtn2.addEventListener('click', function() {
           $( "#modal" ).click(function() {
               $( "#id02" ).fadeOut();
           });

       });
       (function check () {
            
           var btn = document.querySelector('#Btn');
           btn.addEventListener('click', function () {
               'use strict';
               
               var x = document.getElementById("numb").value;
               if (x == ans) {
                   document.getElementById('id01').style.display='block';
                   $.ajax({
                    type: "POST",
                    url: "targil1.aspx/change",
                    data:'{"tatID":'+id+',"ID":'+<%=Session["ID"]%>+' }',
                    contentType: "application/json; charset=utf-8",
                    success: function() {
                        alert("yayyyy");
                    },
                    failure: function() {
                        alert("oy");
                    }
                });
               }
               else {
                   document.getElementById('id02').style.display='block';

               }

           });
       }());
  </script>
</body>

</html>