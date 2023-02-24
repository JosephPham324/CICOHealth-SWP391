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
