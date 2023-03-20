<%-- 
    Document   : timer
    Created on : Feb 9, 2023, 8:01:48 AM
    Author     : Pham Nhat Quang CE170036 (FPTU CANTHO)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Compiled and minified CSS -->
        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
        <!-- Compiled and minified JavaScript -->

        <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
              rel="stylesheet">
        <script
        src="https://cdnjs.cloudflare.com/ajax/libs/buzz/1.1.10/buzz.min.js"></script>
        <link rel="stylesheet" href="/CICOHealth/assets/sass/main/stopwatch.css">
        <title>Timer  | ${initParam.webappName}</title>
    </head>
    <body>
        <%@include file="/view/general/navbar.jsp" %>

    <body ng-app="tabataApp">

        <div id="wrapper" ng-controller="tabataAppCtrl">




            <!--Timer control buttons-->
            <div id="button-wrapper">
                <a class="waves-effect waves-light btn orange darken-2"
                   id="start-button" ng-click="startClock()"><i
                        class="material-icons left">alarm_on</i>Start</a>
                <a class="waves-effect waves-light btn pink orange darken-2
                   hidden" id="pause-button" ng-click="pauseClock()"><i
                        class="material-icons left">pause</i>Pause</a>
                <a class="waves-effect waves-light btn orange"
                   ng-click="clear()"><i class="material-icons left">stop</i>Clear</a>
            </div>
            <!--End timer control buttons-->


            <div class="row">
                <div class="col s12 m10 offset-m1 l8 offset-l2 z-depth-2"
                     id="app-wrapper">
                    <!--Clock-->
                    <div class="col s12 m9 l9" id="timer">
                        <div class="row">
                            <div class="col s9 m8 l8" id="current-timer">
                                <div id="time-left" class="hidden">
                                    <h3>Time left</h3>
                                    <br><span class="time-left-numbers"
                                              ng-cloak>{{timerTimes.workTime}}</span>
                                </div>
                                <div id="break-left">
                                    <h3>Break</h3>
                                    <br><span class="time-left-numbers"
                                              ng-cloak>{{timerTimes.breakTime}}</span>
                                </div>
                            </div>
                            <div class="col s3 m4 l4" id="round">
                                <h4>Round</h4>
                                <br><span id="round-numbers" ng-cloak>{{rounds.roundsLeft}}/{{rounds.totalRounds}}</span>
                            </div>
                        </div>
                    </div>
                    <!--End clock-->

                    <!--Options grid-->
                    <div class="col s10 offset-s1 m3 l3" id="options">
                        <div class="switch">
                            <p>Volume:
                            <p>
                                <label>
                                    Off
                                    <input type="checkbox"
                                           id="volume-switch">
                                    <span class="lever"></span>
                                    On
                                </label>
                        </div>
                        <div class="option-input">
                            <p>Time on:</p>
                            <i class="material-icons adjust
                               adjust-minus"
                               ng-click="changeTimeOn(optionTimes.timeOn,
                                                   '-1')">remove</i>
                            <p class="option-time" ng-cloak>{{optionTimes.timeOn}}</p>
                            <i class="material-icons adjust
                               adjust-plus"
                               ng-click="changeTimeOn(optionTimes.timeOn,
                                                   '+1')">add</i>
                        </div>

                        <div class="option-input">
                            <p>Time off:</p>
                            <i class="material-icons adjust
                               adjust-minus"
                               ng-click="changeTimeOff(optionTimes.timeOff,
                                                   '-1')">remove</i>
                            <p class="option-time" ng-cloak>{{optionTimes.timeOff}}</p>
                            <i class="material-icons adjust
                               adjust-plus"
                               ng-click="changeTimeOff(optionTimes.timeOff,
                                                   '+1')">add</i>
                        </div>

                        <div class="option-input">
                            <p>Rounds:</p>
                            <i class="material-icons adjust
                               adjust-minus"
                               ng-click="changeRounds(rounds.totalRounds,
                                                   '-1')">remove</i>
                            <p class="option-time" ng-cloak>{{rounds.totalRounds}}</p>
                            <i class="material-icons adjust
                               adjust-plus"
                               ng-click="changeRounds(rounds.totalRounds,
                                                   '+1')">add</i>
                        </div>
                    </div>
                </div>

            </div>

        </div>
        <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/angular.js/1.3.14/angular.min.js"></script>
        <!--End wrapper-->
        <script src="/CICOHealth/assets/scripts/stopwatch.js"></script>
    </body>
</html>