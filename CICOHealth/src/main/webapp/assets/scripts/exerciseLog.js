$(document).ready(function () {
    $('#example').DataTable();
});

const datePicker = document.getElementById("date-picker");

datePicker.addEventListener("change", function () {
    const selectedDate = new Date(datePicker.value);
    console.log(selectedDate);
});


// pop-up 
const cancelButton = document.querySelectorAll("#btn-cancel");
const editButtons = document.querySelectorAll('.btn-edit-pop-up');
const noteButtons = document.querySelectorAll('.btn-note-pop-up');
const editOverlay = document.querySelector('.edit-overlay');
const noteOverlay = document.querySelector('.note-overlay');


editButtons.forEach(button => {
    button.addEventListener('click', () => {
        editOverlay.style.display = 'block';
    });
});

noteButtons.forEach(button => {
    button.addEventListener('click', () => {
        noteOverlay.style.display = 'block';
    });
});

cancelButton.forEach(button => {
    button.addEventListener('click', () => {
        noteOverlay.style.display = 'none';
        editOverlay.style.display = 'none';
    });
});