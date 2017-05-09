var c = -1;
var counter = 0;
var info = ["זה המידע של שלב 1", "זה המידע של שלב 2", "זה המידע של שלב 3", "זה המידע של שלב 4"];
function update() {
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
    if (counter == 1) {
        document.getElementById("btn").className += " w3-hide";
    }
    document.getElementById("info").innerHTML = info[counter];
    counter++;
    c++;
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