<%-- 
    Document   : message
    Created on : Mar 16, 2023, 4:48:27 PM
    Author     : Pham Nhat Quang CE170036 (FPTU CANTHO)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%if (request.getParameter("status") != null) {%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <style>
            /* Style for the message element */
            #message {
                min-width:min(50vw,50vh);
                min-height:min(50vw,50vh);
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                padding: 10px 20px;
                border-radius: 5px;
                text-align: center;
                font-size: 2rem;
                opacity: 0;
                transition: opacity 1s ease-out;
                z-index:100;
                display:flex;
                align-items:center;
                justify-content:center;
            }

            /* Style for the success message */
            #message.success {
                background-color: #dff0d8;
                border: 1px solid #d6e9c6;
            }

            /* Style for the failure message */
            #message.failure {
                background-color: #f2dede;
                border: 1px solid #ebccd1;
            }

            /* Style for the error message */
            #message.error {
                background-color: #f2f2f2;
                border: 1px solid #ddd;
            }

            /* Style for the fade-in animation */
            #message.fade-in {
                opacity: 1;
            }

            /* Style for the fade-out animation */
            #message.fade-out {
                opacity: 0;
            }
        </style>

        <script>
            // Function to fade out the message element after a delay
            function fadeOutMessage() {
                var message = document.getElementById("message");
                message.classList.remove("fade-in");
                message.classList.add("fade-out");
                setTimeout(function () {
                    message.style.display = "none";
                }, 1000);
            }

            // Call the fadeOutMessage() function after a delay
            setTimeout(fadeOutMessage, 2000);
        </script>
    </head>

    <body>
        <%
            // Retrieve the status and message parameters from the request
            String status = request.getParameter("status");
            String message = request.getParameter("message");

            // Set the CSS class for the message element based on the status parameter
            String cssClass = "";
            if ("success".equals(status)) {
                cssClass = "success";
            } else if ("failure".equals(status)) {
                cssClass = "failure";
            } else if ("error".equals(status)) {
                cssClass = "error";
            }
        %>

        <div id="message" class="fade-in <%= cssClass%>"><%= message%></div>
    </body>
</html>
<%}%>
