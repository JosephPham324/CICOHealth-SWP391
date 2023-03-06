import {
  fetchData,
  calculateCardioExerciseStats,
  calculateDailyCardioStats,
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
  let data = await fetchData("exercise/cardio", startDate, endDate);
  //   console.log(JSON.stringify(data));
  console.log(JSON.stringify(calculateDailyCardioStats(data.logs)));
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
            <tr>
              <th>No.</th>
              <th>Date</th>
              <th>Protein Consumed</th>
              <th>Fat Consumed</th>
              <th>Carbs Consumed</th>
              <th>Calories Consumed</th>
              <th>Calories Burnt</th>
              <th>Net Calories</th>
            </tr>
          </thead>
          <tbody>
          </tbody>
        </table>
        `;
document.querySelector(".statistics-table").innerHTML = tableStructure;

function fillStatisticsTable(tableType, analyzedNutritionData) {
  let tableBody = document.querySelector(".statistics-table tbody");
  let tableHead = document.querySelector(".statistics-table thead");
  tableHead.innerHTML = "";
  switch (tableType) {
    case "Exercises":
    default:
      tableHead.innerHTML = `
            <tr>
                <th>No.</th>
                <th>Exercise Name</th>
                <th>Total Time Spent (mins)</th>
                <th>Total Calories Burnt</th>
                <th>Frequency</th>
                <th>Max Time Spent (mins)</th>
                <th>Max Calories Burnt</th>
                <th>Average Time Spent (mins)</th>
                <th>Average Calories Burnt</th>
            </tr>
            `;
      break;
  }
  tableBody.innerHTML = "";
  for (let i in analyzedNutritionData) {
    let row = document.createElement("tr");
    let record = analyzedNutritionData[i];
    let HTML = `
            <td>${parseInt(i) + 1}</td>
            <td>${record.exerciseName}</td>
            <td>${record.frequency}</td>
            <td>${record.totalTimeSpent}</td>
            <td>${record.totalKcalBurnt}</td>
            <td>${record.maxTimeSpent}</td>
            <td>${record.maxKcalBurnt}</td>
            <td>${record.averageTimeSpent}</td>
            <td>${record.averageKcalBurnt}</td>
            `;
    row.innerHTML = HTML;
    tableBody.appendChild(row);
  }
}

let displayDataTypes = {
  table: ["Exercises"],
  chart: ["Calories and time", "Exercise"],
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
  //Show/hide table/chart
  if (displayType == "table") {
    document.querySelector(".statistics-table").style.display = "block";
    document.querySelector(".statistics-chart").style.display = "none";
  } else {
    document.querySelector(".statistics-table").style.display = "none";
    document.querySelector(".statistics-chart").style.display = "block";
  }
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
  let data = await fetchDate("nutrition");
  if (displayType == "table") {
    let analyzedData = await calculateCardioExerciseStats(data.logs);
    fillStatisticsTable(dataType, analyzedData);
  } else if (displayType == "chart") {
    let chart = document.getElementById("statistics-chart");
    let analyzedData = await calculateDailyCardioStats(data.logs);
    switch (dataType) {
      default:
        displayedChart = displayExerciseChart(chart, analyzedData);
    }
  }
}

//----------------------------------------------------------------------------------------------
//Chart display

function displayExerciseChart(chart, data) {
  //Check if chart already exists
  if (displayedChart) {
    displayedChart.destroy();
  }

  const ctx = chart.getContext("2d");

  // Extract data for stacked bar chart
  const timeSpentData = [];
  const exerciseLabels = [];
  const exerciseData = [];

  for (const date in data) {
    const { timeSpent, exerciseObjects } = data[date];
    timeSpentData.push(timeSpent);

    exerciseObjects.forEach((exercise) => {
      const { exerciseName, timeSpent } = exercise;
      if (!exerciseLabels.includes(exerciseName)) {
        exerciseLabels.push(exerciseName);
        exerciseData.push([]);
      }

      const index = exerciseLabels.indexOf(exerciseName);
      exerciseData[index].push(timeSpent);
    });
  }

  // Extract data for stacked line chart
  const caloriesBurntData = [];
  const dateLabels = [];

  for (const date in data) {
    const { caloriesBurnt } = data[date];
    caloriesBurntData.push(caloriesBurnt);
    dateLabels.push(date);
  }

  // Create combined chart
  const combinedChart = new Chart(ctx, {
    type: "bar",
    data: {
      labels: dateLabels,
      datasets: [
        {
          label: "Time Spent",
          data: timeSpentData,
          backgroundColor: "rgba(54, 162, 235, 0.5)",
          borderColor: "rgba(54, 162, 235, 1)",
          borderWidth: 1,
        },
        {
          label: "Calories Burnt",
          data: caloriesBurntData,
          type: "line",
          backgroundColor: "rgba(255, 99, 132, 0.2)",
          borderColor: "rgba(255, 99, 132, 1)",
          borderWidth: 2,
          yAxisID: "y-axis-2",
        },
      ],
    },
    options: {
      scales: {
        yAxes: [
          {
            ticks: {
              beginAtZero: true,
            },
            scaleLabel: {
              display: true,
              labelString: "Time Spent (mins)",
            },
          },
          {
            id: "y-axis-2",
            position: "right",
            ticks: {
              beginAtZero: true,
            },
            scaleLabel: {
              display: true,
              labelString: "Calories Burnt",
            },
          },
        ],
      },
    },
  });
  return combinedChart;
}
