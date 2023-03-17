// //get form inputs with id: "username" and "password", firstname, lastname, email, phone using document.getElementById
console.log("register.js loaded");
 let username = document.getElementById("txtUsername");
 let password = document.getElementById("txtPassword");
 let firstname = document.getElementById("txtFirstName");
 let lastname = document.getElementById("txtLastName");
 let email = document.getElementById("txtEmail");
 let phone = document.getElementById("txtPhone");

//-------------------------------------------------------
$(function () {
  $("#register-form").validate({
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
      },
      txtFirstName: {
        required: true,
        maxlength: 30
      },
      txtLastName: {
        required: true,
        maxlength: 30
      },
      txtEmail: {
        required: true,
        cEmail: true
      },
      txtPhone: {
        required: true,
        cPhone: true
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
      },
      txtFirstName: {
        required: "First name cannot be empty!",
        maxlength: "First name must be less than 31 characters!"
      },
      txtLastName: {
        required: "Last name cannot be empty!",
        maxlength: "Last name must be less than 31 characters!"
      },
      txtEmail: {
        required: "Email cannot be empty!"
      },
      txtPhone: {
        required: "Phone cannot be empty!"
      }
    }
  });
  $.validator.addMethod("cEmail", function (value, element) {
    var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    return this.optional(element) || emailPattern.test(value);
  }, "Please enter a valid email address");

  $.validator.addMethod("cPhone", function (value, element) {
    // Define phone number pattern
    var phonePattern = /^0[0-9]{9}$/;

    // Return true if phone number is optional
    if (this.optional(element)) {
      return true;
    }

    // Otherwise, return true if phone number matches pattern
    return phonePattern.test(value);
  }, "Please enter a valid phone number (only 10 digits and starts with 0)");

});


//--------------------------------------------------------------------
//Hide password element

function handleCredentialResponse(response) {
  // to decode the credential response.
  const responsePayload = parseJwt(response.credential);

  username.value = chainString(responsePayload.name," ","") ?? "";
  password.value = "googleRegister" + username.value;
  firstname.value = responsePayload.given_name ?? "";
  lastname.value = responsePayload.family_name ?? "";
  email.value = responsePayload.email ?? "";
  phone.value = responsePayload.phone ?? "";
  document.getElementsByTagName("h1")[0].innerText = "Confirm information";
  document.getElementById("password-field").classList.add("d-none");
  //Add Google ID to form
  const form = document.getElementById("register-form");
  const hiddenField = document.createElement("input");
  hiddenField.type = "hidden";
  hiddenField.name = "googleID";
  hiddenField.value = responsePayload.sub;
  form.appendChild(hiddenField);
  let formParams = {
    txtUsername: username.value,
    txtPassword: password.value,
    txtFirstName: firstname.value,
    txtLastName: lastname.value,
    txtEmail: email.value,
    txtPhone: phone.value,
    googleID: responsePayload.sub,
    healthReg: "true"
  }
  // console.log(formParams);
  post("/CICOHealth/register", formParams);
}
