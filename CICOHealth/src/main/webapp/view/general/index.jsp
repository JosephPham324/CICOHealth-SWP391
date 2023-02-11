<%-- 
    Document   : index.jsp
    Created on : Feb 7, 2023, 7:18:25 AM
    Author     : Pham Nhat Quang CE170036 (FPTU CANTHO)
--%>

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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Assets/css/Homepage.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Assets/css/card.css">
    <title>Home Page</title>
</head>

<body>
    <header class="header">
        <div class="logo txt-logo">CICOHealth</div>
        <div class="nav-content" id="nav-content">
            <ul class="menu">
                <li class="nav-link"><a href="#" class="menu-item">Home</a></li>
                <li class="nav-link"><a href="#" class="menu-item">Food</a></li>
                <li class="nav-link"><a href="#" class="menu-item">Exercise</a></li>
                <li class="nav-link dropdown"><a href="#" class="menu-item">Utilities</a>
                    <ul class="dropdown-menu">
                        <li class="dropdown-item"><a href="#">Convert Unit</a></li>
                        <li class="dropdown-item"><a href="#">Timer</a></li>
                    </ul>
                </li>
                <li class="nav-link nav-btn"><a href="#" class="btn-item">Sign in</a></li>
                <li class="nav-link nav-btn"><a href="#" class="btn-item">Register</a></li>
            </ul>
        </div>
        <div class="menu-hamburger" id="menu-hamburger">
            <img src="./img/icon.png" alt="menu-hamburger">
        </div>
    </header>

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
                    <img src="./img/book.png" alt="Lean.Follow.Progress." class="card-img">
                    <div class="card-desc">
                        <div class="card-title">Lean.Follow.Progress.</div>
                        <div class="card-info">Keeping a food diary gives you a
                            <br>better understanding of your <br> habits and
                            increases your <br> changes of reaching your goals.
                        </div>
                    </div>
                </div>
                <div class="card-body col-md-4">
                    <img src="./img/connect.png" alt="A simplified connection" class="card-img">
                    <div class="card-desc">
                        <div class="card-title">A simplified connection</div>
                        <div class="card-info">Scan barcodes, save meals and
                            <br>recipes, and use Quick Tools for
                            <br>quick and easy food tracking.
                        </div>
                    </div>
                </div>
                <div class="card-body col-md-4">
                    <img src="./img/move.png" alt="Stay movtivated" class="card-img">
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
    }

    window.addEventListener("load", function () {
        if (window.innerWidth > 1010) {
            document.getElementById("nav-content").style.display = "block";
        }
    });

    window.addEventListener("resize", function () {
        if (window.innerWidth > 1010) {
            document.getElementById("nav-content").style.display = "block";
        }
    });

    document.getElementById("menu-hamburger").addEventListener("click", displayDiv);
</script>

</html>
