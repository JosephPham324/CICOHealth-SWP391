let date_picker = document.getElementById("date-picker");
let logsData;
let logUpdate;
let table_id = "resistance-logs-table";
let total = {
    set: 0,
    rep: 0,
    weight: 0,
};
//Set the date picker value to today in format yyyy-mm-dd
$(document).ready(function () {
    //Set date to today
    date_picker.value = new Date().toISOString().slice(0, 10);
    date_picker.dispatchEvent(new Event("input"));
});
//Get date picker data
function getDatePickerData() {
    //Get the date value from the date picker
    //Use Jquery to get in the format of yyyy-mm-dd
    let date = $("#date-picker").val();
    //Send a synchronous GET request to the server
    let response = $.ajax({
        url: "/CICOHealth/user/exercise-logs/resistance/data?date=" + date,
        async: false,
    }).responseText;
    let data = JSON.parse(response);
    return data.logs;
}

//Listen to input event on the date picker
date_picker.addEventListener("input", function (event) {
    //Get the date value from the date picker
    //Use Jquery to get in the format of yyyy-mm-dd
    logsData = getDatePickerData();
    fillTable(logsData);
    document.getElementById("total-set").innerHTML = total.set;
    document.getElementById("total-reps").innerHTML = total.rep;
    document.getElementById("total-weight").innerHTML = total.weight;
});

//Fill the table with data
function fillTable(logsData) {
    $(`#${table_id}`).DataTable().clear().destroy();

    let rowsHTML = "";
    let count = 1;
    logsData.forEach((logData) => {
        rowsHTML += getRowHTML(count, logData);
        addToTotal(logData);
    });
    let tableBody = document.querySelector("#" + table_id + " tbody");
    tableBody.innerHTML = rowsHTML;

    //Add event listeners to the edit and delete buttons
    //   addEditButtonsClickEvent();
    addNoteButtonsClickEvent();
    $(`#${table_id}`).DataTable();
}

function getRowHTML(count, logData) {
    return `
    <tr>
        <td>${count}</td>
        <td>${logData.logTime}</td>
        <td>${logData.exercise.exerciseName}</td>
        <td>${logData.set}</td>
        <td>${logData.rep}</td>
        <td>${logData.weight}</td>
        <td>
            <a href="#" class="btn-note-pop-up" data-logid = "${logData.exerciseLogID}"><i class="fa-solid fa-note-sticky"></i></a>
        </td>
        <td>
            <a href="#" class="btn-edit-pop-up" data-logid = "${logData.exerciseLogID}" onclick="p()"><i class="fa-solid fa-pen-to-square"></i></a>/
            <form action="/CICOHealth/user/exercise-logs" method="POST" style="display: inline-block;" id="formDelete">
                <input type="hidden" name="_method" value="delete">
                <input type="hidden" name="exerciseLogID" value="${logData.exerciseLogID}">
                <button style="border:0; background-color:transparent; color:red;" type="submit" class="btn-delete-pop-up" onclick="confirmDelete()"><i style = "font-size:20;" class="fa-solid fa-trash" id="btnDelete"></i></button>
            </form>
        </td>
    </tr>
    `;
}

let popup_id = "exercise-log-pop-up";
let popup_content = document.querySelector(`#${popup_id} .pop-up-content`);

function addNoteButtonsClickEvent() {
    let noteButtons = document.querySelectorAll(".btn-note-pop-up");
    noteButtons.forEach((button) => {
        button.addEventListener("click", function (event) {
            let log = findExerciseLogById(button.dataset.logid);
            document.getElementById("txtNote").innerText = log.logNote;
            displayPopUp("note-pop-up");
        });
    });
}

function findExerciseLogById(id) {
    return logsData.find((log) => log.exerciseLogID == id);
}
function separateString(string, separator) {
    let res = [];
    string.split(separator).forEach((str) => {
        //Parse the string to number
        res.push(parseInt(str));
    });
    return res;
}

function addToTotal(logData) {
    total.set += logData.set;
    //Accumulate the total reps after separating the string by /
    total.rep += separateString(logData.rep, "/").reduce((a, b) => a + b, 0);
    total.weight += separateString(logData.weight, "/").reduce(
            (a, b) => a + b,
            0
            );
}

function confirmDelete(event) {
    if (confirm("Are you sure you want to delete this exercise log?")) {
        event.preventDefault();
        document.getElementById("formDelete").submit();
    } else {
        event.preventDefault();
        alert("Oke vay thoi!");
    }
}

function createPopupContent(exercise_info) {
    return createResistancePopupContent(exercise_info);
}

function createResistancePopupContent(exercise_info) {
//    let JSON_exercise_info = JSON.parse(exercise_info);
    console.log("day la log " + exercise_info.exerciseLogID);
    //HTML for form
    let exercise_info_html = `
   <form id = "create-log-form" onsubmit = "submitResistanceLog(event)">
<div class="form-group row">
    <label for="txtExerciseName" class="col-4 col-form-label">Exercise Name</label> 
    <div class="col-8">
    <input value= "${exercise_info.exercise.exerciseName}" id="txtExerciseName" name="exerciseName" type="text" required="required" class="form-control" readonly>
    </div>
</div>
<div class="form-group row">
    <label for="txtType" class="col-4 col-form-label">Exercise Type</label> 
    <div class="col-8">
    <input value = "${exercise_info.exercise.exerciseType}" id="txtType" name="exerciseType" type="text" class="form-control" required="required" readonly>
    </div>
</div>
<div class="form-group row">
    <label for="txtDescription" class="col-4 col-form-label">Exercise Description</label> 
    <div class="col-8">
    <textarea  id="txtDescription" name="exerciseDescription" cols="40" rows="5" class="form-control" required="required" readonly>${exercise_info.exercise.exerciseDescription}</textarea>
    </div>
</div>
<div class="form-group row" id = "num-set-input">
    <label for="numSet" class="col-4 col-form-label">Set</label> 
    <div class="col-8">
    <input id="numSet" name="set" placeholder="Enter number of sets" type="number" min="1" value = "${exercise_info.set}" required class="form-control">
    </div>
</div>
<div class="form-group row set-input">
    <label for="numWeightSet1" class="col-4 col-form-label">Weight - Set 1</label> 
    <div class="col-8">
    <input id="numWeightSet1" name="numWeightSet1" placeholder="Enter amount of weight used" type="text" class="form-control" required="required" value="${exercise_info.set}">
    </div>
</div>
<div class="form-group row set-input">
    <label for="numRepSet1" class="col-4 col-form-label">Reps - Set 1</label> 
    <div class="col-8">
    <input id="numRepSet1" name="numRepSet1" placeholder="Enter how many repetition performed" type="text" class="form-control" required="required" value="${exercise_info.rep}">
    </div>
</div>
<input type = "hidden" name = "exerciseLogID" value="${exercise_info.exerciseLogID}">
<input type = "hidden" name = "exerciseID" value="${exercise_info.exercise.exerciseID}">

<div class="form-group row">
    <div class="offset-4 col-8">
    <button name="submit" type="submit" class="btn btn-primary">Submit</button>
    </div>
</div>
</form>
    `;
    //log exercise info
    console.log(exercise_info);
    return exercise_info_html;
}



function addFormInputListener() {
    addResistanceFormInputListener();
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
        console.log(set_input)
        while (set_input.length > 0) {
            console.log('here')
            set_input = document.getElementsByClassName("set-input");
            set_input[0].parentNode.removeChild(set_input[0]);
        }
        for (let i = 0; i < number_of_set; i++) {
            set_input_html += `
        <div class="form-group row set-input">
            <label for="numWeightSet${i + 1}" class="col-4 col-form-label">Set ${i + 1} - Weight </label> 
            <div class="col-8">
            <input id="numWeightSet${i + 1}" name="numWeightSet${i + 1}" placeholder="Enter amount of weight used" type="number" class="form-control" required="required">
            </div>
        </div>
        <div class="form-group row set-input">
            <label for="numRepSet${i + 1}" class="col-4 col-form-label">Set ${i + 1} - Reps</label> 
            <div class="col-8">
            <input id="numRepSet${i + 1}" name="numRepSet${i + 1}" placeholder="Enter how many repetition performed" type="number" class="form-control" required="required">
            </div>
        </div>
        `;
        }
        //Add set input to form after num_set_input
        num_set_input.insertAdjacentHTML("afterend", set_input_html);
    });
}


function submitResistanceLog(event) {
    event.preventDefault();
    let reps = '';
    let weights = '';
    let form_data = new FormData(document.getElementById("create-log-form"));
    console.log(form_data);
    //Convert form data to JSON
    let form_data_json = {};

    for (const pair of form_data.entries()) {
        if (pair[0].startsWith('numWeightSet')) {
            weights += pair[1] + '/';
            continue;
        }
        if (pair[0].startsWith('numRepSet')) {
            reps += pair[1] + '/';
            continue;
        }
        form_data_json[pair[0]] = pair[1];
    }
    //Remove last slash in weights and reps
    reps = reps.slice(0, reps.length - 1);
    form_data_json['rep'] = reps;
    weights = weights.slice(0, weights.length - 1);
    form_data_json['weight'] = weights;
    console.log("final data: " + form_data_json);

    data_send = {
        exerciseLog: JSON.stringify(form_data_json),
        _method: "PUT",
        check: "RESISTANCE"
    };
    post("/CICOHealth/user/exercise-logs/resistance", data_send);
}


function p() {
    let editButtons = document.querySelectorAll(".btn-edit-pop-up");
    var logid = event.target.parentNode.getAttribute('data-logid');
    console.log(logid);
    let log = findExerciseLogById(logid);
    console.log(log);
    logUpdate = JSON.parse(JSON.stringify(log));
    console.log(logUpdate);
    popup_content.innerHTML = createPopupContent(logUpdate);
    addFormInputListener();
    displayPopUp(popup_id);
}