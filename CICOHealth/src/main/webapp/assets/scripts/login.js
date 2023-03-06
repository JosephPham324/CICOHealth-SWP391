$(function () {
    $("#login-form").validate({
        rules: {
            txtUsername: {
                required: true
            },
            txtPassword: {
                required: true
            }
        },
        messages: {
            txtUsername: {
                required: "Username cannot be empty!"
            },
            txtPassword: {
                required: "Password cannot be empty!"
            }
        }
    });
});