document.getElementById("id_password").addEventListener("blur", () => {

});

function getPassword(originPass) {
    originPass = originPass.toString();
    var password = document.querySelector('#id_password');
    let type = password.getAttribute('type');
    if (type === "password") {
        var passwordPrompt = prompt("Enter your password:");
        if (passwordPrompt !== null) {
            if (passwordPrompt === originPass) {
                type = "text";
                document.getElementById("id_password").value = originPass;
                password.setAttribute('type', type);
            } else {
                alert("Passwords is wrong. Please try again.");
            }
        }

    } else if (type === "text") {
        type = "password";
        password.setAttribute('type', type);
    }
}

function confirm(originPass) {
    originPass = originPass.toString();
    var passwordPrompt = prompt("Enter your password:");
    if (passwordPrompt !== null) {
        if (passwordPrompt === originPass) {
            var password = document.querySelector('#id_password');
            document.getElementById("loginInfoForm").submit();
        } else {
            alert("Passwords is wrong. Please try again.");
        }
    }
}