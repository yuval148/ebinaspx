<%@ Page Language="C#" CodeFile="home.aspx.cs" Inherits="home" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>


<!--#include file="upper.aspx"-->
<html dir="rtl">
<head>
   <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title></title>
    <style>
        body {
            background: url("bg2.jpg");
            background-size: 100%, 100%;
            background-repeat: no-repeat;
        }
       
    </style>
  
</head>
<body style="font-family:Arial; text-align:center;">
    <a href="#math" data-toggle="collapse"><img src="math.png" style="right: 425px; top: 123px; position:absolute; height: 248px; width: 689px;" /></a>
    <img src="physics.png" style="right: 425px; top: 243px; position:absolute; height: 248px; width: 689px;" />
    <img src="lituriture.png" style="right: 425px; top: 363px; position:absolute; height: 248px; width: 689px;" />
    <img src="lashon.png" style="right: 425px; top: 483px; position:absolute; height: 248px; width: 689px;" />
    <img src="lion.jpg" class="img-circle" alt="Cinque Terre" width="150" height="150" style=" position:absolute;top:176px; right: 214px">

    <div id="profile" style="position:center;">
 <div style="position:absolute; top:366px; right: 160px; height: 82px; width: 275px; bottom: 39px;">
    <span style="font-size:40px; font-weight:bold"> <%=Session["name"]%></span><br>
     <span style="font-size:30px; line-height:80%"> <%=Session["team"]%></span><br>
     <span style="font-size:25px;line-height:200%"> <%=Session["xpp"]%> נקודות</span> <br>
     <span style="font-size:40px; line-height:80%" >שלב  <%=Session["level"]%> </span> <br>
</div>
     </div>

<div class="container" style="position:absolute; top:342px; right: 150px; height: 45px; width: 282px;">
  <div class="progress">
    <div class="progress-bar" ID="refali" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width:70%" runat="server">
      <span class="sr-only">70% Complete</span>
    </div>
  </div>
    <div id="math" class="collapse">
        <a href="economy.aspx" ><img src="parabola.png" style="height: 145px; width: 398px; position:absolute; right:390px; top:0px" /></a>
         <a href="economy.aspx" ><img src="stsatistics.png" style="height: 145px; width: 398px;position:absolute; right:740px; top:0px" /> </a>
         <a href="economy.aspx" ><img src="sequense.png" style="height: 145px; width: 398px; position:absolute; right:1100px; top:0px" /></a>
        </div>
</div>
 

</body>
</html>
