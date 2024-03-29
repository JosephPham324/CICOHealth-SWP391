import { fetchData } from "../modules/statistics.js";
//Start date picker
const startDate = document.getElementById("start-date");
//End date picker
const endDate = document.getElementById("end-date");
let displayedChart;
//Remove Table option from display-type
document
  .getElementById("display-type")
  .removeChild(document.getElementById("display-type").children[0]);

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
  chart: ["Calories", "Height", "Weight", "Macro"],
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
  //    let displayType = document.getElementById("display-type").value;
  let dataType = document.getElementById("data").value;
  //fetch data
  let data = await fetchDate();
  console.log(data);
  //    let chart = document.getElementById("statistics-chart");
  switch (dataType) {
    case "Calories":
      displayedChart = displayCalorieChart(data);
      break;
    case "Height":
      displayedChart = displayHeightChart(data);
      break;
    case "Weight":
      displayedChart = displayWeightChart(data);
      break;
    case "Macro":
      displayedChart = displayMacronutrientsChart(data);
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
  console.log(data);
  const values = Object.values(data).map((obj) => obj.avgDailyCalorie);
  const chart = new Chart(document.getElementById("statistics-chart"), {
    type: "line",
    data: {
      labels: dates,
      datasets: [
        {
          label: "Calorie",
          data: values,
          fill: false,
          borderColor: "rgb(75, 192, 192)",
          backgroundColor: "rgba(75, 192, 192, 0.2)",
          tension: 0.1,
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
                text: "Kcal",
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
              text: "Calorie Trends",
            },
            tooltip: {
              mode: "index",
            },
          },
    },
  });
  return chart;
}
function displayHeightChart(data) {
  console.log(data);

  if (displayedChart) {
    displayedChart.destroy();
  }
  const dates = Object.keys(data);
  const values = Object.values(data).map((obj) => obj.avgHeight);
  const chart = new Chart(document.getElementById("statistics-chart"), {
    type: "line",
    data: {
      labels: dates,
      datasets: [
        {
          label: "Protein",
          data: values,
          borderColor: "rgba(255, 99, 132, 1)",
          backgroundColor: "rgba(255, 99, 132, 0.2)",
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
            text: "Cm",
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
          text: "Height Trends",
        },
        tooltip: {
          mode: "index",
        },
      },
    },
  });
  return chart;
}
function displayMacronutrientsChart(data) {
  console.log(data);

  // Separate the macronutrient data
  const proteinData = Object.values(data).map((obj) => obj.avgDailyProtein);
  const fatData = Object.values(data).map((obj) => obj.avgDailyFat);
  const carbsData = Object.values(data).map((obj) => obj.avgDailyCarb);
  const dateLabels = Object.keys(data);
  if (displayedChart) displayedChart.destroy();
  const chart = new Chart(document.getElementById("statistics-chart"), {
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

function displayWeightChart(data) {
  console.log(data);

  if (displayedChart) {
    displayedChart.destroy();
  }
  const dates = Object.keys(data);
  const values = Object.values(data).map((obj) => obj.avgWeight);

  const chart = new Chart(document.getElementById("statistics-chart"), {
    type: "line",
    data: {
      labels: dates,
      datasets: [
        {
          label: "Protein",
          data: values,
          borderColor: "rgba(255, 99, 132, 1)",
          backgroundColor: "rgba(255, 99, 132, 0.2)",
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
            text: "Kilograms",
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
          text: "Weight Trends",
        },
        tooltip: {
          mode: "index",
        },
      },
    },
  });
  return chart;
}
