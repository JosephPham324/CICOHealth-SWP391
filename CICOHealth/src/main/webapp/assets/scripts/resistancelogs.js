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
  addEditButtonsClickEvent();
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
            <a href="#" class="btn-note-pop-up" data-logid = "${logData.exerciseLogID}">
            <i class="fa-solid fa-note-sticky"></i></a>
        </td>
        <td>
            <a href="#" class="btn-edit-pop-up" data-logid = "${logData.exerciseLogID}">
            <i class="fa-solid fa-pen-to-square"></i></a>/
            <form action="/CICOHealth/user/exercise-logs" method="POST" style="display: inline-block;" id="formDelete">
                <input type="hidden" name="_method" value="delete">
                <input type="hidden" name="exerciseLogID" value="${logData.exerciseLogID}">
                <button style="border:0; background-color:transparent; color:red;" type="submit" class="btn-delete-pop-up" onclick="confirmDelete()"><i style = "font-size:20;" class="fa-solid fa-trash" id="btnDelete"></i></button>
            </form>
        </td>
    </tr>
    `;
}

function addEditButtonsClickEvent() {
  let editButtons = document.querySelectorAll(".btn-edit-pop-up");
  editButtons.forEach((button) => {
    button.addEventListener("click", function (event) {
      let log = findExerciseLogById(button.dataset.logid);
      logUpdate = JSON.parse(JSON.stringify(log));
      fillEditForm(logUpdate);
      displayPopUp("edit-pop-up");
      //Add submit event listener to the edit form
      let form_id = "edit-exercise-log-form";
      logUpdate.logDate = $("#date-picker").val();

      //Add submit event listener to the edit form
      logUpdate.logTime = logUpdate.logDate + " "+ logUpdate.logTime.split(" ")[0];
      logUpdate.logTime = new Date(logUpdate.logTime);
      document
        .getElementById(form_id)
        .addEventListener("submit", function (event) {
          event.preventDefault();
          let formParams = {
            mealLog: JSON.stringify(logUpdate),
            _method: "PUT",
            check: "resitance"
          };
          post("/CICOHealth/user/exercise-logs/resistance", formParams);
        });
    });
  });
}

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

function confirmDelete(event){
    if(confirm("Are you sure you want to delete this exercise log?")){
         event.preventDefault();
        document.getElementById("formDelete").submit();
    }else{
        event.preventDefault();
        alert("Oke vay thoi!");
    }
}
