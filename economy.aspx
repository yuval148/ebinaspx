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
</head>
<body style="font-family:Arial; text-align:center;">
    <img src="targil1.png" />
   <form name="f" id="f" method="post" onsubmit="return check();">     
               תשובה סעיף 1
       <input type="button" value="שלח" onclick="check();" />  
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
