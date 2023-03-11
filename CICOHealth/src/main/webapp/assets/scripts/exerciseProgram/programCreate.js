function addNewWorkout()
{
    //Count how many workout in program
    let countWorkout = $(".list-exercise-program-item").length ?? 0;
    let newID = countWorkout + 1;
    console.log("newID: " + newID)
    //Create new workout
    let newWorkout = document.createElement("div");
    newWorkout.className = "card list-exercise-program-item";
    newWorkout.innerHTML = `
                    <div class="card-header btn" data-toggle="collapse" data-target="#program-${newID}">
                            Workout ${newID}
                    </div>
                    <div class="card-body collapse" data-toggle="collapse" aria-expanded="false" id="program-${newID}">
                        <div class="form-item row">
                            <div class=" col-3">
                                <label for="txtWorkoutName">Workout Name</label>
                            </div>
                            <div class="col-9 form-item-input">
                                <input id="txtWorkoutName-${newID}" name="txtWorkoutName" placeholder="Enter workout name"
                                    type="text">
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
                                    placeholder="Enter workout description"></textarea>
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
                                </tr>
                            </thead>
                            <tbody class="pop-up-body-table">
                            </tbody>
                        </table>
                        <div class="btn-add-exericse">
                            <a href="#" class="btn btn-create-exercise-pop-up" id="btn-create-exercise-pop-up-${newID}" data-target = "#program-${newID}" >Add
                                exercise</a>
                        </div>
                    </div>
    `
    //Add new workout to list workout
    //Append before button add workout
    let btnAddWorkout = document.querySelector("#btn-add-workout");
    btnAddWorkout.parentNode.insertBefore(newWorkout, btnAddWorkout);
    //Add event listener to name field
    let txtWorkoutName = document.getElementById(`txtWorkoutName-${newID}`);
    txtWorkoutName.addEventListener("change", function(){
        let workoutName = txtWorkoutName.value;
        let workoutHeader = document.querySelector(`.card-header[data-target="#program-${newID}"]`);
        workoutHeader.innerHTML = workoutName;
    });

    //Add event listener to button add exercise
    let btnAddExercise = document.querySelector(`#program-${newID} #btn-create-exercise-pop-up-${newID}`);
    btnAddExercise.addEventListener("click", function(){
        workoutIndex = newID;
        displayPopUp("create-exercise-pop-up");
    });
}

function fetchExerciseList(){
    fetch("http://localhost:8080/CICOHealth/exercise-search/data?type=names")
    .then(response => response.json())
    .then(data => {
        let exerciseList = data;
        let selectExercise = document.querySelector("#select-exercise");
        selectExercise.innerHTML = "";
        exerciseList.forEach(exercise => {
            let option = document.createElement("option");
            option.value = exercise;
            option.innerHTML = exercise;
            selectExercise.appendChild(option);
        });
    })
    .catch(error => console.error(error));
}
function validateAddExerciseForm(){
    //Validate the form, using blur event
}
function ExerciseListRowHtml(order, set, rep, weight, duration, instruction, exerciseName){
    return `
    <tr>
        <td>${exerciseName}</td>
        <td>${order}</td>
        <td>${set}</td>
        <td>${rep}</td>
        <td>${weight}</td>
        <td>${duration}</td>
        <td>${instruction}</td>
    </tr>
    `
}
function addExerciseToWorkout(){
    let exerciseOrder = document.querySelector("#txtExerciseOrderPopUp").value;
    let set = document.querySelector("#txtSetPopUp").value;
    let rep = document.querySelector("#txtRepPopUp").value;
    let weight = document.querySelector("#txtWeightPopUp").value;
    let duration = document.querySelector("#txtDurationPopUp").value;
    let instruction = document.querySelector("#txtInstructionPopUp").value;
    let exerciseName = document.querySelector("#select-exercise").value;
    let exerciseListRow = ExerciseListRowHtml(exerciseOrder, set, rep, weight, duration, instruction, exerciseName);
    let exerciseListTable = document.querySelector(`#create-table-${workoutIndex} tbody`);
    exerciseListTable.innerHTML += exerciseListRow;
    //Clear form
    document.querySelector("#form-add-exercise").reset();
    //Close pop up
    closePopUp("create-exercise-pop-up");
};

let workoutIndex;//Index of selected workout in program
let btnAddWorkout = document.querySelector("#btn-add-workout a");//Button add workout

//Fetch exercise list
fetchExerciseList();


//Add validation to add exercise form
let formAddExercise = document.querySelector("#create-exercise-form");

//Add event listener to form add exercise
formAddExercise.addEventListener("submit", function(event){
    event.preventDefault();
    addExerciseToWorkout();
});


//Add event listener to button add workout
btnAddWorkout.addEventListener("click", addNewWorkout);

