const faqs = document.querySelectorAll('.faq')

const buttons = document.querySelectorAll('.faq .faq-toggle')

faqs.forEach(faq => {
    faq.addEventListener('click', () => {
        if (!faq.classList.contains('active')) {
            window.location = `#${faq.id}`
        }
        faq.classList.toggle('active')
    })
})


// pop-up 
const questionButtons = document.querySelectorAll('.btn-question-pop-up');
const editButtons = document.querySelectorAll('.btn-edit');
const answerButtons = document.querySelectorAll('.btn-answer');



questionButtons.forEach(button => {
    button.addEventListener('click', () => {
        displayPopUp("question-pop-up");
    });
});

editButtons.forEach(button => {
    button.addEventListener('click', () => {
        displayPopUp("edit-pop-up");
    });
});

answerButtons.forEach(button => {
    button.addEventListener('click', () => {
        displayPopUp("answer-pop-up");
    });
});
