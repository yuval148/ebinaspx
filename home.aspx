<%@ Page Language="C#" CodeFile="home.aspx.cs" Inherits="home" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<!--#include file="upper.aspx"-->

<!doctype html>
<html dir="rtl">
    <head> 
        <title></title>
        <style>
            .math{
                display:none;
            }
        </style>
        <script>
            var name='<%=Session["name"]%>';//להחליף בסשיין של נושא
            $(document).ready(function () {
                if(name=="יובל מרגלית")//ליצור אינדקס נושאים
                $('.math').show();
            });

        </script>
       </head>
    <body>
  <main class="mdl-layout__content">
    <div class="page-content">
        <!-- Square card -->
<style>
.demo-card-square2.mdl-card {
  width: 320px;
  height: 320px;
  position:absolute;
  top:50px;
  right:10px;
}
 .demo-card-square > .mdl-card__title {
                color: #fff;
                background: url('../assets/demos/dog.png') bottom right 15% no-repeat #46B6AC;
            }
</style>

<div id="bio" class="demo-card-square2 mdl-card mdl-shadow--2dp">
  <div class="mdl-card__title mdl-card--expand">
    <h2 class="mdl-card__title-text">Update</h2>
  </div>
  <div class="mdl-card__supporting-text">
    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
    Aenan convallis.
  </div>
  <div class="mdl-card__actions mdl-card--border">
    <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
      View Updates
    </a>
  </div>
</div>
        <!-- Colored FAB button -->
<button class="mdl-button mdl-js-button mdl-button--fab mdl-button--colored">
  <i class="material-icons">add</i>
</button>
        <!-- Square card -->
        <style>
            .demo-card-square.mdl-card {
                width: 320px;
                height: 320px;
                top:50px;
                right:350px;
                position:absolute;

             }
            .demo-card-square > .mdl-card__title {
                color: #fff;
                background: url('../assets/demos/dog.png') bottom right 15% no-repeat #46B6AC;
            }
        </style>
<div class="math">

<div  class="demo-card-square mdl-card mdl-shadow--2dp ">
  <div class="mdl-card__title mdl-card--expand">
    <h2 class="mdl-card__title-text">פרבולות</h2>
  </div>
  <div class="mdl-card__supporting-text">
    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
    Aenan convallis.
  </div>
  <div class="mdl-card__actions mdl-card--border">
    <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
      המשך
    </a>
  </div>
</div></div>
        </div>

  </main>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script src="js/circle.js"></script>

<div id="circle">
    <style>
        #circle{
            position:absolute;
            top:150px;
            right:400px;
        }
    </style>
</div>

<script>
    $('#circle').circleProgress({
        value: 0.8,
        size: 150,
        fill: {
            gradient: ["red", "orange"]
        }
    });
</script>
         <!--
    <div class="profile">
          <img src="lion.jpg" class="img-circle">
         <div id="pd">
            <span style="font-size:40px; font-weight:bold"> <%=Session["name"]%></span><br>
            <span style="font-size:30px; line-height:80%"> <%=Session["team"]%></span><br>
            <span style="font-size:25px;line-height:200%"> <%=Session["xpp"]%> נקודות</span> <br>
            <span style="font-size:40px; line-height:80%" >שלב  <%=Session["level"]%> </span> <br>
             <span style="font-size:40px; line-height:80%" >שלב  <%=Session["group"]%> </span> <br>
        </div>
        <div class="progbar">
            <div class="progress">
            <div class="progress-bar" ID="refali" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"  style="width:70%" runat="server">
                <span class="sr-only">70% Complete</span>
            </div>
            </div>
    
        </div>
    </div>
    </div>
   -->
</body>
</html>
