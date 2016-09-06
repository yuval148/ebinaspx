<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>

<script runat="server">
    string msg = "";
    
    protected void Page_Load()
    {
        
        if (Session["userName"] != null)
        {
            msg = " ברוך הבא " + Session["userName"];
        }
        else
        {

            
            Response.Redirect("userDinial.aspx");
        }

    }
</script>

<!--#include file="upper.aspx"-->
<html dir="rtl">
<head>
    <title></title>
    <style>
        body
        {
            background: url("bg2.jpg");
            background-size: 100%, 100%;
            background-repeat:no-repeat;
        }
    </style>
          <script type="text/javascript">
          function check() {
              var formValid = true;
              answ1 = document.f.answ1.value;
              answ2 = document.f.answ2.value;
              answ3 = document.f.answ3.value;
              answ4 = document.f.answ4.value;
              if (answ1 != 22 || answ.charAt(i) <= '0' && ID.charAt(i) >= '9' ) {
                  formValid = false;
                  alert("סעיף 1 שגוי.");
                  answ1.innerHTML = "<img src='x.png' width='16' height='16'>"

              }
              if (answ2 != 22 || answ.charAt(i) <= '0' && ID.charAt(i) >= '9') {
                  formValid = false;
                  alert("סעיף 2 שגוי.");
                  answ2.innerHTML = "<img src='x.png' width='16' height='16'>"
              }
              if (answ3 != 22 || answ.charAt(i) <= '0' && ID.charAt(i) >= '9') {
                  formValid = false;
                  alert("סעיף 3 שגוי.");
                  answ3.innerHTML = "<img src='x.png' width='16' height='16'>"
              }
              if (answ4 != 22 || answ.charAt(i) <= '0' && ID.charAt(i) >= '9') {
                  formValid = false;
                  alert("סעיף 4 שגוי.");
                  answ4.innerHTML = "<img src='x.png' width='16' height='16'>"
              }
                return formValid;
            }
      </script>
</head>
<body style="font-family:Arial; text-align:center;">
    <img src="targil1.png" />
   <form name="f" id="f" method="post" onsubmit="return check();">     
               תשובה סעיף 1
<input type="text" id="answ1" name="answ1" maxlength="9" size="9"/>
               תשובה סעיף 2
<input type="text" id="answ2" name="answ2" maxlength="9" size="9"/>
               תשובה סעיף 3
<input type="text" id="answ3" name="answ3" maxlength="9" size="9"/>
               תשובה סעיף 4
<input type="text" id="answ4" name="answ4" maxlength="9" size="9"/>

       
       <input type="button" value="בדוק" onclick="check();" />
       <input type="submit" value="שלח" name="submit"/>

         
         </form>
        <div style="position:absolute; top: 227px; right: 44px;">
        <a href="culture.aspx" ><< התרגיל הקודם</a>
    </div>
    <div style="position:absolute; top: 226px; right: 1127px;">
        <a href="targil2.aspx" >התרגיל הבא >></a>
    </div>



<br />
</body>
</html>
