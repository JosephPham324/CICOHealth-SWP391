import {
  fetchData,
  getDailyTopSets,
  countExercisesPerWeek,
  getExerciseFrequency,
  calculateResistanceExerciseStats,
} from "../modules/statistics.js";
// const statistics = new Statistics();
//Start date picker
const startDate = document.getElementById("start-date");
//End date picker
const endDate = document.getElementById("end-date");
let displayedChart;

//Take both dates
async function fetchDate() {
  const startDate = document.getElementById("start-date").value;
  const endDate = document.getElementById("end-date").value;
  let data = await fetchData("exercise/resistance", startDate, endDate);
  console.log(data);
  //Log the data after analyzing it with functions from statistics.js
  console.log(JSON.stringify(calculateResistanceExerciseStats(data.logs)));
  console.log(JSON.stringify(getDailyTopSets(data.logs)));
  console.log(JSON.stringify(countExercisesPerWeek(data.logs)));
  console.log(JSON.stringify(getExerciseFrequency(data.logs)));
  return await data;
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

//Add statistics table skeleton
let tableStructure = `
        <table>
          <thead>
          </thead>
          <tbody>
          </tbody>
        </table>
        `;
document.querySelector(".statistics-table").innerHTML = tableStructure;

//Fill statistics table
function fillStatisticsTable(analyzedData, tableType) {
  let tableBody = document.querySelector(".statistics-table tbody");
  let tableHead = document.querySelector(".statistics-table thead");
  tableHead.innerHTML = "";
  switch (tableType) {
    case "Exercise Summary":
    default:
      tableHead.innerHTML = `
            <tr>
                <th>No.</th>
                <th>Exercise Name</th>
                <th>Exercise Frequency</th>
                <th>Total Sets</th>
                <th>Total Reps</th>
                <th>Total Weight</th>
                <th>Max Weight</th>
                <th>Average Weight</th>
                <th>Average Reps</th>
            </tr>
            `;
      break;
  }
  tableBody.innerHTML = "";
  let i = 0;
  for (const exerciseName in analyzedData) {
    let row = document.createElement("tr");
    let record = analyzedData[exerciseName];
    console.log(exerciseName)
    console.log(record)
    let HTML = `
            <td>${++i}</td>
            <td>${exerciseName}</td>
            <td>${record.frequency}</td>
            <td>${record.totalSets}</td>
            <td>${record.totalReps}</td>
            <td>${record.totalWeight}</td>
            <td>${record.maxWeight}</td>
            <td>${record.averageWeight.toFixed(1)}</td>
            <td>${record.averageReps.toFixed(0)}</td>
            `;
    row.innerHTML = HTML;
    tableBody.appendChild(row);
  }
}

let displayDataTypes = {
  table: ["Exercise Summary"],
  chart: ["Macronutrients", "Calories"],
};

//Add event listener to display type selector
document.getElementById("display-type").addEventListener("change", (e) => {
  let displayType = e.target.value;
  let dataTypes = displayDataTypes[displayType];
  let dataTypeSelector = document.getElementById("data");
  dataTypeSelector.innerHTML = "";
  for (let dataType of dataTypes) {
    let option = document.createElement("option");
    option.value = dataType;
    option.innerHTML = dataType;
    dataTypeSelector.appendChild(option);
  }
  if (displayType == "table") {
    document.querySelector(".statistics-table").style.display = "block";
    document.querySelector(".statistics-chart").style.display = "none";
  } else {
    document.querySelector(".statistics-table").style.display = "none";
    document.querySelector(".statistics-chart").style.display = "block";
  }
  // displayData();
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
  let data = await fetchDate("nutrition");
  if (displayType == "table") {
    let analyzedData = calculateResistanceExerciseStats(data.logs);
    // A switch statement that is checking the value of dataType and then calling the appropriate
    switch (dataType) {
      case "Exercise Summary":
      default:
        fillStatisticsTable(analyzedData, dataType);
        break;
    }
  } else if (displayType == "chart") {
    /* A switch statement that is checking the value of dataType and then calling the appropriate
    function. */
    // let chart = document.getElementById("statistics-chart");
    // switch (dataType) {
    //   case "Macronutrients":
    //     displayedChart = displayMacronutrientsChart(analyzedData, chart);
    //     break;
    //   case "Calories":
    //     displayedChart = displayCaloriesChart(analyzedData, chart);
    //     break;
    //   default:
    //     displayedChart = displayCaloriesChart(analyzedData, chart);
    // }
  }
}

//----------------------------------------------------------------------------------------------
//Chart display

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
        y: {
          stacked: true,
        },
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

function displayCaloriesChart(analyzedData, chartElement) {
  // Separate the data
  const caloriesBurntData = analyzedData.map((obj) => obj.caloriesBurnt);
  const caloriesConsumedData = analyzedData.map((obj) => obj.caloriesConsumed);
  const netCaloriesData = analyzedData.map((obj) => obj.netCalories);
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
          label: "Calories Burnt",
          data: caloriesBurntData,
          borderColor: "rgba(54, 162, 235, 1)",
          backgroundColor: "rgba(54, 162, 235, 0.2)",
          borderWidth: 1,
          fill: true,
        },
        {
          label: "Calories Consumed",
          data: caloriesConsumedData,
          borderColor: "rgba(255, 99, 132, 1)",
          backgroundColor: "rgba(255, 99, 132, 0.2)",
          borderWidth: 1,
          fill: true,
        },
        {
          label: "Net Calories",
          data: netCaloriesData,
          borderColor: "rgba(255, 206, 86, 1)",
          backgroundColor: "rgba(255, 206, 86, 0.2)",
          borderWidth: 1,
          fill: true,
        },
      ],
    },
    options: {
      plugins: {
        title: {
          display: true,
          text: "Calories consumption and expenditure trends",
        },
        tooltip: {
          mode: "index",
        },
      },
      scales: {
        y: {
          stacked: false,
        },
      },
      responsive: true,
    },
  });
  return chart;
}