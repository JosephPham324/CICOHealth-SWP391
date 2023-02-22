<%-- Document : exerciseLogs Created on : Feb 9, 2023, 8:03:27 AM Author : Pham Nhat Quang CE170036 (FPTU CANTHO) --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.2/css/jquery.dataTables.min.css">
        <!-- MDB -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.css" rel="stylesheet" />
        <!-- Bootstrap 5 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
              crossorigin="anonymous">
        <link rel="stylesheet" href="/CICOHealth/src/main/webapp/assets/css/exerciseLogPage.css">
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="/CICOHealth/src/main/webapp/assets/css/sidebar.css">
        <link rel="stylesheet" href="/CICOHealth/src/main/webapp/assets/css/Homepage.css">

        <title>exercise Logs</title>
    </head>

    <body>
        <%@include file="navbar.jsp" %>
        <div class="page-wrapper chiller-theme">
            <%@include file="sidebar.jsp" %>

            <!-- sidebar-wrapper  -->
            <main class="page-content">
                <div class="container">
                    <h1 class="txt-title">LIST OF CARDIO EXERCISES</h1>
                    <div class="datepicker-container">
                        <input type="date" id="date-picker" class="datepicker">
                    </div>

                    <table id="example" class="hover table-content" style="width:100%">
                        <thead>
                            <tr>
                                <th>No.</th>
                                <th>Time</th>
                                <th>Name</th>
                                <th>Duration</th>
                                <th>Kcal</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>10:28:10</td>
                                <td>RUNNING</td>
                                <td>30.0</td>
                                <td>377.5</td>
                                <td>Edit/Delete</td>
                            </tr>

                            <tr>
                                <td>3</td>
                                <td>10:28:10</td>
                                <td>WALK</td>
                                <td>30.0</td>
                                <td>377.5</td>
                                <td>Edit/Delete</td>
                            </tr>

                            <tr>
                                <td>4</td>
                                <td>10:28:10</td>
                                <td>SWING</td>
                                <td>30.0</td>
                                <td>377.5</td>
                                <td>Edit/Delete</td>
                            </tr>

                            <tr>
                                <td>5</td>
                                <td>10:28:10</td>
                                <td>RUNNING</td>
                                <td>30.0</td>
                                <td>377.5</td>
                                <td>Edit/Delete</td>
                            </tr>
                        </tbody>
                    </table>
                    <hr>

                    <div class="total">
                        <div class="txt-title-total">
                            <h2>Total of day</h2>
                        </div>
                        <div class="table-head row">
                            <div class="title-total col-md-6">
                                <p>Duration</p>
                            </div>
                            <div class="title-total col-md-6">
                                <p>Kcal</p>
                            </div>
                        </div>
                        <div class="table-body row">
                            <div class="total-content col-md-6">
                                <p>30.0</p>
                            </div>
                            <div class="total-content col-md-6">
                                <p>377.5</p>
                            </div>
                        </div>
                    </div>
                </div>
            </main>

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
                        <p>© 2023 All rights reserved. Our website services, content, and products are for
                            informational
                            purposes only. Nutrition does not provide medical advice, diagnosis, or treatment.
                        </p>
                    </div>
                </div>
            </footer>
        </div>

    </body>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.13.2/js/jquery.dataTables.min.js"></script>
    <script src="/CICOHealth/src/main/webapp/assets/scripts/exerciseLog.js"></script>
    <script src="/CICOHealth/src/main/webapp/assets/scripts/sidebar.js"></script>
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