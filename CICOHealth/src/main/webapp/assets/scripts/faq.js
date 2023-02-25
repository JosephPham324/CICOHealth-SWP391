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

questionButtons.forEach(button => {
    button.addEventListener('click', () => {
        // editPopUp.style.display = 'block';
        displayPopUp("question-pop-up");
    });
});
