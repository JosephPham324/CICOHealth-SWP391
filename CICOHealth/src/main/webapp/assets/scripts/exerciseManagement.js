//Get edit buttons
let editButtons = document.getElementsByClassName("edit-button");
//Iterate through edit buttons
for (let i = 0; i < editButtons.length; i++) {
    //Add click event listener to edit button
    editButtons[i].addEventListener("click", function () {
        console.log(this.dataset.exercise)
        //Get data-exercise attribute from edit button
        let exercise = JSON.parse(this.dataset.exercise);
        //Fills in the form with the exercise data
        document.getElementById("txtExerciseID").value = exercise.exerciseID;
        document.getElementById("txtExerciseType").value = exercise.exerciseType;
        document.getElementById("txtExerciseName").value = exercise.exerciseName;
        document.getElementById("txtExerciseDescription").value = exercise.exerciseDescription;
        document.getElementById("numCaloriePerHour").value = exercise.caloriesPerHour;
        //Show the form
        showPopUp("edit-exercise-popup");
    })
};

//Show pop-up 
function showPopUp(id) {
    //Get pop-up element
    let popUp = document.getElementById(id);
    //Show pop-up
    popUp.classList.add("active");
}

//Hide pop-up
function hidePopUp(id) {
    //Get pop-up element
    let popUp = document.getElementById(id);
    //Hide pop-up
    popUp.classList.remove("active");
}