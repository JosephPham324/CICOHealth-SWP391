//import {
//  fetchData,
//} from "../modules/statistics.js";
//
//
//
////Start date picker
//const startDate = document.getElementById("start-date");
////End date picker
//const endDate = document.getElementById("end-date");
//
//
//
////Take both dates
//async function fetchDate() {
//  const startDate = document.getElementById("start-date").value;
//  const endDate = document.getElementById("end-date").value;
//  let data = await fetchData("health-info", startDate, endDate);
//  //Log the data after analyzing it with functions from statistics.js
//  return await data;
//}
//
//
////Add event listener to both date pickers
//startDate.addEventListener("change", displayData);
//endDate.addEventListener("change", displayData);
////Initialize end date to today
//endDate.value = new Date().toISOString().substr(0, 10);
////Initialize start date to 30 days ago
//startDate.value = new Date(new Date().setDate(new Date().getDate() - 30))
//  .toISOString()
//  .substr(0, 10);
////Fetch data on page load
//displayData();
//
//
//const uri = "http://localhost:8080/CICOHealth/user/statistics/healthinfo/data";
//let data = "";
//
//async function fetchData() {
//    try {
//        const response = await fetch(uri);
//        if (!response.ok) {
//            throw new Error("Failed to retrieve data from the URI");
//        }
//        const jsonData = await response.json();
//        data = jsonData;
//        handleData(data);
//        displayTotalChart();
//    } catch (error) {
//        console.error(error);
//    }
//}
//
//function handleData(data) {
//    console.log(data);
//}
//
//function displayTotalChart() {
//    if (!data) {
//        console.log("Data is not yet available.");
//        return;
//    }
//    const dates = Object.keys(data);
//    const values = Object.values(data);
//    const chart = new Chart(document.getElementById("statistics-chart"), {
//        type: "line",
//        data: {
//            labels: dates,
//            datasets: [{
//                    label: "Calorie",
//                    data: values,
//                    fill: false,
//                    borderColor: "rgb(75, 192, 192)",
//                    backgroundColor: "rgba(75, 192, 192, 0.2)",
//                    tension: 0.1
//                }]
//        },
//        options: {}
//    });
//}
//
//fetchData();
//
//


import { fetchData } from "../modules/statistics.js";

//Start date picker
const startDate = document.getElementById("start-date");
//End date picker
const endDate = document.getElementById("end-date");
let displayedChart;

//Take both dates
async function fetchDate() {
  const startDateValue = document.getElementById("start-date").value;
  const endDateValue = document.getElementById("end-date").value;
  let data = await fetchData("health-info", startDateValue, endDateValue);
  //Log the data after analyzing it with functions from statistics.js
  return data;
}
//Add event listener to both date pickers
startDate.addEventListener("change", displayData);
endDate.addEventListener("change", displayData);
//Initialize end date to today
endDate.value = new Date().toISOString().substr(0, 10);
//Initialize start date to 30 days ago
startDate.value = new Date(new Date().setDate(new Date().getDate() - 30))
        .toISOString()
        .substr(0, 10);
//Fetch data on page load
displayData();

let displayDataTypes = {
  chart: ["Calories", "Height", "Weight", "TDDE", "Protein", "Fat", "Carb"]
};

//Add event listener to display type selector
document.getElementById("display-type").addEventListener("change", (e) => {
  let displayType = e.target.value;
  let dataTypes = displayDataTypes[displayType];
  let dataTypeSelector = document.getElementById("data");
  dataTypeSelector.innerHTML = "";
  //Add options to data type selector
  for (let dataType of dataTypes) {
    let option = document.createElement("option");
    option.value = dataType;
    option.innerHTML = dataType;
    dataTypeSelector.appendChild(option);
  }
  document.querySelector(".statistics-table").style.display = "none";
  document.querySelector(".statistics-chart").style.display = "block";
  displayData();
});
//Add event listener to data type selector
document.getElementById("data").addEventListener("change", displayData);

//Invoke change event to initialize data type selector
document.getElementById("display-type").dispatchEvent(new Event("change"));

//Function to handle data display
async function displayData() {
  let displayType = document.getElementById("display-type").value;
  let dataType = document.getElementById("data").value;
  //fetch data
  let data = await fetchDate();
  console.log(data);
  let chart = document.getElementById("statistics-chart");
  switch (dataType) {
    case "Calories": 
     displayedChart = displayCalorieChart(data);
      break;
  case "1":
      break;
  case "2":
      break;
  default:
      break;
  }
}


function displayCalorieChart(data) {
    if (displayedChart) {
        displayedChart.destroy();
    }
    const dates = Object.keys(data);
    const values = Object.values(data);
    const chart = new Chart(document.getElementById("statistics-chart"), {
        type: "line",
        data: {
            labels: dates,
            datasets: [{
                    label: "Calorie",
                    data: values,
                    fill: false,
                    borderColor: "rgb(75, 192, 192)",
                    backgroundColor: "rgba(75, 192, 192, 0.2)",
                    tension: 0.1
                }]
        },
        options: {}
    })
};



function displayMacronutrientsChart(analyzedData, chartElement) {
  // Separate the macronutrient data
  const proteinData = analyzedData.map((obj) => obj.proteinConsumed);
  const fatData = analyzedData.map((obj) => obj.fatConsumed);
  const carbsData = analyzedData.map((obj) => obj.carbsConsumed);
  const dateLabels = analyzedData.map((obj) => obj.date);

  // Create the chart using Chart.js
  const ctx = chartElement.getContext("2d");
  if (displayedChart) displayedChart.destroy();
  const chart = new Chart(ctx, {
    type: "line",
    data: {
      labels: dateLabels,
      datasets: [
        {
          label: "Protein",
          data: proteinData,
          borderColor: "rgba(255, 99, 132, 1)",
          backgroundColor: "rgba(255, 99, 132, 0.2)",
          borderWidth: 1,
          fill: true,
        },
        {
          label: "Fat",
          data: fatData,
          borderColor: "rgba(54, 162, 235, 1)",
          backgroundColor: "rgba(54, 162, 235, 0.2)",
          borderWidth: 1,
          fill: true,
        },
        {
          label: "Carbs",
          data: carbsData,
          borderColor: "rgba(255, 206, 86, 1)",
          backgroundColor: "rgba(255, 206, 86, 0.2)",
          borderWidth: 1,
          fill: true,
        },
      ],
    },
    options: {
      scales: {
        x: {
          title: {
            display: true,
            text: "Date",
          },
        },
        y: {
          stacked: true,
          title: {
            display: true,
            text: "Grams",
          },
        },
      },
      interaction: {
        mode: "nearest",
        axis: "x",
        intersect: false,
      },
      responsive: true,
      plugins: {
        title: {
          display: true,
          text: "Macronutrients consumption trends",
        },
        tooltip: {
          mode: "index",
        },
      },
    },
  });
  return chart;
}
























//
//
//
//import {
//fetchData
//} from "../modules/statistics.js";
//// const statistics = new Statistics();
////Start date picker
//const startDate = document.getElementById("start-date");
////End date picker
//const endDate = document.getElementById("end-date");
//let displayedChart;
//
////Take both dates
//async function fetchDate() {
//    const startDate = document.getElementById("start-date").value;
//    const endDate = document.getElementById("end-date").value;
//    let data = await fetchData("health-info", startDate, endDate);
//    //Log the data after analyzing it with functions from statistics.js
//    return await data;
//}
////Add event listener to both date pickers
//startDate.addEventListener("change", displayData);
//endDate.addEventListener("change", displayData);
////Initialize end date to today
//endDate.value = new Date().toISOString().substr(0, 10);
////Initialize start date to 30 days ago
//startDate.value = new Date(new Date().setDate(new Date().getDate() - 30))
//        .toISOString()
//        .substr(0, 10);
////Fetch data on page load
//displayData();
//
//
//let displayDataTypes = {
//    chart: ["Health Info"]
//};
//
//
//
////Add event listener to display type selector
//document.getElementById("display-type").addEventListener("change", (e) => {
//    let displayType = e.target.value;
//    let dataTypes = displayDataTypes[displayType];
//    let dataTypeSelector = document.getElementById("data");
//    dataTypeSelector.innerHTML = "";
//    //Add options to data type selector
//    for (let dataType of dataTypes) {
//        let option = document.createElement("option");
//        option.value = dataType;
//        option.innerHTML = dataType;
//        dataTypeSelector.appendChild(option);
//    }
//    document.querySelector(".statistics-table").style.display = "none";
//    document.querySelector(".statistics-chart").style.display = "block";
//    displayData();
//});
////Add event listener to data type selector
//document.getElementById("data").addEventListener("change", displayData);
//
////Invoke change event to initialize data type selector
//document.getElementById("display-type").dispatchEvent(new Event("change"));
//
//let exerciseSelect = document.createElement("select");
//exerciseSelect.id = "exercise-select";
//
//let dataTypeElement = document.getElementById("data");
//dataTypeElement.parentNode.insertBefore(
//        exerciseSelect,
//        dataTypeElement.nextSibling
//        );
//
////Hide exercise select
//exerciseSelect.style.display = "none";
//
////Function to handle data display
//async function displayData() {
//    let displayType = document.getElementById("display-type").value;
//    let dataType = document.getElementById("data").value;
//    //fetch data
//    let data = await fetchDate("health-info");
//    console.log(data);
//    let chart = document.getElementById("statistics-chart");

//    switch (dataType) {
//      case "Exercises Top Sets": {
//        let analyzedData = getDailyTopSets(data.logs);
//
//        //Clear exercise select
//        exerciseSelect.innerHTML = "";
//        //Remove all event listeners from exercise select
//        exerciseSelect = exerciseSelect.cloneNode(true);
//        console.log(exerciseSelect);
//
//        let exerciseNames = analyzedData.map(
//          (exercise) => exercise.exerciseName
//        );
//
//        //Add options to exercise select
//        for (let exerciseName of exerciseNames) {
//          let option = document.createElement("option");
//          option.value = exerciseName;
//          option.innerHTML = exerciseName;
//          exerciseSelect.appendChild(option);
//        }
//        //Show exercise select
//        exerciseSelect.style.display = "block";
//        //Append exercise select to after data type selector
//        dataTypeElement.parentNode.insertBefore(
//          exerciseSelect,
//          dataTypeElement.nextSibling
//        );
//
//        //Add event listener to exercise select
//        exerciseSelect.addEventListener("change", () => {
//          let exerciseName = exerciseSelect.value;
//          let exerciseData = analyzedData.find(
//            (exercise) => exercise.exerciseName == exerciseName
//          );
//          displayedChart = displayTopSetsChart(exerciseData, chart);
//        });
//        displayedChart = displayTopSetsChart(analyzedData[0], chart);
//        break;
//      }
//      case "Exercises Frequency": {
//        let analyzedData = calculateCardioExerciseStats(data.logs);
//        console.log(analyzedData);
//        displayedChart = displayExerciseFrequencyChart(chart, analyzedData);
//        break;
//      }
//      default:
//        displayedChart = displayExerciseFrequencyChart(chart, analyzedData);
//    }

//}



