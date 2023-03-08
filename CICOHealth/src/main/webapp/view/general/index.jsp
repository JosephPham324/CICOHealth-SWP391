<%-- Document : index.jsp Created on : Feb 7, 2023, 7:18:25 AM Author : Pham Nhat Quang CE170036 (FPTU CANTHO) --%>

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@page contentType="text/html" pageEncoding="UTF-8" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta http-equiv="X-UA-Compatible" content="IE=edge">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Home Page</title>
            </head>

            <body>
                <%@include file="/view/general/navbar.jsp" %>
                    <div class="top-content">
                        <div class="container row">
                            <div class="offset-1 col-md-5 txt-left">
                                <b class="header-heading">Recipe for getting stuff done:</b>
                                <p class="header-desc ">
                                    <i class="fa-solid fa-circle-check"></i> Plan it out <br>
                                    <i class="fa-regular fa-circle"></i> Break it down <br>
                                    <i class="fa-regular fa-circle"></i> Get it done <br>
                                    <i class="fa-regular fa-circle"></i> Cross it off <br>
                                    <i class="fa-regular fa-circle"></i> Feel great <br>
                                    <i class="fa-regular fa-circle"></i> Celebrate 🎉
                                </p>
                            </div>
                        </div>
                    </div>
                    <hr>

                    <div class="card-container">
                        <div class="body-content">
                            <div class="block-title">
                                <p>What is your diet? Ask about calorie count, nutrition facts and portion size.</p>
                                <b>The tools for your goals</b>
                                <p>Trying to lose weight, tone up, lower your BMI, or invest in your overall
                                    <br>
                                    health? We give you the features to achieve your goals.
                                </p>
                            </div>
                            <div class="block-card row">
                                <div class="card-body col-md-4">
                                    <img src="./assets/img/book.png" alt="Lean.Follow.Progress." class="card-img">
                                    <div class="card-desc">
                                        <div class="card-title">Lean.Follow.Progress.</div>
                                        <div class="card-info">Keeping a food diary gives you a
                                            <br>better understanding of your <br> habits and
                                            increases your <br> changes of reaching your goals.
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body col-md-4">
                                    <img src="./assets/img/connect.png" alt="A simplified connection" class="card-img">
                                    <div class="card-desc">
                                        <div class="card-title">A simplified connection</div>
                                        <div class="card-info">Scan barcodes, save meals and
                                            <br>recipes, and use Quick Tools for
                                            <br>quick and easy food tracking.
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body col-md-4">
                                    <img src="./assets/img/move.png" alt="Stay movtivated" class="card-img">
                                    <div class="card-desc">
                                        <div class="card-title">Stay movtivated</div>
                                        <div class="card-info">Join the world's largest fitness
                                            <br>community forr tips and tricks, plus
                                            <br> 24/7 support.
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Footer -->
                    <%@include file="/view/general/footer.jsp" %>
            </body>

            </html>