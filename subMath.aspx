<%@ Page Language="C#" AutoEventWireup="true" CodeFile="subMath.aspx.cs" Inherits="subMath" %>

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
        .sub{
            position:absolute;
            width:400px;
            height:150px;
            background-color: white;
        }
        #sub1{
            top:225px;
            right: 700px;
        }
               
        
        #pd{
            text-align:center;
            position:absolute;
            top:366px;
            right: 160px;
            height: 82px;
            width: 275px;
            bottom: 39px;
        }
       .container{
           position:absolute; 
           top:342px; 
           right: 150px; 
           height: 45px; 
           width: 282px;
       }
    </style>
  
</head>
<body style="font-family:Arial; text-align:center;">
    <div class="profile">
         <img src="lion.jpg" id="img-circle" alt="Cinque Terre" style=" position:absolute;
            width:150px;
            height:150px;
            top:176px; 
            right: 214px;">

         <div id="pd">
            <span style="font-size:40px; font-weight:bold"> <%=Session["name"]%></span><br>
            <span style="font-size:30px; line-height:80%"> <%=Session["team"]%></span><br>
            <span style="font-size:25px;line-height:200%"> <%=Session["xpp"]%> נקודות</span> <br>
            <span style="font-size:40px; line-height:80%" >שלב  <%=Session["level"]%> </span> <br>
        </div>
        <div class="container">
            <div class="progress">
            <div class="progress-bar" ID="refali" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"  style="width:70%" runat="server">
                <span class="sr-only">70% Complete</span>
            </div>
            </div>
    
        </div>
    </div>
  
   
 

</body>
</html>
 <div class="sub" id="sub1">
        <h1>
            פרבולות
        </h1>
    </div>
