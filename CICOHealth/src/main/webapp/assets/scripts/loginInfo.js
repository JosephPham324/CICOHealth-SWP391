

function getPassword(originPass) {
    originPass = originPass.toString();
    var password = document.querySelector('#id_password');
    let type = password.getAttribute('type');
    if (type === "password") {
        Swal.fire({
            title: "Enter your password:",
            input: "password",
            showCancelButton: true,
            confirmButtonText: "Submit",
            cancelButtonText: "Cancel",
            inputValidator: (value) => {
                if (!value) {
                    return 'Please enter your password';
                }
            }
        }).then((result) => {
            if (result.value === originPass) {
                type = "text";
                document.getElementById("id_password").value = originPass;
                password.setAttribute('type', type);
            } else if (result.value) {
                swal("Incorrect password", "Please try again", "error");
            }
        });
    } else if (type === "text") {
        type = "password";
        password.setAttribute('type', type);
    }
    originPass = originPass.toString();
}

function confirm(originPass) {
    event.preventDefault();
    originPass = originPass.toString();
    Swal.fire({
        title: "Enter your password:",
        input: "password",
        showCancelButton: true,
        confirmButtonText: "Submit",
        cancelButtonText: "Cancel",
        inputValidator: (value) => {
            if (!value) {
                return 'Please enter your password';
            }
        }
    }).then((result) => {
        if (result.value === originPass) {
            var form = document.getElementById("loginInfoForm");
            var formData = new FormData(form);
            console.log(formData.get("username"));
            console.log(formData.get("password"));
            form.submit();
        } else if (result.value) {
            Swal.fire("Incorrect password", "Please try again", "error");
        }
    });
}
