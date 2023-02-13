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
function validateUsername() {
  
}
//Validate password
function validatePassword() {
  
}
//Validate firstname
function validateFirstname() {
  
}
//Validate lastname
function validateLastname() {
  
}
//Validate email
function validateEmail() {
  
}
//Validate phone
function validatePhone() {
  
}
