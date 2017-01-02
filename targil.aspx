<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<!--#include file="upper.aspx"-->

<!doctype html>
<html dir="rtl">
<head>
    <title></title>
        <script type="text/javascript">
            function check() {
                var formValid = true;
                answ1 = document.f.answ1.value;
                if (answ1 != 22 || answ.charAt(i) <= '0' && ID.charAt(i) >= '9')
                {
                    formValid = false;
                    alert("סעיף 1 שגוי.");
                }
                else if (answ1 == 22) {
                    
                }

                
                return formValid;
            }
        </script>
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

     </main>
</body>

</html>
