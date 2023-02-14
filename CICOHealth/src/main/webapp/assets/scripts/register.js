//get form inputs with id: "username" and "password", firstname, lastname, email, phone using document.getElementById
console.log("register.js loaded");
let username = document.getElementById("txtUsername");
let password = document.getElementById("txtPassword");
let firstname = document.getElementById("txtFirstName");
let lastname = document.getElementById("txtLastName");
let email = document.getElementById("txtEmail");
let phone = document.getElementById("txtPhone");
//Set onblur event for each input
username.onblur = function () {
  //Call validateUsername function
  validateUsername();
};
password.onblur = function () {
  //Call validatePassword function
  validatePassword();
};
firstname.onblur = function () {
  //Call validateFirstname function
  validateFirstname();
};
lastname.onblur = function () {
  //Call validateLastname function
  validateLastname();
};
email.onblur = function () {
  //Call validateEmail function
  validateEmail();
};
phone.onblur = function () {
  //Call validatePhone function
  validatePhone();
};

//Validate username
function validateUsername() {}
//Validate password
function validatePassword() {}
//Validate firstname
function validateFirstname() {}
//Validate lastname
function validateLastname() {}
//Validate email
function validateEmail() {}
//Validate phone
function validatePhone() {}

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
    
  // console.log(formParams);
  //  post("/CICOHealth/register", formParams);
}
