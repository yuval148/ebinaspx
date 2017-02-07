<%@ Page Language="C#" %>
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
                background-repeat: no-repeat;
            }
         #info{
                margin-top:50px;
                margin-right:20px;
         }
     
    </style>  
</head>
<body>
     <main class="mdl-layout__content">
         <div id="info" class="demo-card-square mdl-card mdl-shadow--2dp">
            <div class="mdl-card__title mdl-card--expand">
                <h2 class="mdl-card__title-text">מידע שימושי</h2>
            </div>
            <div class="mdl-card__supporting-text">
                <!-- Icon List -->
<style>
.demo-list-icon {
  width: 300px;
  display:inline-block;
}
.demo-card-image.mdl-card {
  bottom:300px;
  width: 600px;
  height: 300px;
  background: url('media/png.png') center no-repeat,white;
  float:left;
  margin-left:50px;
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
</style>

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
    <i class="material-icons mdl-list__item-icon">info</i>
    אל תשכח לקנות חלב
  </span>
  </li>
</ul>
              
            </div>

        </div>
         <div class="demo-card-image mdl-card mdl-shadow--2dp">
  <div class="mdl-card__title mdl-card--expand"></div>
  <div class="mdl-card__actions">
    <span class="demo-card-image__filename"><a  target="_blank" href="https://youtu.be/umRfjSqHyQs?t=1m51s">צריך עזרה?</a></span>
  </div>
</div>
         <form>
  <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
    <input class="mdl-textfield__input" type="text" pattern="-?[0-9]*(\.[0-9]+)?" id="numb">
    <label class="mdl-textfield__label" for="sample4">הכנס ערך X</label>
    <span class="mdl-textfield__error">X צריך להיות מספר</span>
  </div>
</form>
        <!-- Colored raised button -->
         <button id="demo-show-toast" class="mdl-button mdl-js-button mdl-button--raised"  onclick="check()" type="button">בדוק תשובה</button>
<div id="demo-toast-example" class="mdl-js-snackbar mdl-snackbar">
  <div class="mdl-snackbar__text"></div>
  <button class="mdl-snackbar__action" type="button"></button>
</div>


     </main>
     <script type="text/javascript">
         (function check () {
             'use strict';
            
             var snackbarContainer = document.querySelector('#demo-toast-example');
             var showToastButton = document.querySelector('#demo-show-toast');
             showToastButton.addEventListener('click', function () {
                 'use strict';
                 var x = document.getElementById("numb").value;
                 if (x == 2) {
                     var text = "תשובה נכונה, כל הכבוד!";
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
