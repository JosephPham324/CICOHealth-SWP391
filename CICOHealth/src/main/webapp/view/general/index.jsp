<%-- 
    Document   : index.jsp
    Created on : Feb 7, 2023, 7:18:25 AM
    Author     : Pham Nhat Quang CE170036 (FPTU CANTHO)
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Homepage.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/card.css">
        <title>Home Page</title>
    </head>

    <body>
        <%@include file="navbar.jsp" %>
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
        <div class="wrapper">
            <footer>
                <div class="row block-footer">
                    <div class="offset-1 col-3 footer-content">
                        <span class="school-name"><strong>FPT University Can Tho</strong></span>
                        <p>600, Nguyen Van Cu, An Binh, Ninh Kieu, Can Tho</p>
                        <p>Phone: (0292) 360 1996</p>
                        <p>Email: fptu.cantho@fe.edu.vn</p>
                    </div>
                    <div class="offset-1 col-3 footer-content">
                        <p>Le Duy Khanh</p>
                        <p>Pham Nhat Quang</p>
                        <p>Vo Hong Quan</p>
                        <p>Huynh Gia Khiem</p>
                        <p>Pham Tan Phat</p>
                    </div>
                    <div class="col-3 footer-content">
                        <p>© 2023 All rights reserved. Our website services, content, and products are for informational purposes only. Nutrition does not provide medical advice, diagnosis, or treatment.</p>
                    </div>
                </div>
            </footer>
        </div>
    </body>
    <script>
        function displayDiv() {
            var x = document.getElementById("nav-content");
            if (x.style.display === "none") {
                x.style.display = "block";
            } else {
                x.style.display = "none";
            }
        };

        window.addEventListener("load", function () {
            if (window.innerWidth > 1010) {
                document.getElementById("nav-content").style.display = "block";
            } else {
                document.getElementById("nav-content").style.display = "none";
            }
        });

        window.addEventListener("resize", function () {
            if (window.innerWidth > 1010) {
                document.getElementById("nav-content").style.display = "block";
            } else {
                document.getElementById("nav-content").style.display = "none";
            }
        });

        document.getElementById("menu-hamburger").addEventListener("click", displayDiv);
    </script>

</html>
