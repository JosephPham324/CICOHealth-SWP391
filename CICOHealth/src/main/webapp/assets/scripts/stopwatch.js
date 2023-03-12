// Global variables
const time_el = document.querySelector('.watch .time');
const start_btn = document.getElementById('start');
const stop_btn = document.getElementById("stop");
const reset_btn = document.getElementById("reset");
const config_btn = document.getElementById("config");
const popup_form = document.querySelector(".popup-form");
const save_btn = document.getElementById("save-btn");
const cancel_btn = document.getElementById("cancel-btn");

let seconds = 0;
let interval = null;
let numSets = 1;
let setTime = 60;
let restTime = 10;
let setCounter = 0;

// Event listeners
start_btn.addEventListener('click', start);
stop_btn.addEventListener('click', stop);
reset_btn.addEventListener('click', reset);
config_btn.addEventListener('click', togglePopupForm);
save_btn.addEventListener('click', saveSettings);
cancel_btn.addEventListener('click', closePopupForm);

// Update the timer
function timer() {
	seconds++;
  
	// Format our time
	let hrs = Math.floor(seconds / 3600);
	let mins = Math.floor((seconds - (hrs * 3600)) / 60);
	let secs = seconds % 60;
  
	if (secs < 10) secs = '0' + secs;
	if (mins < 10) mins = '0' + mins;
	if (hrs < 10) hrs = '0' + hrs;
  
	time_el.innerText = `${hrs}:${mins}:${secs}`;
  
	// Check if set is complete
	if (seconds >= setTime && setCounter < numSets) {
	  clearInterval(interval);
	  interval = null;
	  seconds = 0;
	  setCounter++;
	  time_el.innerText = 'Set complete!';
  
	  // Check if workout is complete
	  if (setCounter < numSets) {
		setTimeout(() => {
		  seconds = 0;
		  time_el.innerText = 'Resting...';
		  setTimeout(() => {
			start();
		  }, restTime * 1000);
		}, 1000);
	  } else {
		setCounter = 0;
		seconds = 0;
		time_el.innerText = 'Workout complete!';
		resetSettings();
	  }
	}
}

function start () {
  if (interval) {
    return;
  }

  interval = setInterval(timer, 1000);
}

function stop () {
  clearInterval(interval);
  interval = null;
}

function reset() {
	stop();
	seconds = 0;
	time_el.innerText = "00:00:00";
	setCounter = 0;
	clearInterval(interval);
	interval = null;
	resetSettings();
}

function togglePopupForm() {
  if (popup_form.style.display === "block") {
    popup_form.style.display = "none";
  } else {
    popup_form.style.display = "block";
  }
}

function closePopupForm() {
  popup_form.style.display = "none";
}

function resetSettings() {
  numSets = 1;
  setTime = 60;
  restTime = 10;
  closePopupForm();
}

function saveSettings(event) {
  event.preventDefault();
  numSets = parseInt(document.getElementById("num-sets").value);
  setTime = parseInt(document.getElementById("set-time").value);
  restTime = parseInt(document.getElementById("rest-time").value);
  closePopupForm();
  start(); // start the timer with the new settings
}
