import {
  fetchData,
  getDailyTopSets,
  // countExercisesPerWeek,
  getExerciseFrequency,
  calculateResistanceExerciseStats,
  calculateCardioExerciseStats,
  findBestSet,
  // calculate1RM,
  calculateRepRange,
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
        <table id="stats-table">
          <thead>
          </thead>
          <tbody>
          </tbody>
        </table>
        `;
document.querySelector(".statistics-table").innerHTML = tableStructure;

//Fill statistics table
function fillStatisticsTable(analyzedData, tableType) {
  //If table has datatable
  if ($.fn.dataTable.isDataTable("#stats-table")) {
    $("#stats-table").DataTable().destroy();
  }

  let tableBody = document.querySelector(".statistics-table tbody");
  let tableHead = document.querySelector(".statistics-table thead");
  tableHead.innerHTML = "";
  switch (tableType) {
    case "Weight Recommendation":
      tableHead.innerHTML = `
            <tr>
                <th>Repetition(s)</th>
                <th>Weight Recommendation</th>
            </tr>          
            `
      tableBody.innerHTML = "";
      let selectedExerciseName = exerciseSelect.value;
      console.log(selectedExerciseName)
      console.log(analyzedData)
      let exercise = analyzedData.find((exercise) => exercise.exerciseName === selectedExerciseName);
      console.log(exercise)
      let bestSet = findBestSet(exercise.topSets);
      let repRange = calculateRepRange(bestSet.weight, bestSet.rep);
      for (let i in repRange) {
        let row = document.createElement("tr");
        let HTML = `
                      <td>${i}</td>
                      <td>${repRange[i].toFixed(1)}</td>
                      `;
        row.innerHTML = HTML;
        tableBody.appendChild(row);
      }
      break;
    case "Summary":
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
      break;
  }
  $("#stats-table").DataTable();
}

let displayDataTypes = {
  table: ["Summary", "Weight Recommendation"],
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

let exerciseSelect = document.createElement("select");
exerciseSelect.id = "exercise-select";
exerciseSelect.classList.add("exercise-select");

let dataTypeElement = document.getElementById("data");
dataTypeElement.parentNode.insertBefore(
  exerciseSelect,
  dataTypeElement.nextSibling
);

//Hide exercise select
exerciseSelect.style.display = "none";

//Function to handle data display
async function displayData() {
  let displayType = document.getElementById("display-type").value;
  let dataType = document.getElementById("data").value;
  //fetch data
  let data = await fetchDate("nutrition");
  //Hide exercise select if not Weight Recommendation and Top Sets
  if (
    dataType !== "Weight Recommendation" &&
    dataType !== "Exercises Top Sets"
  ) {
    exerciseSelect.style.display = "none";
  }

  if (displayType == "table") {
    let analyzedData = calculateResistanceExerciseStats(data.logs);
    // A switch statement that is checking the value of dataType and then calling the appropriate
    switch (dataType) {
      case "Weight Recommendation":
        analyzedData = getDailyTopSets(data.logs);
        //Clear exercise select
        addExerciseOptions(analyzedData);
        exerciseSelect.addEventListener("change", () => {
          displayedChart = fillStatisticsTable(analyzedData, dataType);
        });
        fillStatisticsTable(analyzedData, dataType)
        break;
      case "Summary":
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

        addExerciseOptions(analyzedData);

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
        let analyzedData = calculateCardioExerciseStats(data.logs);
        console.log(analyzedData);
        displayedChart = displayExerciseFrequencyChart(chart, analyzedData);
        break;
      }
      default:
        displayedChart = displayExerciseFrequencyChart(chart, analyzedData);
    }
  }
}

function addExerciseOptions(analyzedData) {
  exerciseSelect.innerHTML = "";
  let newExerciseSelect = exerciseSelect.cloneNode(true);
  //Remove current exercise select
  exerciseSelect.parentNode.removeChild(exerciseSelect);
  //Set exercise select to new exercise select
  exerciseSelect = newExerciseSelect;

  let exerciseNames = analyzedData.map((exercise) => exercise.exerciseName);

  //Add options to exercise select
  for (let exerciseName of exerciseNames) {
    let option = document.createElement("option");
    option.value = exerciseName;
    option.innerHTML = exerciseName;
    exerciseSelect.appendChild(option);
  }

  //Show exercise select
  exerciseSelect.style.display = "block";
  //Append exercise select to after data type selector
  dataTypeElement.parentNode.insertBefore(
    exerciseSelect,
    dataTypeElement.nextSibling
  );
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

  //Sort the data by date
  exerciseData.topSets.sort((a, b) => {
    return new Date(a.date) - new Date(b.date);
  });

  // Extract the data for the scatter plot

  let labels = exerciseData.topSets.map((set) => set.date);
  let dataWeight = exerciseData.topSets.map((set) => set.weight);
  let dataReps = exerciseData.topSets.map((set) => set.rep);
  console.log(exerciseData);
  let data = {
    labels: labels,
    datasets: [
      {
        label: "Weight",
        data: dataWeight,
        borderColor: "rgb(255, 99, 132)",
        backgroundColor: "rgba(255, 99, 132, 0.5)",
        yAxisID: "y-axis-1",
      },
      {
        label: "Repetitions",
        type: "line",
        fill: true,
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
          },
        },
        "y-axis-1": {
          title: {
            display: true,
            text: "Weight",
            ticks: {
              beginAtZero: true,
              stepSize: 1,
            },
          },
        },
        "y-axis-2": {
          title: {
            display: true,
            text: "Repetitions",
            ticks: {
              beginAtZero: true,
              stepSize: 1,
            },
          },
        },
      },
    },
  });
  return chart;
}

function displayExerciseFrequencyChart(canvas, data) {
  //Check if chart already exists
  if (displayedChart) {
    displayedChart.destroy();
  }
  console.log(data);
  const exerciseNames = data.map((exercise) => exercise.exerciseName);
  const exerciseFrequencies = {};

  exerciseNames.forEach((name) => {
    exerciseFrequencies[name] = data.find(
      (exercise) => exercise.exerciseName === name
    ).frequency;
  });

  const chartData = {
    labels: Object.keys(exerciseFrequencies),
    datasets: [
      {
        label: "Exercise Frequencies",
        data: Object.values(exerciseFrequencies),
        backgroundColor: "rgba(54, 162, 235, 0.5)",
        borderColor: "rgba(54, 162, 235, 1)",
        borderWidth: 1,
      },
    ],
  };

  const chartOptions = {
    plugins: {
      title: {
        display: true,
        text: "Exercise Frequencies",
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
      y: {
        title: {
          display: true,
          text: "Frequency",
        },
        ticks: {
          stepSize: 1,
        },
      },
      x: {
        title: {
          display: true,
          text: "Exercise Name",
        },
      },
    },
  };

  const chartConfig = {
    type: "bar",
    data: chartData,
    options: chartOptions,
  };
  const ctx = canvas.getContext("2d");
  const chart = new Chart(ctx, chartConfig);
  return chart;
}
