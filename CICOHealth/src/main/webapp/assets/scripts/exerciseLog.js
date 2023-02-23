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
// const editOverlay = document.querySelector('.edit-overlay');
// const noteOverlay = document.querySelector('.note-overlay');
const editPopUp = document.querySelector('.edit-pop-up');
const notePopUp = document.querySelector('.note-pop-up');

editButtons.forEach(button => {
    button.addEventListener('click', () => {
        editPopUp.style.display = 'block';
    });
});

noteButtons.forEach(button => {
    button.addEventListener('click', () => {
        notePopUp.style.display = 'block';
    });
});

cancelButton.forEach(button => {
    button.addEventListener('click', () => {
        notePopUp.style.display = 'none';
        editPopUp.style.display = 'none';
    });
});