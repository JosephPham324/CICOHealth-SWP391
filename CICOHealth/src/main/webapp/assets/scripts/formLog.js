$(document).ready(function () {
    $('#example').DataTable();
});

const datePicker = document.getElementById("date-picker");

datePicker.addEventListener("change", function () {
    const selectedDate = new Date(datePicker.value);
    console.log(selectedDate);
});


// pop-up 
// const cancelButton = document.querySelectorAll("#btn-cancel");
const editButtons = document.querySelectorAll('.btn-edit-pop-up');
const noteButtons = document.querySelectorAll('.btn-note-pop-up');
// const editPopUp = document.getElementById('edit-pop-up');
// const notePopUp = document.getElementById('note-pop-up');

editButtons.forEach(button => {
    button.addEventListener('click', () => {
        // editPopUp.style.display = 'block';
        displayPopUp("edit-pop-up");
    });
});

noteButtons.forEach(button => {
    button.addEventListener('click', () => {
        // notePopUp.style.display = 'block';
        displayPopUp("note-pop-up");
    });
});
