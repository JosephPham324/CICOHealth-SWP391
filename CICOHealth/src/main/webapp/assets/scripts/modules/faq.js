function editAnswerButtons() {
    const editButtons = document.querySelectorAll('.btn-edit');
    editButtons.forEach(button => {
        button.addEventListener('click', () => {
            displayPopUp("edit-pop-up");
        });
    });
}

function createAnswerButtons() {
    const answerButtons = document.querySelectorAll('.btn-answer');
    answerButtons.forEach(button => {
        button.addEventListener('click', () => {
            displayPopUp("answer-pop-up");
        });
    });
}

function newQuestionFormPopUp() {
    const questionButtons = document.querySelectorAll('.btn-question-pop-up');
    questionButtons.forEach(button => {
        button.addEventListener('click', () => {
            displayPopUp("question-pop-up");
        });
    });
}

function collapseFAQ() {
    const faqs = document.querySelectorAll('.faq');
    faqs.forEach(faq => {
        faq.addEventListener('click', () => {
            if (!faq.classList.contains('active')) {
                window.location = `#${faq.id}`;
            }
            faq.classList.toggle('active');
        });
    });
}

//Export all functions
export { collapseFAQ, newQuestionFormPopUp, editAnswerButtons, createAnswerButtons };