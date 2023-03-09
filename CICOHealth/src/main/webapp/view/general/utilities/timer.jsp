<%-- 
    Document   : timer
    Created on : Feb 9, 2023, 8:01:48 AM
    Author     : Pham Nhat Quang CE170036 (FPTU CANTHO)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="">
        <link rel="stylesheet" href="/CICOHealth/assets/sass/main/timer/timer.css">
        <link rel="stylesheet" href="/CICOHealth/assets/sass/main/timer/stopwatch.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
              rel="stylesheet">
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous">
                <link rel="stylesheet" href="/CICOHealth/assets/css/Homepage.css">

        <title>Timer</title>
    </head>
    <body>
        <%@include file="/view/general/navbar.jsp" %>
        <div class="buttons">
            <button class="btn" id="btn_diva">STOP WATCH</button>
            <button class="btn" id="btn_divb"> TIMER</button>
        </div>
        <div class="main_container" style=" position: absolute;
             top: 50%;
             left: 50%;
             transform: translate(-50%, -50%);">

            <div class="diva" id="diva">
                <div class="watch">
                    <div class="time">
                        00:00:00
                    </div>
                    <div class="controls">
                        <button id="start">Start</button>
                        <button id="stop">Stop</button>
                        <button id="reset">Reset</button>
                    </div>
                </div>
            </div>
            <div class="divb" id="divb" style="display: none
                 ;">
                <div class="timer"></div>

            </div>
            

        </div>
        


        <audio id="alarm" src="/CICOHealth/assets/mp3/alarm.mp3"></audio>

        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
        <script src="/CICOHealth/assets/scripts/stopwatch.js"></script>
        <script src="/CICOHealth/assets/scripts/timer.js"></script>
    </body>

    <script>
        var btn_diva = document.getElementById("btn_diva");
        var btn_divb = document.getElementById("btn_divb");
        var diva = document.getElementById("diva");
        var divb = document.getElementById("divb");
        btn_diva.addEventListener('click', () => {
            diva.style.display = 'block';
            divb.style.display = 'none';

        }
        );

        btn_divb.addEventListener('click', () => {
            diva.style.display = 'none';
            divb.style.display = 'block';

        }
        );
    </script>
</html>
