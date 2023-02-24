//Display pop-ups
function displayPopUp(id) {
  let popUp = document.getElementById(id);
  let overlay = document.querySelector(`#${id} .overlay`);
  popUp.classList.add("active");
  document.body.classList.add("no-scroll");
  overlay.addEventListener("click", function (e) {
    popUp.classList.remove("active");
    document.body.classList.remove("no-scroll");
  });
}
