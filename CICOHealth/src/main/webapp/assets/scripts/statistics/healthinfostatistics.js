const uri = "http://localhost:8080/CICOHealth/user/statistics/healthinfo/data";
let data = "";

async function fetchData() {
    try {
        const response = await fetch(uri);
        if (!response.ok) {
            throw new Error("Failed to retrieve data from the URI");
        }
        const jsonData = await response.json();
        data = jsonData;
        handleData(data);
        displayTotalChart();
    } catch (error) {
        console.error(error);
    }
}

function handleData(data) {
    console.log(data);
}

function displayTotalChart() {
    if (!data) {
        console.log("Data is not yet available.");
        return;
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
    });
}

fetchData();
