
// pop-up 
const createExerciseButtons = document.querySelectorAll('.btn-create-exercise-pop-up');

createExerciseButtons.forEach(button => {
    button.addEventListener('click', () => {
        displayPopUp("create-exercise-pop-up");
    });
});