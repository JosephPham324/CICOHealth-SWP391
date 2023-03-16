import {
  fetchData,
  calculateNutritionStatistics,
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
  let data = await fetchData("nutrition", startDate, endDate);
  // console.log(data);
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

function fillStatisticsTable(analyzedNutritionData) {
  let tableBody = document.querySelector(".statistics-table tbody");
  tableBody.innerHTML = "";
  for (let i in analyzedNutritionData) {
    let row = document.createElement("tr");
    let record = analyzedNutritionData[i];
    let HTML = `
          <td>${parseInt(i) + 1}</td>
          <td>${record.date}</td>
          <td>${record.proteinConsumed.toFixed(1)}</td>
          <td>${record.fatConsumed.toFixed(1)}</td>
          <td>${record.carbsConsumed.toFixed(1)}</td>
          <td>${record.caloriesConsumed.toFixed(0)}</td>
          <td>${record.caloriesBurnt.toFixed(0)}</td>
          <td>${record.netCalories.toFixed(0)}</td>
          `;
    row.innerHTML = HTML;
    tableBody.appendChild(row);
  }
}

let displayDataTypes = {
  table: ["All"],
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
  let analyzedData = calculateNutritionStatistics(data);
  console.log(analyzedData)
  console.log(JSON.stringify(analyzedData));
  if (displayType == "table") {
    fillStatisticsTable(analyzedData);
  } else if (displayType == "chart") {
    let chart = document.getElementById("statistics-chart");
    switch (dataType) {
      case "Macronutrients":
        displayedChart = displayMacronutrientsChart(analyzedData, chart);
        break;
      case "Calories":
        displayedChart = displayCaloriesChart(analyzedData, chart);
        break;
      default:
        displayedChart = displayCaloriesChart(analyzedData, chart);
    }
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
        y: {
          stacked: false,
          title: {
            display: true,
            text: "Calories",
          },
        },
      },
      responsive: true,
    },
  });
  return chart
;}
