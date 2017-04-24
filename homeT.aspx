<%@ Page Language="C#" CodeFile="homeT.aspx.cs" Inherits="homeT" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<!--#include file="upperT.aspx"-->

<!doctype html>
<html dir="rtl">
    <head> 
        <link rel="stylesheet" href="css/circle.css">
        <link href="css/homeT.css" rel="stylesheet" />
        <title></title>
        <style>
            .w3-red{
                float: right;
                width:50%;
                height:100%;
            }
            #c {
                clear: right;
            }
            #btns{
                display:inline-block;
                width:50%;
                height:114px;
            }
        </style>
    </head>
    <body style="font-family:Heebo">
        <div id="page-wrap">
                <br/>
            <br />
            <div class="w3-card-4 w3-white"  style="width:80%; margin:auto">
                <div class="w3-display-container w3-text-white">
  <img src="media/widelogoT.png" class="w3-image">
                    <div class="w3-display-bottomright w3-padding w3-text-white" style="font-family:Heebo; font-weight:300; font-size:45px">ברוכים הבאים.</div>
                    </div>
                  <div class="w3-container w3-center">
    <p style="font-family:Heebo; font-weight:700; font-size:50px" class="w3-text-red"><br />

         <%=Session["nameT"] %></p>
                      <p style="font-family:Heebo; font-weight:300; font-size:35px" class="w3-text-red">

         באתר זה ניתן:</p>

  </div>
</div>
            <br />
      <div style="position:relative;left:-100px;">
                <div class="w3-row-padding">
<div class="w3-card-4 "  style="display:inline-block;">
    <a href="msgT.aspx"><img src="media/temp/ann.png" class="w3-image"></a>
    </div>
                    &nbsp&nbsp&nbsp&nbsp
                <div class="w3-card-4"  style="display:inline-block;">
    <a href="uploadT.aspx" ><img src="media/temp/up.png" class="w3-image"></a>
    </div>
                    </div>
                <br />
                <div class="w3-row-padding">

<div class="w3-card-4 "  style="display:inline-block;">
    <img src="media/temp/doh.png" class="w3-image">
    </div>
                    &nbsp&nbsp&nbsp&nbsp
                <div class="w3-card-4"  style="display:inline-block;">
    <a href="DistributT.aspx" ><img src="media/temp/dis.png" class="w3-image"></a>
    </div>

                <br />
                <br />
        </div>
          </div>


    </body>
</html>