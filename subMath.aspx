<%@ Page Language="C#" AutoEventWireup="true" CodeFile="subMath.aspx.cs" Inherits="subMath" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>

<!--#include file="upper.aspx"-->

<html>
    <head>
    <title></title>
        <script>
           
        </script>
    <style>
      
    </style>
</head>
<body>
  <div id="container"></div>
     
    <script id="template" type="text/x-handlebars-template">
        {{!-- 2. The each helper can insert an array of data --}}
        {{#each sub}}
          <div class="sub demo-card-square3 mdl-card mdl-shadow--2dp ">
                <div class="mdl-card__title mdl-card--expand">
                    <h2 class="mdl-card__title-text" style="font-family:'Heebo';font-weight:300;font-size:35px">{{subject}}</h2>
                </div>
                <div class="mdl-card__supporting-text">
                   {{xp}}
                </div>
                <div class="mdl-card__actions mdl-card--border">
                    <a class="mdl-button mdl-button--colored mdl-js-button" style="float:left" href="targil.aspx">
                        לתרגילים
                    </a>
                </div>
            </div>
            <li>,</li> 
        {{/each}}
    </script>
          
  <script type="text/javascript">
      var Info = document.getElementById("template").innerHTML;
      var template = Handlebars.compile(Info);

  // template receives the key / value pairs and puts
  // them in place
      var data = template(<%=this.json%>);
 
  // Update the div with the completed output
      document.getElementById('container').innerHTML += data;
  </script>
 

</body>
     
</html>
 