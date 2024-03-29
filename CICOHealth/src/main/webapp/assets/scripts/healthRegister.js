//Calculagte BMR using Harris-Benedict Equation
//Men: BMR = 66.5 + (13.75 × weight in kg) + (5.003 × height in cm) - (6.75 × age)
//Women:BMR = 655.1 + (9.563 × weight in kg) + (1.850 × height in cm) - (4.676 × age)
//Inputs: numAge, numWeight, numHeight, radGender
function calculateBMR() {
  //Get form inputs
  let numAge = document.getElementById("numAge").value;
  let numWeight = document.getElementById("numWeight").value;
  let numHeight = document.getElementById("numHeight").value;
  let radGender = document.getElementById("radGender_0").checked;
  //Calculate BMR
  let bmr = 0;
  if (radGender) {
    bmr = 66.5 + 13.75 * numWeight + 5.003 * numHeight - 6.75 * numAge;
  } else {
    bmr = 655.1 + 9.563 * numWeight + 1.85 * numHeight - 4.676 * numAge;
  }
  return bmr;
}

//Calculate TDEE from BMR and activity level
function calculateTDEE() {
  let bmr = calculateBMR();
  let activityLevel = document.getElementById("selectActiveness").value;
  let multiplier = {
    0: 1.2,
    1: 1.375,
    2: 1.55,
    3: 1.725,
    4: 1.9
  };
  let tdee = bmr * multiplier[activityLevel];
  //Map activity level to a multiplier

  //Format tdee to 2 decimal places
  tdee = tdee.toFixed(1);
  return tdee;
//   document.getElementById("numTDEE").value = tdee;
}

function updateNutritionGoal(){
    let tdee = calculateTDEE();
    document.getElementById("numTDEE").value = tdee;
    document.getElementById("numProtein").value = (tdee * 0.3 / 4).toFixed(1);
    document.getElementById("numFat").value = (tdee * .2 / 9).toFixed(1);
    document.getElementById("numCarb").value = (tdee * .5 / 4).toFixed(1);
}
let numAge = document.getElementById("numAge");
let numWeight = document.getElementById("numWeight");
let numHeight = document.getElementById("numHeight");
let radGender = document.getElementsByName("radGender_0");
let activityLevel = document.getElementById("selectActiveness");
updateNutritionGoal();

//Add event listener to input fields
numAge.addEventListener("change", updateNutritionGoal);
numWeight.addEventListener("change", updateNutritionGoal);
numHeight.addEventListener("change", updateNutritionGoal);
radGender.forEach((item) => item.addEventListener("change", updateNutritionGoal));
activityLevel.addEventListener("change", updateNutritionGoal);

// health-register-form

$(function () {
  $("#health-register-form").validate({
    rules: {
      numAge: {
        required: true,
        min: 1,
        max: 120,
        number: true
      },
      numHeight:{
          required: true,
          number: true,
          min:15,
          max:400
      },
      numWeight:{
          required: true,
          number: true,
          min:1,
          max:600
      }
    },
    messages: {
     numAge: {
      required: "Please enter your age",
      min: "Please enter a valid age",
      max: "Please enter a valid age"
     },
     numWeight:{
          required: "Please enter your weight",
      },
      numHeight:{
          required: "Please enter your height",
      }
    }
  });
  $.validator.addMethod("cnum", function (value, element) {
      return isNaN(value);
  }, "Please enter a number");

});
