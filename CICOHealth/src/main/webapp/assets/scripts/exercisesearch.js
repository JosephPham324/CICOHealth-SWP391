let table_id = "info-table";
let popup_id = "exercise-log-pop-up";
let popup_content = document.querySelector(`#${popup_id} .pop-up-content`);
//Rows of table body
let rows = document
  .getElementById(table_id)
  .getElementsByTagName("tbody")[0]
  .getElementsByTagName("tr");
//Turn rows into array
rows = Array.from(rows);
//Iterate through table rows
rows.forEach(function (row) {
  //Get data-id
  let data_type = row.getAttribute("data-type");
  let data_exercise_info = row.getAttribute("data-exercise-info");
  //Add click event listener
  row.addEventListener("click", function () {
    popup_content.innerHTML = createPopupContent(data_type, data_exercise_info);
    addFormInputListener(data_type);
    displayPopUp(popup_id);
  });
});

function createPopupContent(exercise_type, exercise_info) {
  switch (exercise_type.toUpperCase()) {
    case "CARDIO":
      return createCardioPopupContent(exercise_info);
    case "RESISTANCE":
      return createResistancePopupContent(exercise_info);
    default:
      return "Error: Invalid exercise ID";
  }
}
function createCardioPopupContent(exercise_info) {
  let JSON_exercise_info = JSON.parse(exercise_info);
  let action = document.getElementById("exercise-log-pop-up").dataset.action;
  //HTML for form
  let exercise_info_html = `
    <form id = "create-log-form" onsubmit = "submitCardioLog(event)">
        <!-- Form Title -->
        <div class="form-group row">
            <div class="col-12">
            <div class="text-center">
                <h2 class="display-4">Create Log</h2>
            </div>
            </div>
        </div>
        <!-- Exercise Name -->
        <div class="form-group row">
            <label for="txtExerciseName" class="col-4 col-form-label">Exercise Name</label> 
            <div class="col-8">
            <input value= "${
              JSON_exercise_info.exerciseName
            }" id="txtExerciseName" name="txtExerciseName" type="text" required="required" class="form-control" readonly>
            </div>
        </div>
        <!-- Exercise Type -->
        <div class="form-group row">
            <label for="txtType" class="col-4 col-form-label">Exercise Type</label> 
            <div class="col-8">
            <input value = "${
              JSON_exercise_info.exerciseType
            }" id="txtType" name="txtType" type="text" class="form-control" required="required" readonly>
            </div>
        </div>
        <!-- Exercise Description -->
        <div class="form-group row">
            <label for="txtDescription" class="col-4 col-form-label">Description</label> 
            <div class="col-8">
            <textarea  id="txtDescription" name="txtDescription" cols="40" rows="5" class="form-control" required="required" readonly>${
              JSON_exercise_info.exerciseDescription
            }</textarea>
            </div>
        </div>
        <!-- Exercise Calories Per Hour -->
        <div class="form-group row">
            <label for="numCalPerHour" class="col-4 col-form-label">Kcal Per Hour</label> 
            <div class="col-8">
            <input value = "${
              JSON_exercise_info.caloriesPerHour
            }" id="numCalPerHour" name="numCalPerHour" type="text" required="required" class="form-control" readonly>
            </div>
        </div>
        <!-- Exercise Time Performed -->
        <div class="form-group row">
            <label for="numTimePerformed" class="col-4 col-form-label">Time Performed</label> 
            <div class="col-8">
            <input min = "1" value = "60" id="numTimePerformed" name="timeSpent" type="number" class="form-control" required="required">
            </div>
        </div>
        <!-- Exercise Calories Burned -->
        <div class="form-group row">
            <label for="numCalBurned" class="col-4 col-form-label">Kcal Burned</label> 
            <div class="col-8">
            <input value = "${
              JSON_exercise_info.caloriesPerHour
            }" id="numCalBurned" name="numCalBurned" type="text" required="required" class="form-control" readonly>
            </div>
        </div>
        ${
          action === "log"
            ? `
        <!-- Exercise Note -->
        <div class="form-group row">
            <label for="txtNote" class="col-4 col-form-label">Note</label> 
            <div class="col-8">
            <textarea  id="txtNote" name="logNote" cols="40" rows="5" class="form-control" placeholder="Note for your future self" aria-describedby="txtNoteHelpBlock"></textarea>
            <span id="txtNoteHelpBlock" class="form-text text-muted">Optional</span>
            </div>
        </div> 
        <input type = "hidden" name = "exerciseID" value = "${JSON_exercise_info.exerciseID}">
        <div class="form-group row">
            <div class="offset-4 col-8">
            <button name="submit" type="submit" class="btn btn-primary">Submit</button>
            </div>
        </div>
      `
            : ``
        } 
    </form>
    `;
  return exercise_info_html;
}
function createResistancePopupContent(exercise_info) {
  let JSON_exercise_info = JSON.parse(exercise_info);
  let action = document.getElementById("exercise-log-pop-up").dataset.action;
  console.log(action);
  //HTML for form
  let exercise_info_html = `
    <form id = "create-log-form" onsubmit = "submitResistanceLog(event)">
        <div class="form-group row">
            <label for="txtExerciseName" class="col-4 col-form-label">Exercise Name</label> 
            <div class="col-8">
            <input value= "${
              JSON_exercise_info.exerciseName
            }" id="txtExerciseName" name="exerciseName" type="text" required="required" class="form-control" readonly>
            </div>
        </div>
        <div class="form-group row">
            <label for="txtType" class="col-4 col-form-label">Exercise Type</label> 
            <div class="col-8">
            <input value = "${
              JSON_exercise_info.exerciseType
            }" id="txtType" name="exerciseType" type="text" class="form-control" required="required" readonly>
            </div>
        </div>
        <div class="form-group row">
            <label for="txtDescription" class="col-4 col-form-label">Exercise Description</label> 
            <div class="col-8">
            <textarea  id="txtDescription" name="exerciseDescription" cols="40" rows="5" class="form-control" required="required" readonly>${
              JSON_exercise_info.exerciseDescription
            }</textarea>
            </div>
        </div>
        <div class="form-group row" id = "num-set-input">
                <label for="numSet" class="col-4 col-form-label">Set</label> 
                <div class="col-8">
                <input max="30" id="numSet" name="set" placeholder="Enter number of sets" type="number" min="1" value = "1" required class="form-control">
                </div>
            </div>
            <div class="form-group row set-input">
                <label for="numWeightSet1" class="col-4 col-form-label">Weight - Set 1</label> 
                <div class="col-8">
                <input id="numWeightSet1" name="numWeightSet1" placeholder="Enter amount of weight used" type="text" class="form-control" required="required">
                </div>
            </div>
            <div class="form-group row set-input">
                <label for="numRepSet1" class="col-4 col-form-label">Reps - Set 1</label> 
                <div class="col-8">
                <input id="numRepSet1" name="numRepSet1" placeholder="Enter how many repetition performed" type="text" class="form-control" required="required">
            </div>
        </div>
        ${
          action === "log"
            ? `
            <div class="form-group row">
                <label for="txtNote" class="col-4 col-form-label">Note</label> 
                <div class="col-8">
                <textarea id="txtNote" name="logNote" cols="40" rows="3" class="form-control" aria-describedby="txtNoteHelpBlock"></textarea> 
                <span id="txtNoteHelpBlock" class="form-text text-muted">Optional</span>
                </div>
            </div>
            <input type = "hidden" name = "exerciseID" value = "${JSON_exercise_info.exerciseID}">
            <div class="form-group row">
                <div class="offset-4 col-8">
                <button name="submit" type="submit" class="btn btn-primary">Submit</button>
                </div>
            </div>
    `
            : ``
        }
    </form>
    `;
  //log exercise info
  console.log(JSON_exercise_info);
  return exercise_info_html;
}

function addFormInputListener(data_type) {
  switch (data_type.toUpperCase()) {
    case "CARDIO":
      addCardioFormInputListener();
      break;
    case "RESISTANCE":
      addResistanceFormInputListener();
      break;
    default:
      console.log("Error: Invalid exercise ID");
  }
}

function addCardioFormInputListener() {
  let time_performed = document.getElementById("numTimePerformed");
  let calories_per_hour = document.getElementById("numCalPerHour");
  let calories_burned = document.getElementById("numCalBurned");
  time_performed.addEventListener("input", function () {
    calories_burned.value = (
      (time_performed.value / 60) *
      calories_per_hour.value
    ).toFixed(1);
  });
}

function addResistanceFormInputListener() {
  //   console.log("Resistance");
  let num_set = document.getElementById("numSet");
  let num_set_input = document.getElementById("num-set-input");
  num_set.addEventListener("input", function () {
    let number_of_set = num_set.value;
    let set_input_html = "";
    //Clear previous set input
    let set_input = document.getElementsByClassName("set-input");
    console.log(set_input);
    while (set_input.length > 0) {
      console.log("here");
      set_input = document.getElementsByClassName("set-input");
      set_input[0].parentNode.removeChild(set_input[0]);
    }
    for (let i = 0; i < number_of_set; i++) {
      set_input_html += `
        <div class="form-group row set-input">
            <label for="numWeightSet${
              i + 1
            }" class="col-4 col-form-label">Set ${i + 1} - Weight </label> 
            <div class="col-8">
            <input id="numWeightSet${i + 1}" name="numWeightSet${
        i + 1
      }" placeholder="Enter amount of weight used" type="number" class="form-control" required="required">
            </div>
        </div>
        <div class="form-group row set-input">
            <label for="numRepSet${i + 1}" class="col-4 col-form-label">Set ${
        i + 1
      } - Reps</label> 
            <div class="col-8">
            <input id="numRepSet${i + 1}" name="numRepSet${
        i + 1
      }" placeholder="Enter how many repetition performed" type="number" class="form-control" required="required">
            </div>
        </div>
        `;
    }
    //Add set input to form after num_set_input
    num_set_input.insertAdjacentHTML("afterend", set_input_html);
  });
}

function submitCardioLog(event) {
  event.preventDefault();
  //Get form data
  let form_data = new FormData(document.getElementById("create-log-form"));
  console.log(form_data);
  //Convert form data to JSON
  let form_data_json = {};
  for (const pair of form_data.entries()) {
    form_data_json[pair[0]] = pair[1];
  }
  data_send = {
    exercise: JSON.stringify(form_data_json),
  };
  console.log(form_data_json);
  post("/CICOHealth/user/exercise-logs/cardio", data_send);
}

function submitResistanceLog(event) {
  event.preventDefault();
  let reps = "";
  let weights = "";
  let form_data = new FormData(document.getElementById("create-log-form"));
  console.log(form_data);
  //Convert form data to JSON
  let form_data_json = {};
  for (const pair of form_data.entries()) {
    if (pair[0].startsWith("numWeightSet")) {
      weights += pair[1] + "/";
      continue;
    }
    if (pair[0].startsWith("numRepSet")) {
      reps += pair[1] + "/";
      continue;
    }
    form_data_json[pair[0]] = pair[1];
  }
  //Remove last slash in weights and reps
  reps = reps.slice(0, reps.length - 1);
  form_data_json["rep"] = reps;
  weights = weights.slice(0, weights.length - 1);
  form_data_json["weight"] = weights;
  data_send = {
    exercise: JSON.stringify(form_data_json),
  };
  post("/CICOHealth/user/exercise-logs/cardio", data_send);
}
