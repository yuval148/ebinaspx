function update() {
    document.getElementById("2").className = "active";
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