const togglePassword = document.querySelector('#togglePassword');
const password = document.querySelector('#id_password');
function eyeToggle() {
    // toggle the type attribute
    const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
    password.setAttribute('type', type);
    // toggle the eye slash icon
    this.classList.toggle('fa-eye-slash');
}