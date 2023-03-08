//---------------------------------------------------------------------------------------------
import {
    fetchData
} from "../modules/statistics"
const startDate = document.getElementById("start-date");
const endDate = document.getElementById("end-date");

//Take both dates
async function fetchDate() {
  const startDate = document.getElementById("start-date").value;
  const endDate = document.getElementById("end-date").value;
  let data = await fetchData("exercise/cardio", startDate, endDate);
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



const hihi = JSON

const data = {"2023-03-06":1854.0,"2023-03-03":2093.7,"2023-03-02":1557.0,"2023-03-04":2556.0};

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
      tension: 0.1
    }]
  },
  options: {}
});
