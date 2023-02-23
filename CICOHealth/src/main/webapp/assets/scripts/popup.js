//Display pop-ups
function displayPopUp(id) {
  let popUp = document.getElementById(id);
  let overlay = document.querySelector(`#${id} .overlay`);
  popUp.classList.add("active");
  body.classList.add("no-scroll");
  overlay.addEventListener("click", function (e) {
    popUp.classList.remove("active");
    body.classList.remove("no-scroll");
  });
}
