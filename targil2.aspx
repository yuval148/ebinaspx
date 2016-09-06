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
              answ = document.f.answ.value;
              if (answ != 22 || answ.charAt(i) <= '0' && ID.charAt(i) >= '9' ) {
                  formValid = false;
                  alert("NOPE.");
              }
                return formValid;
            }
      </script>
</head>
<body style="font-family:Arial; text-align:center;">
   <form name="f" method="post" onsubmit="return check();">
     
        תשובה
<input type="text" id="answ" name="answ" maxlength="9" size="9"/>

       
       <input type="submit" value="שלח" name="submit"/>


            </form>

<br />
</body>
</html>
