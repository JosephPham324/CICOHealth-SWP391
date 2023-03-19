document.getElementById("txtProgramName").onblur = function () {
  let str = document.getElementById("txtProgramName").value;
  if (str.length == 0) {
    document
      .getElementById("error_txtProgramName")
      .style.display = "block";
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
order.onblur = function () {
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
  }
};
set.onblur = function () {
  if (set.value === "") {
    document.getElementById("error-exercise-set").style.display = "block";
    document.getElementById("error-exercise-set").innerText =
      "(*)Please not be empty";
  } else if (isNaN(set.value) || parseInt(set.value) < 0) {
    document.getElementById("error-exercise-set").style.display = "block";
    document.getElementById("error-exercise-set").innerText =
      "(*)Set must be a positive number and greater than 0";
  } else {
    document.getElementById("error-exercise-set").style.display = "none";
  }
};
duration.onblur = function () {
  if (duration.value === "") {
    document.getElementById("error-exercise-duration").style.display = "block";
    document.getElementById("error-exercise-duration").innerText =
      "(*)Please not be empty";
  } else if (isNaN(duration.value) || parseInt(duration.value) < 0) {
    document.getElementById("error-exercise-duration").style.display = "block";
    document.getElementById("error-exercise-duration").innerText =
      "(*)Duration must be a positive number and greater than 0";
  } else {
    document.getElementById("error-exercise-duration").style.display = "none";
  }
};
rep.onblur = function () {
  let regex = "";
  if (Number(set.value) === 1) {
    regex = "^\\d{2}$";
  } else {
    for (let i = 1; i <= Number(set.value); i++) {
      if (i === 1) {
        regex += "^\\d{2}\\/";
      } else if (i < Number(set.value)) {
        regex += "\\d{2}\\/";
      } else {
        regex += "\\d{2}$";
      }
    }
  }
  let regexObj = new RegExp(regex);
  if (rep.value === "") {
    document.getElementById("error-exercise-rep").style.display = "block";
    document.getElementById("error-exercise-rep").innerText =
      "(*)Please not be empty";
  } else if (!regexObj.test(rep.value)) {
    document.getElementById("error-exercise-rep").style.display = "block";
    document.getElementById("error-exercise-rep").innerText =
      "(*)Rep must be in the format " + Array(set.value).fill("XX").join("/");
  } else {
    document.getElementById("error-exercise-rep").style.display = "none";
  }
};
weight.onblur = function () {
  let regex = /^\d{2}\/\d{2}\/\d{2}$/;

  if (weight.value === "") {
    document.getElementById("error-exercise-weight").style.display = "block";
    document.getElementById("error-exercise-weight").innerText =
      "(*) Please not be empty";
  } else if (!regex.test(weight.value)) {
    document.getElementById("error-exercise-weight").style.display = "block";
    document.getElementById("error-exercise-weight").innerText =
      "(*)weight must be in the format XX/XX/XX";
  } else {
    document.getElementById("error-exercise-weight").style.display = "none";
  }
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
  .addEventListener("submit", function () {
    if (
      !order ||
      !set ||
      !rep ||
      !weight ||
      !duration ||
      !name ||
      !instruction
    ) {
      return;
    }
  });
