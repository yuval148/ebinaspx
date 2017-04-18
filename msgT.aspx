<%@ Page Language="C#" AutoEventWireup="true" CodeFile="msgT.aspx.cs" Inherits="msgT"%>
<!--#include file="upperT.aspx"-->

<html>
  <head>    
  <title>דף הפצת הודעות</title>
  <style>
        body {
                background: url("/media/bfg5.jpg");
                background-size: 100%, 100%;
                background-repeat: no-repeat;
            }
    </style>
  </head>
<body style="font-family:Arial, Helvetica, Sans-Serif; text-align:center;">
                       <!-- <div style="display:inline-block" id="someId">
                            <asp:CheckBoxList ID="CBList" runat="server" CssClass="cbl"> 
                            </asp:CheckBoxList>

                        </div> !-->

    <h3 style="font-family:Heebo;">מערכת הפצת הודעות</h3>
    <form method="post">
        <table align=center>
     <tr>
     <td>סוג הודעה</td>
      <td>
         <select id="icon" name="icon" class="w3-select">
             <option value="0">בחר סוג</option>
           <option value="announcement">דחופה</option>
             <option value="note_add">משימה חדשה</option>
             <option value="event">תאריך</option>
             <option value="info">התראה</option>
                </select> 
                </td>
      </tr>
       <tr>
      <td>כותרת ההודעה</td>
      <td><input type="text" id="title" name="title" class="w3-input"/></td>
       </tr>
         <tr>
       <td>תוכן ההודעה</td>
       <td><input type="text" id="msg" name="msg" class="w3-input">
           </td>
           </tr>
                       <tr>
                         
       <td>תאריך תפוגה</td>
                         <td class="w3-third"><select id="yyyy" name="yyyy" class="w3-select">
               <option value="0">שנה</option>
               <option>2017</option>       
               <option>2018</option> 
               <option>2019</option>       
               <option>2020</option>
               <option>2021</option>       
               <option>2022</option>  
               </select>
       
           <td class="w3-third"><select id="mm" name="mm" class="w3-select">
               <option value="0">חודש</option>
                <option>01</option>       
            <option>02</option>       
            <option>03</option>       
            <option>04</option>       
            <option>05</option>       
            <option>06</option>       
            <option>07</option>       
            <option>08</option>       
            <option>09</option>       
            <option>10</option>       
            <option>11</option>       
            <option>12</option>  
               </select></td>
                             <td class="w3-third"><select id="dd" name="dd" class="w3-select">
            <option value="0">יום</option>
            <option>01</option>       
            <option>02</option>       
            <option>03</option>       
            <option>04</option>       
            <option>05</option>       
            <option>06</option>       
            <option>07</option>       
            <option>08</option>       
            <option>09</option>       
            <option>10</option>       
            <option>11</option>       
            <option>12</option>       
            <option>13</option>       
            <option>14</option>       
            <option>15</option>       
            <option>16</option>       
            <option>17</option>       
            <option>18</option>       
            <option>19</option>       
            <option>20</option>       
            <option>21</option>       
            <option>22</option>       
            <option>23</option>       
            <option>24</option>       
            <option>25</option>       
            <option>26</option>       
            <option>27</option>       
            <option>28</option>       
            <option>29</option>       
            <option>30</option>       
            <option>31</option>   
                   </select></td> 
           

           </td>
           </tr>

            <tr>
                <td>כיתה</td>
                <td>

              <script type="text/javascript">                  /*          
                  $(document).ready(function () {
                      var data = (< %=this.json%>); //לצמצם רווחים
                      var counter = data.Class.length; alert(counter);
                      for (var i = 0; i < counter; i++) {
                          $('<asp:ListItem', {
                              Class: "w3-check",
                              name: 'name' + data.Class[i].kita,
                              value:  data.Class[i].kita,
                              style:'display:inline-block',
                          })
                          .appendTo("#CBList");
                          $("</asp:ListItem>"+"<p style='display:inline-block'>"+data.Class[i].kita+"</p>"+"<br/>").appendTo( "#someId" );
                      }
                  

        }); 
        */
 </script>
              <script type="text/javascript">
        $(document).ready(function () {
            var newSelect = document.createElement('select');
            newSelect.id="kita";
            newSelect.name="kita";
            newSelect.className="w3-select"
            var selectHTML = "";
            var data = (<%=this.json%>);
            var choices = $.map(data, function(el) { return el; })
            for (i = 0; i < choices.length; i = i + 1) {
                var x = choices[i]["kita"];
                selectHTML += "<option value='" + x + "'>" + x + "</option>";
            }
            selectHTML += "</select>";

            newSelect.innerHTML = selectHTML;
            document.getElementById('class_selection').appendChild(newSelect);


        });

    </script>
                    <div id="class_selection">
    </div>
                    </td></tr>
    </table>
        <br />
        <input class="w3-button w3-red" type="submit" value="שלח" name="submit"/>
    </form>
    
  <br />

    <%=Session["ErrIsertForm"] %>
</body>
</html>
