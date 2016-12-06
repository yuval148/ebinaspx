<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>

<script runat="server">
    string msg = "";
    
    protected void Page_Load()
    {
       

    }
</script>

   
<!--#include file="upper.aspx"-->
<html dir="rtl">
<head>
    <title></title>
    <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/normalize.css">

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
         body
        {
            background: url("bg2.jpg");
            background-size: 100%, 100%;
            background-repeat:no-repeat;
        }
         #qu{
             position:absolute;
             top:150px;
             left:90px;
      }
         .card-info{
             position:absolute;
             top:250px;
             right:90px;
         }
         #left{
             position:absolute;
             top:350px;
             left:70px;
         }
         #right{
             position:absolute;
             top:350px;
             left:590px;
         }
         #f{
             position:absolute;
             top:370px;
             left:320px;
         }
         
    </style>  
</head>
<body style="font-family:Arial;">
    <%=Session["group"] %>
    <h1>פרבולות</h1><!--קבוצת תרגילים -->
    <div class="q&a">
    <img id="qu" src="targil1.png" />

       <form id="right" action="http://google.com">
    <input type="submit" value="התרגיל הבא" />
</form>

    <form id="left"action="http://google.com">
    <input type="submit" value="התרגיל הקודם" />
</form>
         <form name="f" id="f" method="post" onsubmit="return check();">     
               תשובה סעיף 1
       <input type="button" value="שלח" onclick="check();" />  
         </form>
        </div>
       
    <div class="card-info">
<div class="card card--info">
  <h2 class="card__title">לא מצליח?</h2>
  <p class="card__text">x=4<br />x תמיד שווה 4.</p><!--מידע או משהו -->
</div>
        </div>
  
       
  



<br />
</body>
</html>
