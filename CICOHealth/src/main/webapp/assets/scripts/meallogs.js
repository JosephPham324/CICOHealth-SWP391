let date_picker = document.getElementById("date-picker");
let logsData = {};
let table_id = "meal-logs-table";
let total = {
  calories: 0,
  protein: 0,
  carbs: 0,
  fat: 0,
};
let logUpdate;

//Listen to input event on the date picker
date_picker.addEventListener("input", function (event) {
  //Get the date value from the date picker
  //Use Jquery to get in the format of yyyy-mm-dd
  logsData = getDatePickerData();
  total = {
    calories: 0,
    protein: 0,
    carbs: 0,
    fat: 0,
  };
  //log logsData to the console
  console.log(logsData);
  fillTable(logsData);
  document.getElementById("protein-value").innerText = total.protein.toFixed(1);
  document.getElementById("carbs-value").innerText = total.carbs.toFixed(1);
  document.getElementById("fat-value").innerText = total.fat.toFixed(1);
  document.getElementById("calories-value").innerText =
    total.calories.toFixed(0);
});

function findExerciseLogById(id) {
  return logsData.find((log) => log.mealLogID == id);
}

//Fill the table with data
function fillTable(logsData) {
  $(`#${table_id}`).DataTable().clear().destroy();

  let rowsHTML = "";
  let count = 1;
  logsData.forEach((logData) => {
    rowsHTML += getRowHTML(count++, logData);
    addToTotal(logData);
  });
  let tableBody = document.querySelector("#" + table_id + " tbody");
  tableBody.innerHTML = rowsHTML;

  //Add event listeners to the edit and delete buttons
  addEditButtonsClickEvent();
  addNoteButtonsClickEvent();
  $(`#${table_id}`).DataTable();
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
      let form_id = "edit-meal-log-form";
      //Get log date in format yyyy-mm-dd from date picker
      logUpdate.logDate = $("#date-picker").val();
      
      //Only get the time part in logTime (excluding AM/PM in hh:mm AM/PM format)
      logUpdate.logTime = logUpdate.logDate + " "+ logUpdate.logTime.split(" ")[0];
      document
        .getElementById(form_id)
        .addEventListener("submit", function (event) {
          event.preventDefault();
          console.log(logUpdate);
          let formParams = {
            mealLog: JSON.stringify(logUpdate),
            _method: "PUT"
          };
          console.log(formParams);
          post("/CICOHealth/user/meal-logs", formParams);
        });
    });
  });
}
function fillEditForm(logData) {
  let bodyHTML = "";
  let totalMealNutrition = {
    protein: 0,
    fat: 0,
    carbs: 0,
    calories: 0,
  };
  logData.foods.forEach((food) => {
    //Calculate the nutrition values for the food item
    totalMealNutrition.protein +=
      food.protein * (food.actualWeight / food.servingWeight);
    totalMealNutrition.fat +=
      food.fat * (food.actualWeight / food.servingWeight);
    totalMealNutrition.carbs +=
      food.carbs * (food.actualWeight / food.servingWeight);
    totalMealNutrition.calories +=
      food.calories * (food.actualWeight / food.servingWeight);
    //Create the html for the food item
    let htmlFood = `
        <tr>
            <td>${food.foodName}</td>
            <td>${(
              food.protein *
              (food.actualWeight / food.servingWeight)
            ).toFixed(1)}</td>
            <td>${(food.fat * (food.actualWeight / food.servingWeight)).toFixed(
              1
            )}</td>
            <td>${(
              food.carbs *
              (food.actualWeight / food.servingWeight)
            ).toFixed(1)}</td>
            <td>${(
              food.calories *
              (food.actualWeight / food.servingWeight)
            ).toFixed(0)}</td>
            <td>
                <input
                    type="number"
                    name="numMass-${food.itemID}"
                    id="txtMass-${food.itemID}"
                    class="mass"
                    value="${food.actualWeight}"
                    oninput="getFoodItem(logUpdate,'${
                      food.itemID
                    }').actualWeight = this.value; fillEditForm(logUpdate);"
                />
            </td>
            <td>
                <a href="#" class="btn-delete-pop-up"
                onclick = "removeFoodItem(logUpdate, '${
                  food.itemID 
                }'); fillEditForm(logUpdate);"
                ><i class="fa-solid fa-trash"></i
                ></a>
            </td>
        </tr>
        `;
    bodyHTML += htmlFood;
  });
  document.querySelector("#edit-table tbody").innerHTML = bodyHTML;
  document.querySelector("#edit-table tfoot").innerHTML = `
        <tr style="border: 1px solid black;">
            <td>${logData.mealLogName}</td>
            <td>${totalMealNutrition.protein.toFixed(1)}</td>
            <td>${totalMealNutrition.fat.toFixed(1)}</td>
            <td>${totalMealNutrition.carbs.toFixed(1)}</td>
            <td>${totalMealNutrition.calories.toFixed(0)}</td>
            <td></td>
            <td></td>
        </tr>
    `;
}
function removeFoodItem(mealLog, itemID) {
  let index = mealLog.foods.findIndex((food) => food.itemID == itemID);
  mealLog.foods.splice(index, 1);
}
function getFoodItem(mealLog, itemID) {
  let food = mealLog.foods.find((food) => food.itemID == itemID);
  return food;
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

function addToTotal(logData) {
  total.protein += logData.nutrition[0];
  total.fat += logData.nutrition[1];
  total.carbs += logData.nutrition[2];
  total.calories += logData.nutrition[3];
}
function getRowHTML(count, logData) {
  return `
    <tr>
        <td>${count}</td>
        <td>${logData.logTime}</td>
        <td>${logData.mealLogName}</td>
        <td>${logData.nutrition[0].toFixed(1)}</td>
        <td>${logData.nutrition[1].toFixed(1)}</td>
        <td>${logData.nutrition[2].toFixed(1)}</td>
        <td>${logData.nutrition[3].toFixed(0)}</td>
        <td>
            <a href="#" class="btn-note-pop-up" data-logid = "${
              logData.mealLogID
            }"><i class="fa-solid fa-note-sticky"></i></a>
        </td>
        <td>
            <a href="#" class="btn-edit-pop-up" data-logid = "${
              logData.mealLogID
            }"><i class="fa-solid fa-pen-to-square"></i></a>/
            <form action="/CICOHealth/user/meal-logs" method="POST" style="display: inline-block;" id="formDelete">
                <input type="hidden" name="_method" value="delete">
                <input type="hidden" name="mealLogID" value="${logData.mealLogID}">
                <button style="border:0; background-color:transparent; color:red;" type="submit" class="btn-delete-pop-up" onclick="confirmDelete()"><i style = "font-size:20;" class="fa-solid fa-trash" id="btnDelete"></i></button>
            </form>
        </td>
    </tr>
    `;
}

//Get date picker data
function getDatePickerData() {
  //Get the date value from the date picker
  //Use Jquery to get in the format of yyyy-mm-dd
  let date = $("#date-picker").val();
  //Send a synchronous GET request to the server
  let response = $.ajax({
    url: "/CICOHealth/user/meal-logs/data?date=" + date,
    async: false
  }).responseText;
  let data = JSON.parse(response);
  return data.logs;
}
//Set the date picker value to today in format yyyy-mm-dd
$(document).ready(function () {
  //Set date to today
  date_picker.value = new Date().toISOString().slice(0, 10);
  date_picker.dispatchEvent(new Event("input"));
});

document.querySelectorAll('a[name="btn-cancel"]').forEach((button) => {
  console.log(button);
  button.addEventListener("click", function (event) {
    let overlay = document.querySelector(".pop-up.active .overlay");
    //Invoke click event on the overlay to close the pop up
    overlay.click();
  });
});


function confirmDelete(event){
    if(confirm("Are you sure you want to delete this meal log?")){
         event.preventDefault();
        document.getElementById("formDelete").submit();
    }else{
        event.preventDefault();
        alert("Oke vay thoi!");
    }
}