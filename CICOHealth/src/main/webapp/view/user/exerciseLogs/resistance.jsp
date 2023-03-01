<%-- Document : Resistance Created on : Feb 22, 2023, 4:21:37 PM Author : Admin --%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.2/css/jquery.dataTables.min.css">
        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
        <!-- MDB -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.css" rel="stylesheet" />
        <!-- Bootstrap 5 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="/CICOHealth/assets/css/sidebar.css">
        <link rel="stylesheet" href="/CICOHealth/assets/css/Homepage.css">
        <!-- <link rel="stylesheet" href="/CICOHealth/assets/css/popup.css"> -->
        <!-- <link rel="stylesheet" href="/CICOHealth/assets/css/exerciseLogPage.css"> -->
        <link rel="stylesheet" href="/CICOHealth/assets/sass/main/exercisLog.css">
        <style>
            main {
                position: relative;
                z-index: 0;
            }
        </style>
        <title>Document</title>
    </head>

    <body>
        <%@include file = "/view/general/navbar.jsp"%>
        <div class="page-wrapper chiller-theme">   
            <%@include file="sidebar.jsp" %>
            <!-- sidebar-wrapper  -->
            <main class="page-content">
                <div class="container">
                    <h1 class="txt-title">Resistance Exercises Logs</h1>
                    <div class="datepicker-container">
                        <input type="date" id="date-picker" class="datepicker">
                    </div>

                    <table id="resistance-logs-table" class="hover table-content" style="width:100%">
                        <thead>
                            <tr>
                                <th>No.</th>
                                <th>Time</th>
                                <th>Name</th>
                                <th>Sets</th>
                                <th>Reps</th>
                                <th>Weights(kg)</th>
                                <th>Note</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>10:28:10</td>
                                <td>RUNNING</td>
                                <td>30.0</td>
                                <td>30.0</td>
                                <td>377.5</td>
                                <td><a href="#" class="btn-note-pop-up"><i class="fa-solid fa-note-sticky"></i></a></td>
                                <td><a href="#" class="btn-edit-pop-up"><i class="fa-solid fa-pen-to-square"></i></a>/ <a
                                        href="#" class="btn-delete-pop-up"><i class="fa-solid fa-trash"></i></a></td>
                            </tr>
                        </tbody>
                    </table>
                    <hr>

                    <div class="total">
                        <div class="txt-title-total">
                            <h2>Total of day</h2>
                        </div>
                        <div class="table-head row">
                            <div class="title-total col-md-4">
                                <p>Sets</p>
                            </div>
                            <div class="title-total col-md-4">
                                <p>Reps</p>
                            </div>
                            <div class="title-total col-md-4">
                                <p>Weight(kg)</p>
                            </div>
                        </div>

                        <div class="table-body row">
                            <div class="total-content col-md-4">
                                <p id="total-set">30.0</p>
                            </div>
                            <div class="total-content col-md-4">
                                <p id="total-reps">30.0</p>
                            </div>
                            <div class="total-content col-md-4">
                                <p id="total-weight">377.5</p>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>

        <div class="pop-up" id="exercise-log-pop-up">
            <div class="overlay"></div>
            <div class="pop-up-content">Hello</div>
        </div>

        <!-- pop-up-notes -->
        <div class="pop-up note-pop-up" id="note-pop-up">
            <div class="note-overlay overlay" id="overlay"></div>
            <div class="pop-up-content note-pop-up-content">
                <!-- <div class="note-pop-up"> -->
                <h2 class="txt-title-pop-up">Notes Exercise Logs</h2>

                <div class="form-group row">
                    <div class="offset-1 col-10">
                        <textarea id="txtNote" name="txtNote" type="text" class="form-control"></textarea>
                    </div>
                </div>

                <div class="form-group row">
                    <!-- <div class="offset-3 col-2">
                        <button name="btn-cancel" type="button" class="btn" id="btn-cancel">Cancel</button>
                    </div> -->
                    <div class="offset-5 col-2 btn-submit">
                        <button name="btn-submit" type="submit" class="btn" id="btn-submit">Submit</button>
                    </div>
                </div>
                <!-- </div> -->
            </div>
        </div>

        <!-- footer -->
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
                            purposes only. Nutrition does not provide medical advice, diagnosis, or treatment.</p>
                    </div>
                </div>
            </footer>
        </div>
    </body>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.13.2/js/jquery.dataTables.min.js"></script>
    <script src="/CICOHealth/assets/scripts/formLog.js"></script>
    <script src="/CICOHealth/assets/scripts/sidebar.js"></script>
    <script src="/CICOHealth/assets/scripts/popup.js"></script>
    <script src="/CICOHealth/assets/scripts/formhandling.js"></script>
    <script src="/CICOHealth/assets/scripts/resistancelogs.js"></script>

</html>