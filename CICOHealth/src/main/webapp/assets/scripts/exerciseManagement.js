//Get edit buttons
let editButtons = document.getElementsByClassName("edit-button");
//Iterate through edit buttons
for (let i = 0; i < editButtons.length; i++) {
  //Add click event listener to edit button
  editButtons[i].addEventListener("click", function () {
    console.log(this.dataset.exercise);
    //Get data-exercise attribute from edit button
    let exercise = JSON.parse(this.dataset.exercise);
    //Fills in the form with the exercise data
    document.getElementById("txtExerciseID").value = exercise.exerciseID;
    document.getElementById("txtExerciseType").value = exercise.exerciseType;
    document.getElementById("txtExerciseName").value = exercise.exerciseName;
    document.getElementById("txtExerciseDescription").value =
      exercise.exerciseDescription;
    document.getElementById("numCaloriePerHour").value =
      exercise.caloriesPerHour;
    //Show the form
    displayPopUp("edit-exercise-popup");
  });
}

//Get add button
let addButton = document.getElementById("add-button");
//Add click event listener to add button
let add_clicked = false;
addButton.addEventListener("click", function () {
  if (add_clicked == false) {
    let html_pop_up_addButton = `
    <div class="overlay"></div>
    <div class="pop-up-content">
        <form action="/CICOHealth/admin/exercise-management" method="post" id="add-exercise-form">
            <div class="form-group row">
                <div class="offset-4 col-8">
                <h2>Add Exercise</h2>
                </div>
            </div>
            <div class="form-group row">
                <label for="txtExerciseType" class="col-4 col-form-label">Exercise Type</label>
                <div class="col-8">
                <select id="txtExerciseType" name="txtExerciseType" class="form-control">
                    <option value="CA">Cardio</option>
                    <option value="RE">Resistance</option>
                </select>
                </div>
            </div>
            <div class="form-group row">
                <label for="txtExerciseName" class="col-4 col-form-label">Exercise Name</label>
                <div class="col-8">
                <input id="txtExerciseName" name="txtExerciseName" type="text" class="form-control">
                </div>
            </div>
            <div class="form-group row">
                <label for="txtExerciseDescription" class="col-4 col-form-label">Exercise Description</label>
                <div class="col-8">
                <textarea id="txtExerciseDescription" name="txtExerciseDescription" cols="40" rows="5" class="form-control"></textarea>
                </div>
            </div>
            <div class="form-group row">
                <label for="numCaloriePerHour" class="col-4 col-form-label">Calories Per Hour</label>
                <div class="col-8">
                <input id="numCaloriePerHour" name="numCaloriePerHour" value = "0" min = "0" type="number" class="form-control" placeholder = "Optional">
                </div>
            </div>
            <div class="form-group row">
                <div class="offset-4 col-8">
                <button name="btnAdd" type="submit" class="btn btn-primary">Add</button>
                </div>
            </div>
        </form>
    </div>
        `;
    let pop_up_element = document.createElement("div");
    pop_up_element.id = "add-exercise-popup";
    pop_up_element.classList.add("pop-up");
    pop_up_element.innerHTML = html_pop_up_addButton;
    document.body.appendChild(pop_up_element);
    displayPopUp("add-exercise-popup");
    add_clicked = true;
  }
  displayPopUp("add-exercise-popup");
  $("#add-exercise-form").validate({
    rules: {
      txtExerciseName: {
        required: true
      },
      txtExerciseDescription: {
        required: true
      }
    },
    messages: {
      txtExerciseName: {
        required: "Exercise name cannot be empty!"
      },
      txtExerciseDescription: {
        required: "Exercise description cannot be empty!"
      }
    }
  });
});

$(document).ready(function() {
    console.log("hello");
    $("#info-table").DataTable();
});