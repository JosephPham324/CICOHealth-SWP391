function uuidv4() {
  return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
    var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
    return v.toString(16);
  });
}

function removeWorkout(element) {
  let target = element.getAttribute("data-target");
  let workout = document.querySelector(target);
  workout.parentNode.remove();
}
//-----------------------------------------------------------------------
function addNewWorkout() {
  //Count how many workout in program
  let countWorkout = $(".list-exercise-program-item").length ?? 0;
  let newID = uuidv4();
  console.log("newID: " + newID);
  //Create new workout
  let newWorkout = document.createElement("div");
  newWorkout.className = "card list-exercise-program-item";
  newWorkout.innerHTML = `
                    <div class="card-header btn" data-toggle="collapse" data-target="#workout-${newID}">
                            Workout ${countWorkout + 1}
                    </div>
                    <div class="card-body collapse workout" data-toggle="collapse" aria-expanded="false" id="workout-${newID}" data-id = "${newID}">
                        <div class="form-item row">
                            <div class=" col-3">
                                <label for="txtWorkoutName">Workout Name</label>
                            </div>
                            <div class="col-9 form-item-input">
                                <input id="txtWorkoutName-${newID}" name="txtWorkoutName" placeholder="Enter workout name"
                                    type="text" required = "required">
                            </div>
                        </div>
                        <div class="form-item row">
                            <div class="col-3">
                                <label for="txtWorkoutDate">Workout Date</label>
                            </div>
                            <div class="col-9 form-item-input">
                                <select id="txtWorkoutDate-${newID}" name="txtWorkoutDate" class = "col-12">
                                    <option value="1">Monday</option>
                                    <option value="2">Tuesday</option>
                                    <option value="3">Wednesday</option>
                                    <option value="4">Thursday</option>
                                    <option value="5">Friday</option>
                                    <option value="6">Saturday</option>
                                    <option value="7">Sunday</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-item row">
                            <div class="col-3">
                                <label for="txtWorkoutDescription">Description</label>
                            </div>
                            <div class="col-9 form-item-input">
                                <textarea name="txtWorkoutDescription" id="txtWorkoutDescription-${newID}" cols="30" rows="5"
                                    placeholder="Enter workout description" required></textarea>
                            </div>
                        </div>
                        <hr>
                        <div class="form-item row">
                            <div class="col-2">
                                <label for="txtListExercises">List Exercises</label>
                            </div>
                        </div>

                        <table id="create-table-${newID}" class="hover table-content" style="width: 100%">
                            <thead class="pop-up-thead-table">
                                <tr>
                                    <th>Exercise</th>
                                    <th>Order</th>
                                    <th>Set</th>
                                    <th>Rep</th>
                                    <th>Weight</th>
                                    <th>Duration</th>
                                    <th>Instruction</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody class="pop-up-body-table">
                            </tbody>
                        </table>
                        <div class="btn-add-exericse">
                            <a href="#" class="btn btn-create-exercise-pop-up" id="btn-create-exercise-pop-up-${newID}" data-target = "#workout-${newID}" >Add
                                exercise</a>
                        </div>
                        <div>
                        <a href="#" class="btn btn-create-exercise-pop-up" id="btn-delete-workout" data-target = "#workout-${newID}" onclick="removeWorkout(this)">Remove
                            Workout</a>
                        </div>
                    </div>
    `;
  //Add new workout to list workout
  //Append before button add workout
  let btnAddWorkout = document.querySelector("#btn-add-workout");
  btnAddWorkout.parentNode.insertBefore(newWorkout, btnAddWorkout);
  //Add event listener to name field
  let txtWorkoutName = document.getElementById(`txtWorkoutName-${newID}`);
  txtWorkoutName.addEventListener("change", function () {
    let workoutName = txtWorkoutName.value;
    let workoutHeader = document.querySelector(
      `.card-header[data-target="#workout-${newID}"]`
    );
    workoutHeader.innerHTML = workoutName;
  });

  //Add event listener to button add exercise
  let btnAddExercise = document.querySelector(
    `#workout-${newID} #btn-create-exercise-pop-up-${newID}`
  );
  btnAddExercise.addEventListener("click", function () {
    selectedWorkoutIndex = newID;
    displayPopUp("create-exercise-pop-up");
  });
}
//-----------------------------------------------------------------------
function fetchExerciseList() {
  fetch("http://localhost:8080/CICOHealth/exercise-search/data?type=names")
    .then((response) => response.json())
    .then((data) => {
      let exerciseList = data;
      let selectExercise = document.querySelector("#select-exercise");
      let selectExerciseUpdate = document.querySelector("#select-exercise-update");
      selectExercise.innerHTML = "";
      console.log(exerciseList);
      for (let exerciseID in exerciseList) {
        let option = document.createElement("option");
        option.value = exerciseID;
        option.innerHTML = exerciseList[exerciseID];
        selectExercise.appendChild(option);
        selectExerciseUpdate.appendChild(option.cloneNode(true));
      }
    })
    .catch((error) => console.error(error));
}
//-----------------------------------------------------------------------
function validateAddExerciseForm() {
  //Validate the form, using blur event
}
//-----------------------------------------------------------------------
function ExerciseListRowHtml(
  id,
  order,
  set,
  rep,
  weight,
  duration,
  instruction,
  exerciseName,
  exerciseID
) {
  //Calculate how many row in table
  let rowID = uuidv4();

  return `
    <tr id = "workout-${id}-exercise-${rowID}">
        <td data-id = "${exerciseID}">${exerciseName}</td>
        <td>${order}</td>
        <td>${set}</td>
        <td>${rep}</td>
        <td>${weight}</td>
        <td>${duration}</td>
        <td>${instruction}</td>
        <td>
        <a class="btn" id = "btn-edit-${id}-exercise-${
    rowID
  }" data-target = "#workout-${id}-exercise-${
    rowID
  }" onclick = "fillEditExerciseForm(this)">Edit</a>
        <a class="btn" id = "btn-delete-${id}-exercise-${
    rowID
  }" data-target = "#workout-${id}-exercise-${
    rowID
  }" onclick = "deleteExercise(this)">Delete</a>
        </td>
    </tr>
    `;
}

//-----------------------------------------------------------------------
function fillEditExerciseForm(element) {
  //Get target
  let target = element.getAttribute("data-target");
  console.log(target)
  //Get row
  let row = document.querySelector(target);
  //Fill form with data
  //Get value from table cell
  let exerciseID = row.children[0].getAttribute("data-id");
  let exerciseOrder = row.children[1].innerHTML;
  let set = row.children[2].innerHTML;
  let rep = row.children[3].innerHTML;
  let weight = row.children[4].innerHTML;
  let duration = row.children[5].innerHTML;
  let instruction = row.children[6].innerHTML;
  //Fill form
  document.querySelector("#target-row").value = target;
  document.querySelector("#select-exercise-update").value = exerciseID;
  document.querySelector("#txtExerciseOrderUpdate").value = exerciseOrder;
  document.querySelector("#txtSetUpdate").value = set;
  document.querySelector("#txtRepUpdate").value = rep;
  document.querySelector("#txtWeightUpdate").value = weight;
  document.querySelector("#txtDurationUpdate").value = duration;
  document.querySelector("#txtInstructionUpdate").value = instruction;
  //Trigger click event to open pop up
  displayPopUp("update-exercise-pop-up");
}
//-----------------------------------------------------------------------
let updateForm = document.querySelector("#update-exercise-form");
updateForm.addEventListener("submit", function (event) {
    event.preventDefault();
    //Get data from form
    let rowID = document.querySelector("#target-row").value;
    updateExerciseRow(rowID);
    //Close pop up
    document.querySelector("#update-exercise-pop-up .overlay").click();
});
function updateExerciseRow(rowId){
    let exerciseOrder = document.querySelector("#txtExerciseOrderUpdate").value;
    let set = document.querySelector("#txtSetUpdate").value;
    let rep = document.querySelector("#txtRepUpdate").value;
    let weight = document.querySelector("#txtWeightUpdate").value;
    let duration = document.querySelector("#txtDurationUpdate").value;
    let instruction = document.querySelector("#txtInstructionUpdate").value;
    let exerciseSelect = document.querySelector("#select-exercise-update");
    let exerciseName = exerciseSelect[exerciseSelect.selectedIndex].innerHTML;
    let exerciseId = exerciseSelect.value;
    //Update row cells
    let row = document.querySelector(rowId);
    row.children[0].innerHTML = exerciseName;
    row.children[0].setAttribute("data-id", exerciseId);
    row.children[1].innerHTML = exerciseOrder;
    row.children[2].innerHTML = set;
    row.children[3].innerHTML = rep;
    row.children[4].innerHTML = weight;
    row.children[5].innerHTML = duration;
    row.children[6].innerHTML = instruction;
}
//-----------------------------------------------------------------------
function deleteExercise(btnElement) {
  let target = btnElement.getAttribute("data-target");
  let row = document.querySelector(target);
  row.remove();
}
//-----------------------------------------------------------------------
function addExerciseToWorkout() {
  //Get data from form
  let exerciseOrder = document.querySelector("#txtExerciseOrderPopUp").value;
  let set = document.querySelector("#txtSetPopUp").value;
  let rep = document.querySelector("#txtRepPopUp").value;
  let weight = document.querySelector("#txtWeightPopUp").value;
  let duration = document.querySelector("#txtDurationPopUp").value;
  let instruction = document.querySelector("#txtInstructionPopUp").value;
  let exerciseSelect = document.querySelector("#select-exercise");
  let exerciseName = exerciseSelect[exerciseSelect.selectedIndex].innerHTML;
  let exerciseId = exerciseSelect.value;
  let exerciseListRow = ExerciseListRowHtml(
    selectedWorkoutIndex,
    exerciseOrder,
    set,
    rep,
    weight,
    duration,
    instruction,
    exerciseName,
    exerciseId
  );
  let exerciseListTable = document.querySelector(
    `#create-table-${selectedWorkoutIndex} tbody`
  );
  exerciseListTable.innerHTML += exerciseListRow;

  //Clear form
  document.querySelector("#create-exercise-form").reset();
  //Close pop up
  document.querySelector("#create-exercise-pop-up .overlay").click();
}
//-----------------------------------------------------------------------
/**
 * This function is called when the user submits a form for creating a new program.
 * It creates an object that represents the program, with the program name, description, and an array of workouts.
 * It loops through each workout on the form and calls the `createWorkoutObject()` function to create an object
 * that represents the workout, and pushes it onto the program's `workouts` array.
 * Finally, it logs the completed program object to the console.
 */
function submitProgramCreationForm() {
  // Get the program name and description from the form
  let programName = document.querySelector("#txtProgramName").value;
  let programDescription = document.querySelector(
    "#txtProgramDescription"
  ).value;

  // Create a new object to represent the program
  let program = {
    programName: programName,
    programDescription: programDescription,
    workoutCollection: [],
  };

  // Loop through each workout on the form and create an object to represent it
  //Get workout elements
  let workoutElements = document.querySelectorAll(".workout");
  //Loop through workout elements
  workoutElements.forEach((workoutElement) => {
    //Get workout id
    let workoutId = workoutElement.dataset.id;
    let workout = createWorkoutObject(workoutId);
    program.workoutCollection.push(workout);
  });
  // Log the completed program object to the console
  console.log(program);
  post("/CICOHealth/exercise-programs/create", {program:JSON.stringify(program)});
}
//-----------------------------------------------------------------------
/**
 * This function is called by `submitProgramCreationForm()` to create an object that represents a workout.
 * It gets the workout name, date, description, and exercises from the form, and creates an object that contains
 * this information.
 * It loops through each exercise on the form and creates an object that represents the exercise, and pushes
 * it onto the workout's `exercises` array.
 * Finally, it returns the completed workout object.
 * @param {number} id - The ID of the workout on the form.
 * @returns {object} An object that represents the workout.
 */
function createWorkoutObject(id) {
    // Get the workout name, date, and description from the form
  let workoutName = document.querySelector(`#txtWorkoutName-${id}`).value;
  let workoutDate = document.querySelector(`#txtWorkoutDate-${id}`).value;
  let workoutDescription = document.querySelector(
    `#txtWorkoutDescription-${id}`
  ).value;
  
  // Create a new object to represent the workout
  let workout = {
    workoutName: workoutName,
    workoutDate: workoutDate,
    workoutDescription: workoutDescription,
    workoutExercisesCollection: [],
  };
  // Get the number of exercises on the form
  let numberOfExercise = document.querySelectorAll(
    `#create-table-${id} tbody tr`
  ).length;

  // Loop through each exercise on the form and create an object to represent it
  for (let j = 0; j < numberOfExercise; j++) {
    let exerciseOrder = document.querySelector(
      `#create-table-${id} tbody tr:nth-child(${j + 1}) td:nth-child(2)`
    ).innerHTML;
    let exerciseSet = document.querySelector(
      `#create-table-${id} tbody tr:nth-child(${j + 1}) td:nth-child(3)`
    ).innerHTML;
    let exerciseRep = document.querySelector(
      `#create-table-${id} tbody tr:nth-child(${j + 1}) td:nth-child(4)`
    ).innerHTML;
    let exerciseWeight = document.querySelector(
      `#create-table-${id} tbody tr:nth-child(${j + 1}) td:nth-child(5)`
    ).innerHTML;
    let exerciseDuration = document.querySelector(
      `#create-table-${id} tbody tr:nth-child(${j + 1}) td:nth-child(6)`
    ).innerHTML;
    let exerciseInstruction = document.querySelector(
      `#create-table-${id} tbody tr:nth-child(${j + 1}) td:nth-child(7)`
    ).innerHTML;
    let exerciseID = document.querySelector(
      `#create-table-${id} tbody tr:nth-child(${j + 1}) td:nth-child(1)`
    ).dataset.id;

    let exercise = {
      order: exerciseOrder,
      set: exerciseSet,
      rep: exerciseRep,
      weight: exerciseWeight,
      duration: exerciseDuration === ""? "0": exerciseDuration,
      instruction: exerciseInstruction,
      workoutExercisesPK: {exerciseID: exerciseID},
    };
    // console.log(exercise)
    // Push the exercise object onto the workout's exercises array
    workout.workoutExercisesCollection.push(exercise);
  }
  return workout;
}
//----------------------------MAIN--------------------------------------
let selectedWorkoutIndex; //Index of selected workout in program
let btnAddWorkout = document.querySelector("#btn-add-workout a"); //Button add workout

//Fetch exercise list
fetchExerciseList();

//Add validation to add exercise form
let formAddExercise = document.querySelector("#create-exercise-form");

//Add event listener to form add exercise
formAddExercise.addEventListener("submit", function (event) {
  event.preventDefault();
  addExerciseToWorkout();
});

//Add event listener to button submit program
let btnSubmitProgram = document.querySelector("#btn-submit-program");
btnSubmitProgram.addEventListener("click", (event) => {
  submitProgramCreationForm();
  event.preventDefault();
});

//Add event listener to button add workout
btnAddWorkout.addEventListener("click", addNewWorkout);