$(function () {
    $("#login-form").validate({
        rules: {
            txtUsername: {
                required: true,
                minlength: 5,
                maxlength: 20
            },
            txtPassword: {
                required: true,
                minlength: 6,
                maxlength: 20
            }
        },
        messages: {
            txtUsername: {
                required: "Username cannot be empty!",
                minlength: "Username must be more than 4 characters!",
                maxlength: "Username must be less than 21 characters!"
            },
            txtPassword: {
                required: "Password cannot be empty!",
                minlength: "Password must be between 6 to 20 characters!",
                maxlength: "Password must be between 6 to 20 characters!"
            }
        }
    });
});