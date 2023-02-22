$(document).ready(function () {
    $('#example').DataTable();
});

const datePicker = document.getElementById("date-picker");

datePicker.addEventListener("change", function () {
    const selectedDate = new Date(datePicker.value);
    console.log(selectedDate);
});
