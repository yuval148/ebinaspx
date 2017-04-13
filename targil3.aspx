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
                background: url("/media/bg5.jpg");
                background-size: 100%, 100%;
                background-repeat: no-repeat; /*יש לך למטה*/
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
         <button id="Btn" class="mdl-button mdl-js-button mdl-button--raised"  onclick="check()" type="button">בדוק תשובה</button>
<div id="demo-toast-example" class="mdl-js-snackbar mdl-snackbar">
  <div class="mdl-snackbar__text"></div>
  <button class="mdl-snackbar__action" type="button"></button>
</div>
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
         <!--
         <div class="demo-card-image mdl-card mdl-shadow--2dp">
  <div class="mdl-card__title mdl-card--expand"></div>
  <div class="mdl-card__actions">
    <span class="demo-card-image__filename"><a  target="_blank" href="https://youtu.be/umRfjSqHyQs?t=1m51s">צריך עזרה?</a></span>
  </div>
</div>
         -->
         
        <!-- Colored raised button -->
         
    
   <button id="next">Next</button>      
   </main>  
   <script type="text/javascript">
       var images = '';
       var button = document.querySelector("#next");
       var imagePointer = 0;
       var answerPointer = 0;
       var data = (<%=this.json%>); var count = data.sub.length;
       var ans = data.sub[answerPointer].answ;
       var isC = false;
       var id=(data.sub[imagePointer].ID);

       function updateImage() {
           if(imagePointer >= count) imagePointer = 0;
           images = '<img class="img" src="' + data.sub[imagePointer].location+'" />';
           document.getElementById( 'exercise' ).innerHTML = images;
           alert(exercise.innerHTML);
           id =(data.sub[imagePointer].ID);
       }
       function updateAnswer() {
           if(answerPointer >= count) answerPointer = 0;
           answers = data.sub[answerPointer].answ ; 
           ans = answers;
           alert(ans);
       }
       button.addEventListener('click', function() {
           updateImage();
           updateAnswer();
           imagePointer++;
           answerPointer++;

       });
       (function check () {
           'use strict';
            
           var snackbarContainer = document.querySelector('#demo-toast-example');
           var showToastButton = document.querySelector('#Btn');
           showToastButton.addEventListener('click', function () {
               'use strict';
               
               var x = document.getElementById("numb").value;
               if (x == ans) {
                  
                   var text = "תשובה נכונה, כל הכבוד!";
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
                   var text = "טעות, נסה שוב!";
               }
               var data = { message: text};
               snackbarContainer.MaterialSnackbar.showSnackbar(data);
           });
       }());
  </script>
</body>

</html>
