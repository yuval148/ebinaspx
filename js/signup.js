var c = -1;
var counter = 0;
var info = ["בשלב זה הכניסו את שמכם, הכיתה ומספר תעודת הזהות.<br/>כשתסיימו, לחצו הבא כדי לעבור לשלב בחירת שם המשתמש והסיסמה.", "בשלב זה עליכם לבחור שם משתמש, סיסמה ושם לקבוצתכם. <br/> רצוי לבחור סיסמה ארוכה עם שילובי מספרים ואותיות. <br/> לחצו 'הבא' כדי לבחור תמונת פרופיל ולסיים את ההרשמה.", "בשלב זה באפשרותך להעלות תמונת פרופיל שתייצג אותך באתר. <br/> לאחר ההעלאה לחצו על כפתור 'סיים' על מנת לסיים את ההרשמה. <br/> אין חובה להעלות תמונת פרופיל אך רצוי.", "זה המידע של שלב 4"];
function update() {
    if (counter == 0) {
        document.getElementById("btn").innerHTML = "הבא";
        var list = document.getElementsByTagName("UL")[0];
        var x = document.getElementById(counter);
        var pre = document.getElementById(c);
        list.getElementsByTagName("LI")[counter].className = "active";//מקדם את הבר
        if (list.getElementsByTagName("LI")[counter].className == "active") {//מראה את הדיב
            x.className += " w3-show";
        }
        if (c != -1) {
            pre.className = pre.className.replace(" w3-show", "");
        }
        if (counter == 3) {
            document.getElementById("btn").className += " w3-hide";
        }
        document.getElementById("info").innerHTML = info[counter];
        counter++;
        c++;
    }
    else if (counter == 1) {
        if (document.forms["f"]["name"].value == "") {
            alert("היי, שכחת למלא שמך!");
        }
        else if (document.forms["f"]["kita"].value == "") {
            alert("היי, שכחת למלא כיתה!");
        }
        else if (document.forms["f"]["ID"].value == "") {
            alert("היי, שכחת למלא ת.ז!");
        }
        else {
            document.getElementById("btn").innerHTML = "הבא";
            var list = document.getElementsByTagName("UL")[0];
            var x = document.getElementById(counter);
            var pre = document.getElementById(c);
            list.getElementsByTagName("LI")[counter].className = "active";//מקדם את הבר
            if (list.getElementsByTagName("LI")[counter].className == "active") {//מראה את הדיב
                x.className += " w3-show";
            }
            if (c != -1) {
                pre.className = pre.className.replace(" w3-show", "");
            }
            if (counter == 3) {
                document.getElementById("btn").className += " w3-hide";
            }
            document.getElementById("info").innerHTML = info[counter];
            counter++;
            c++;
        }
    }
    else if (counter == 2) {
        if (document.forms["f"]["userName"].value == "") {
            alert("היי, שכחת למלא שם משתמש!");
        }
        else if (document.forms["f"]["userPass"].value == "") {
            alert("היי, שכחת למלא סיסמה!");
        }
        else if (document.forms["f"]["team"].value == "") {
            alert("היי, שכחת למלא שם קבוצה!");
        }
        else {
            document.getElementById("btn").innerHTML = "הבא";
            var list = document.getElementsByTagName("UL")[0];
            var x = document.getElementById(counter);
            var pre = document.getElementById(c);
            list.getElementsByTagName("LI")[counter].className = "active";//מקדם את הבר
            if (list.getElementsByTagName("LI")[counter].className == "active") {//מראה את הדיב
                x.className += " w3-show";
            }
            if (c != -1) {
                pre.className = pre.className.replace(" w3-show", "");
            }
            if (counter == 3) {
                document.getElementById("btn").className += " w3-hide";
            }
            document.getElementById("info").innerHTML = info[counter];
            counter++;
            c++;
        }

    }
}
   
function check() {
    var formValid = true;
    name = document.f.name.value;
    if (name.length <= 2) {
        formValid = false;
        alert("name is too short");
    }

    ID = document.f.ID.value;
    for (i = 0; i < ID.length; i++) {
        if (!(ID.charAt(i) >= '0' && ID.charAt(i) <= '9') || (ID.charAt(i) == '-')) {
            formValid = false;
            alert("there cant be signs in the ID number who are not numbers or dashes");
            break;
        }
    }

    userPass = document.f.userPass.value;
    if (userPass.length <= 2) {
        formValid = false;
        alert("password is too short");
    }
    return formValid;
}
