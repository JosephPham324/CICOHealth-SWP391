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
  //Log the data after analyzing it with functions from statistics.js
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
  chart: ["Exercises Top Sets", "Exercises Frequency"],
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
    let chart = document.getElementById("statistics-chart");
    switch (dataType) {
      case "Exercises Top Sets": {
        let analyzedData = getDailyTopSets(data.logs);
        let exerciseSelect = document.createElement("select");
        exerciseSelect.id = "exercise-select";
        let exerciseNames = analyzedData.map(
          (exercise) => exercise.exerciseName
        );
        for (let exerciseName of exerciseNames) {
          let option = document.createElement("option");
          option.value = exerciseName;
          option.innerHTML = exerciseName;
          exerciseSelect.appendChild(option);
        }
        //Append exercise select after datatype selector
        let dataTypeElement = document.getElementById("data");
        dataTypeElement.parentNode.insertBefore(
          exerciseSelect,
          dataTypeElement.nextSibling
        );
        //Add event listener to exercise select
        exerciseSelect.addEventListener("change", () => {
          let exerciseName = exerciseSelect.value;
          let exerciseData = analyzedData.find(
            (exercise) => exercise.exerciseName == exerciseName
          );
          displayedChart = displayTopSetsChart(exerciseData, chart);
        });
        displayedChart = displayTopSetsChart(analyzedData[0], chart);
        break;
      }
      case "Exercises Frequency": {
        let analyzedData = countExercisesPerWeek(data.logs);
        console.log(analyzedData);
        // displayedChart = displayCaloriesChart(analyzedData, chart);
        break;
      }
      default:
      // displayedChart = displayCaloriesChart(analyzedData, chart);
    }
  }
}

//----------------------------------------------------------------------------------------------
//Chart display
function displayTopSetsChart(exerciseData, canvas) {
  // Check if chart already exists
  if (displayedChart) {
    displayedChart.destroy();
  }
  //Context
  var ctx = canvas.getContext("2d");

  // Extract the data for the scatter plot

  let labels = exerciseData.topSets.map((set) => set.date);
  let dataWeight = exerciseData.topSets.map((set) => set.weight);
  let dataReps = exerciseData.topSets.map((set) => set.rep);
  console.log(exerciseData)
  let data = {
    labels: labels,
    datasets: [
      {
        label: "Weight",
        data: dataWeight,
        borderColor: "rgb(255, 99, 132)",
        backgroundColor: "rgba(255, 99, 132, 0.5)",
      },
      {
        label: "Repetitions",
        type:"line",
        fill:true,
        data: dataReps,
        borderColor: "rgb(54, 162, 235)",
        backgroundColor: "rgba(54, 162, 235, 0.5)",
        yAxisID: "y-axis-2",
      },
    ],
  };
  let chart = new Chart(ctx, {
    type: "bar",
    data: data,
    options: {
      plugins: {
        title: {
          display: true,
          text: exerciseData.exerciseName + " Top Sets",
        },
        tooltip: {
          mode: "index",
        },
      },
      interaction: {
        mode: "nearest",
        axis: "x",
        intersect: false,
      },
      scales: {
        x: {
          title: {
            display: true,
            text: "Date",
          }
        },
      },
    },
  });
  return chart;
}
