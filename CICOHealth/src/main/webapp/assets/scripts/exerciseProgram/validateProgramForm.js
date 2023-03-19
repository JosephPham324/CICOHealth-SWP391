document.getElementById("txtProgramName").onblur = function () {
  let str = document.getElementById("txtProgramName").value;
  if (str.length == 0) {
    document.getElementById("error_txtProgramName").style.display = "block";
  } else {
    document.getElementById("error_txtProgramName").style.display = "none";
  }
};
document.getElementById("txtProgramDescription").onblur = function () {
  let str = document.getElementById("txtProgramDescription").value;
  if (str.length == 0) {
    document
      .getElementById("error_txtProgramDescription")
      .style.removeProperty("display");
  } else {
    document.getElementById("error_txtProgramDescription").style.display =
      "none";
  }
};
const name = document.getElementById("select-exercise");
const order = document.getElementById("txtExerciseOrderPopUp");
const set = document.getElementById("txtSetPopUp");
const rep = document.getElementById("txtRepPopUp");
const weight = document.getElementById("txtWeightPopUp");
const duration = document.getElementById("txtDurationPopUp");
const instruction = document.getElementById("txtInstructionPopUp");
function validateOrderInput() {
  if (order.value === "") {
    document.getElementById("error-exercise-order").style.display = "block";
    document.getElementById("error-exercise-order").innerText =
      "(*)Please not be empty";
  } else if (isNaN(order.value) || parseInt(order.value) < 0) {
    document.getElementById("error-exercise-order").style.display = "block";
    document.getElementById("error-exercise-order").innerText =
      "(*)Order must be a positive number and greater than 0";
  } else {
    document.getElementById("error-exercise-order").style.display = "none";
    return true;
  }
  return false;
}
order.onblur = function () {
  validateOrderInput();
};
weight.onfocus = function () {
  document.getElementById("error-exercise-weight").style.display = "block";
  document.getElementById("error-exercise-weight").innerText =
    "(*)Can be empty if the exercise is not a resistance exercise";
};
rep.onfocus = function () {
  document.getElementById("error-exercise-rep").style.display = "block";
  document.getElementById("error-exercise-rep").innerText =
    "(*)Can be empty if the exercise is not a resistance exercise";
};
set.onfocus = function () {
  document.getElementById("error-exercise-set").style.display = "block";
  document.getElementById("error-exercise-set").innerText =
    "(*)Can be empty if the exercise is not a set exercise";
};
duration.onfocus = function () {
  document.getElementById("error-exercise-duration").style.display = "block";
  document.getElementById("error-exercise-duration").innerText =
    "(*)Can be empty if the exercise is not a duration exercise";
};
function validateSetInput() {
  document.getElementById("error-exercise-set").style.display = "none";
  if (isNaN(set.value) || parseInt(set.value) < 0) {
    document.getElementById("error-exercise-set").style.display = "block";
    document.getElementById("error-exercise-set").innerText =
      "(*)Set must be a positive number and greater than 0";
  } else {
    document.getElementById("error-exercise-set").style.display = "none";
    return true;
  }
  return false;
}
set.onblur = function () {
  validateSetInput();
};
function validateDurationInput() {
  document.getElementById("error-exercise-duration").style.display = "none";
  if (isNaN(duration.value) || parseInt(duration.value) < 0) {
    document.getElementById("error-exercise-duration").style.display = "block";
    document.getElementById("error-exercise-duration").innerText =
      "(*)Duration must be a positive number and greater than 0";
  } else {
    document.getElementById("error-exercise-duration").style.display = "none";
    return true;
  }
  return false;
}
duration.onblur = function () {
  validateDurationInput();
};

let calcRegex = (set) => {
  if (set <= 0) {
    throw new Error("num should be greater than 0");
  }
  const ddPattern = "\\d{1,10}"; // regex pattern for two digits
  const regexPattern = `^(${ddPattern}\\/){${set - 1}}${ddPattern}$`;
  return new RegExp(regexPattern);
};
function validateRepInput() {
  document.getElementById("error-exercise-rep").style.display = "none";

  let regex = "";
  try {
    regex = calcRegex(set.value);
  } catch (error) {
    console.log(error);
  }
  console.log(regex);
  let regexObj = new RegExp(regex);

  if (!regexObj.test(rep.value)) {
    document.getElementById("error-exercise-rep").style.display = "block";
    document.getElementById("error-exercise-rep").innerText =
      "(*)Rep must be in the format " + Array(set.value).fill("XX").join("/");
    return false;
  } else {
    document.getElementById("error-exercise-rep").style.display = "none";
    return true;
  }
  return false;
}
rep.onblur = function () {
  validateRepInput();
};

function validateWeightInput() {
  document.getElementById("error-exercise-weight").style.display = "none";
  let regex;
  try {
    regex = calcRegex(set.value);
  } catch (error) {
    console.log(error);
    return false;
  }
  if (!regex.test(weight.value)) {
    document.getElementById("error-exercise-weight").style.display = "block";
    document.getElementById("error-exercise-weight").innerText =
      "(*)weight must be in the format XX/XX/XX";
  } else {
    document.getElementById("error-exercise-weight").style.display = "none";
    return true;
  }
  return false;
}
weight.onblur = function () {
  validateWeightInput();
};
instruction.onblur = function () {
  console.log(instruction.value);
  if (instruction.value === "") {
    document.getElementById("error-exercise-instruction").style.display =
      "block";
    document.getElementById("error-exercise-instruction").innerText =
      "(*)Please not be empty";
  } else {
    document.getElementById("error-exercise-instruction").style.display =
      "none";
  }
};

document
  .getElementById("create-exercise-form")
  .addEventListener("submit", function (event) {
    console.log("here");
    event.preventDefault();
    //Validate all input
    let isValid =
      validateOrderInput() &&
      validateDurationInput() &&
      validateRepInput() &&
      validateSetInput() &&
      validateWeightInput() &&
      //Check if instruction is empty
      instruction.value !== "";
    //If set is not empty, check if rep and weight is not empty
    if (set.value !== "") {
      isValid = isValid && rep.value !== "" && weight.value !== "";
    }
    console.log(isValid);

    if (isValid === true) {
      addExerciseToWorkout();
      // document.getElementById("create-exercise-form").submit();
    }
  });
