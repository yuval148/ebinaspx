<%@ Page Language="C#" AutoEventWireup="true" CodeFile="targil3.aspx.cs" Inherits="targil3" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="Newtonsoft" %>
<!--#include file="upper.aspx"-->

<!doctype html>
<html dir="rtl">
   
<head>
    <title></title> 
       
  <style>
         body {
                background: url("media/bg5.jpg");
                background-size: 100%, 100%;
                background-repeat: no-repeat; /*יש לך למטה*/
            }
                            @media screen and (max-width: 480px) {

           body {
               background: url("media/bgphone.png");
               background-size: 100% 100%;
           }
       }
         #info{
                margin-top:50px;
                margin-right:20px;
         }
         #photo{
             width:400px;
             height:400px;
         }
         .demo-list-icon {
  width: 300px;
}
.demo-card-image > .mdl-card__actions {
  height: 52px;
  padding: 16px;
  background: rgba(0, 0, 0, 0.2);
}
.demo-card-image__filename {
  color: #fff;
  font-size: 14px;
  font-weight: 500;
}
#infoDiv{
    display:block;
    margin-right:60%; /*עוד*/
    margin-top:10px;
}

             #infoDiv{
             }
             img.img {
			      width: 65%; /*Tells image to fit to width of parent container*/
                  display:block;
                          margin: auto;

			}
    #exercise {
        width: 75%; /*Use this to control width of the parent container, hence the image*/
        margin: auto;
        margin-top: 45px;
    }
    #ansBtn{
        margin-right:54%;
    }
    #ans{
        display:inline-block;
    }
    
    </style>  
</head>
<body>
     <main class="mdl-layout__content" id="container" >
        <div id="exercise" class="demo-card-square mdl-card mdl-shadow--2dp"></div>
         <div  id="ansBtn">
         <form id="ans">
  <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
    <input class="mdl-textfield__input" type="text" pattern="-?[0-9]*(\.[0-9]+)?" id="numb">
    <label class="mdl-textfield__label" for="sample4">הכנס ערך X</label>
    <span class="mdl-textfield__error">X צריך להיות מספר</span> <!--עודדדדדד!-->
  </div>
</form>
         <button id="Btn" class="w3-button w3-indigo" type="button">בדוק תשובה</button>
             </div>

         <div id="infoDiv" class="demo-card-square mdl-card mdl-shadow--2dp">
            <div class="mdl-card__title mdl-card--expand">
                <h2 class="mdl-card__title-text">מידע שימושי</h2>
            </div>

            <div class="mdl-card__supporting-text">
                <!-- Icon List -->

<ul class="demo-list-icon mdl-list">
  <li class="mdl-list__item">
    <span class="mdl-list__item-primary-content">
    <i class="material-icons mdl-list__item-icon">info</i>
</span>
      <img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/42efe5c6f302eb75186b3d5b782129850bfa04d1" />
  </li>
  <li class="mdl-list__item">
    <span class="mdl-list__item-primary-content">
    <i class="material-icons mdl-list__item-icon">info</i>
    סכום זוויות במשלוש 180
  </span>
  </li>
  <li class="mdl-list__item">
    <span class="mdl-list__item-primary-content">
    <i class="material-icons mdl-list__item-icon">info</i> <!--למטה אחי זה בסוף!-->
    אל תשכח לקנות חלב
  </span>
  </li>
</ul>
              
            </div>

        </div>
            <button id="skip">דלג</button>      
<div id="modal">
    <div id="id01" class="w3-modal w3-animate-opacity w3-center">
    <div class="w3-modal-content w3-card-4">
      <header class="w3-container w3-indigo"> 
        <span onclick="document.getElementById('id01').style.display='none'" 
        class="w3-button w3-display-topright">&times;</span>
        <h2>תשובה נכונה!</h2>
      </header>
      <div class="w3-container">
        <p>כל הכבוד! אני בטוח שאמא גאה</p>
      </div>
      <footer class="w3-container w3-indigo">
   <button id="next">לתרגיל הבא</button>      
      </footer>
    </div>
  </div>
         <div id="id02" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-center">
      <header class="w3-container w3-red"> 
        <span onclick="document.getElementById('id02').style.display='none'" 
        class="w3-button w3-display-topright">&times;</span>
        <h2>אוי לא!</h2>
      </header>
      <div class="w3-container">
        <p>על יוסיברטיסה כבר שמעת?</p>
      </div>
      <footer class="w3-container w3-red">
          <button id="skip2">נסה שוב</button>      

      </footer>
    </div>
  </div>
    </div>
   </main>  
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
           images = '<img class="img" src="' + data.sub[imagePointer].location+'" />';
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
                    url: "targil3.aspx/change",
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
