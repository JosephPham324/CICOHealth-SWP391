// Note: The codepen version of this timer does not have sound, as I cannot host assets. 
// Sorry.
// to-do: Mute option buttons if interval running
// combine interval functions
// Add "only works with JavaScript"
// Make options text editable

var app = angular.module("tabataApp", []);
app.controller("tabataAppCtrl", ["$scope", function($scope) {

  // 	Set default volume as on
  // $("#volume-switch").prop("checked", true);

  $scope.rounds = {
    roundsLeft: 1,
    totalRounds: 8
  };

  $scope.optionTimes = {
    timeOff: "00:10",
    timeOn: "00:20"
  };

  $scope.timerTimes = {
    breakTime: "00:10",
    workTime: "00:20"
  };

  $scope.timerStates = {
    breakRunning: false,
    workRunning: false
  };

  /* ===============================*/

  // Parse time string to integers
  function parseTime(time) {
    var time = time.split(":");
    var SECONDS = parseInt(time[1]);
    var MINUTES = parseInt(time[0]);
    return [MINUTES, SECONDS];
  }

  // Put 0 in front if digit less than 10
  function minTwoDigits(n) {
    return (n < 10 ? "0" : "") + n;
  }

  // function makeSound(currentSeconds) {
  // 	if (currentSeconds >= 2) {
  // 		var beep = new buzz.sound("dist/buzz/beep-07.mp3").play();
  // 	} else {
  // 		var endBeep = new buzz.sound("dist/buzz/beep-08b.mp3").play();
  // 	}
  // }

  // Adds or removes 1 second
  $scope.changeTime = function(currentTime, deltaTime) {
    var time = parseTime(currentTime);
    var minutes = time[0];
    var seconds = time[1];
    var newTime = "";
    // If interval is running, make sound
    // if (seconds <= 4 && minutes === 0 && $("#volume-switch").prop("checked") && ($scope.timerStates.breakRunning || $scope.timerStates.workRunning)) {
    // 	makeSound(seconds);
    // }
    if (seconds === 59 && deltaTime === "+1") {
      newTime = (minTwoDigits(minutes + 1) + ":" + "00").toString();
    } else if (minutes >= 1 && seconds === 0 && deltaTime === "-1") {
      newTime = (minTwoDigits(minutes - 1) + ":" + "59").toString();
    } else if (minutes === 0 && seconds === 0 && deltaTime === "-1") {
      newTime = (minTwoDigits(minutes) + ":" + minTwoDigits(seconds)).toString();
    } else {
      var tempTime = minTwoDigits(eval(seconds + deltaTime));
      newTime = (minTwoDigits(minutes) + ":" + tempTime).toString();
    }
    return newTime;
  };

  /* Functions to change the option numbers
  ================================================*/

  // Change the number of rounds
  $scope.changeRounds = function(currentRounds, deltaRounds) {
    if ($scope.rounds.totalRounds === 0 && deltaRounds === "-1") {
      return;
    }
    $scope.rounds.totalRounds = eval(currentRounds + deltaRounds);
  };

  // Could not find a way to pass property, so this is the hacky temporary solution
  $scope.changeTimeOff = function(currentTime, deltaTime) {
    var newTime = $scope.changeTime(currentTime, deltaTime);
    $scope.optionTimes.timeOff = newTime;
    $scope.timerTimes.breakTime = newTime;
  };

  $scope.changeTimeOn = function(currentTime, deltaTime) {
    var newTime = $scope.changeTime(currentTime, deltaTime);
    $scope.optionTimes.timeOn = newTime;
    $scope.timerTimes.workTime = newTime;
  };

  // Switch between break screen and work screen
  function switchScreens(value) {
    if (value === "toWork") {
      $("#time-left").removeClass("hidden");
      $("#break-left").addClass("hidden");
      $("#current-timer").css("background-color", "#a5d6a7");
      $scope.timerStates.workRunning = true;
    } else {
      $("#break-left").removeClass("hidden");
      $("#time-left").addClass("hidden");
      $("#current-timer").css("background-color", "#ef9a9a");
      $scope.timerStates.breakRunning = true;
    }
    $scope.startClock();
  } // End switchScreens

  // Start the timer
  $scope.startClock = function() {
    $("#pause-button").removeClass("hidden");
    $("#start-button").addClass("hidden");
    // If work is showing on click, change state
    if ($("#break-left").hasClass("hidden")) {
      $scope.timerStates.workRunning = true;
    }

    // If there is a round left
    if ($scope.rounds.roundsLeft <= $scope.rounds.totalRounds) {
      if (!$scope.timerStates.workRunning) {
        breakInterval = setInterval(function() {
          $scope.timerStates.breakRunning = true;
          var newTime = $scope.changeTime($scope.timerTimes.breakTime, "-1");
          $scope.timerTimes.breakTime = newTime;
          if (newTime === "00:00") {
            stopCurrentInterval();
            $scope.timerStates.breakRunning = false;
            var temp = $scope.optionTimes.timeOff;
            $scope.timerTimes.breakTime = temp;
            $scope.$apply();
            switchScreens("toWork");
          }
          $scope.$apply();
        }, 1000);
      } else if (!$scope.timerStates.breakRunning) {
        workInterval = setInterval(function() {
          $scope.timerStates.workRunning = true;
          var newTime = $scope.changeTime($scope.timerTimes.workTime, "-1");
          $scope.timerTimes.workTime = newTime;
          if (newTime === "00:00") {
            stopCurrentInterval();
            $scope.timerStates.workRunning = false;
            var temp = $scope.optionTimes.timeOn;
            $scope.timerTimes.workTime = temp;
            $scope.$apply();
            $scope.rounds.roundsLeft++;
            switchScreens("toBreak");
          }
          $scope.$apply();
        }, 1000);
      }
    } else {
      $("#pause-button").addClass("hidden");
      $("#start-button").removeClass("hidden");
      $scope.clear();
    }
  }; // End startClock()

  // Clear whichever interval is running
  function stopCurrentInterval() {
    if ($scope.timerStates.workRunning) {
      $scope.timerStates.workRunning = false;
      clearInterval(workInterval);
    } else {
      $scope.timerStates.breakRunning = false;
      clearInterval(breakInterval);
    }
  }

  $scope.pauseClock = function() {
    $("#pause-button").addClass("hidden");
    $("#start-button").removeClass("hidden");
    stopCurrentInterval();
  };

  $scope.clear = function() {
    $scope.timerTimes.breakTime = $scope.optionTimes.timeOff;
    $scope.timerTimes.workTime = $scope.optionTimes.timeOn;
    $scope.rounds.roundsLeft = 1;
    $("#break-left").removeClass("hidden");
    $("#time-left").addClass("hidden");
    $("#current-timer").css("background-color", "#ef9a9a");
    $scope.pauseClock();
  };

}]); // End controller