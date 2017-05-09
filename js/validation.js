$(function () {
    $("form[name='f']").validate({
        rules: {
            name: "required",
            kita: "required",
            ID: "required",
            userPass: {
                required: true,
                minlength: 5
            }
        },
        // Specify validation error messages
        messages: {
            name: "Please enter your firstname",
            kita: "Please enter your kita",
            userPass: {
                required: "Please provide a password",
                minlength: "Your password must be at least 5 characters long"
            },
        },
        submitHandler: function (form) {
            form.submit();
        }
    });
});