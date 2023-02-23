<%-- Document : Resistance Created on : Feb 22, 2023, 4:21:37 PM Author : Admin --%>

    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
            <link rel="stylesheet" href="/CICOHealth/src/main/webapp/assets/css/popup.css">

            <title>Resistance</title>
        </head>

        <body>
            <%@include file="/view/general/navbar.jsp" %>
                <div class="page-wrapper chiller-theme">
                    <%@include file="/view/general/sidebar.jsp" %>

                        <!-- sidebar-wrapper  -->
                        <main class="page-content">
                            <div class="container">
                                <h1 class="txt-title">LIST OF RESISTANCE EXERCISES</h1>
                                <div class="datepicker-container">
                                    <input type="date" id="date-picker" class="datepicker">
                                </div>

                                <table id="example" class="hover table-content" style="width:100%">
                                    <thead>
                                        <tr>
                                            <th>No.</th>
                                            <th>Time</th>
                                            <th>Name</th>
                                            <th>Set</th>
                                            <th>Rep</th>
                                            <th>Weight</th>
                                            <th>Note</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>10:28:10</td>
                                            <td>RUNNING</td>
                                            <td>5</td>
                                            <td>12</td>
                                            <td>30.0</td>
                                            <td><a href="#" class="btn-note-pop-up"><i
                                                        class="fa-solid fa-note-sticky"></i></a></td>
                                            <td><a href="#" class="btn-edit-pop-up"><i
                                                        class="fa-solid fa-pen-to-square"></i></a>/ <a href="#"
                                                    class="btn-delete-pop-up"><i class="fa-solid fa-trash"></i></a></td>
                                        </tr>

                                        <tr>
                                            <td>3</td>
                                            <td>10:28:10</td>
                                            <td>RUNNING</td>
                                            <td>5</td>
                                            <td>12</td>
                                            <td>30.0</td>
                                            <td><a href="#" class="btn-note-pop-up"><i
                                                        class="fa-solid fa-note-sticky"></i></a></td>
                                            <td><a href="#" class="btn-edit-pop-up"><i
                                                        class="fa-solid fa-pen-to-square"></i></a>/ <a href="#"
                                                    class="btn-delete-pop-up"><i class="fa-solid fa-trash"></i></a></td>
                                        </tr>

                                        <tr>
                                            <td>4</td>
                                            <td>10:28:10</td>
                                            <td>RUNNING</td>
                                            <td>5</td>
                                            <td>12</td>
                                            <td>30.0</td>
                                            <td><a href="#" class="btn-note-pop-up"><i
                                                        class="fa-solid fa-note-sticky"></i></a></td>
                                            <td><a href="#" class="btn-edit-pop-up"><i
                                                        class="fa-solid fa-pen-to-square"></i></a>/ <a href="#"
                                                    class="btn-delete-pop-up"><i class="fa-solid fa-trash"></i></a></td>
                                        </tr>

                                        <tr>
                                            <td>5</td>
                                            <td>10:28:10</td>
                                            <td>RUNNING</td>
                                            <td>5</td>
                                            <td>12</td>
                                            <td>30.0</td>
                                            <td><a href="#" class="btn-note-pop-up"><i
                                                        class="fa-solid fa-note-sticky"></i></a></td>
                                            <td><a href="#" class="btn-edit-pop-up"><i
                                                        class="fa-solid fa-pen-to-square"></i></a>/ <a href="#"
                                                    class="btn-delete-pop-up"><i class="fa-solid fa-trash"></i></a></td>
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
                <!-- pop-up-edit -->
                <div class="pop-up edit-pop-up">
                    <div class="edit-overlay overlay" id="overlay"></div>
                    <div class="pop-up-content edit-pop-up-content">
                        <form action="exercise-log" method="post" name="edit-exercise-log-form"
                            class="edit-exercise-log-form">
                            <h2 class="txt-title-pop-up">Edit Exercise Logs</h2>
                            <div class="form-group row">
                                <label for="txtDate" class="offset-1 col-3 col-form-label">Date</label>
                                <div class="col-7">
                                    <input id="txtDate" name="txtDate" type="datetime" class="form-control">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="txtTime" class="offset-1 col-3 col-form-label">Time</label>
                                <div class="col-7">
                                    <input id="txtTime" name="txtTime" type="time" class="form-control">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="txtName" class="offset-1 col-3 col-form-label">Name</label>
                                <div class="col-7">
                                    <input id="txtName" name="txtName" type="text" class="form-control">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="txtSet" class="offset-1 col-3 col-form-label">Set</label>
                                <div class="col-7">
                                    <input id="txtSet" name="txtSet" type="number" class="form-control">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="txtRep" class="offset-1 col-3 col-form-label">Rep</label>
                                <div class="col-7">
                                    <input id="txtCaltxtReprieBurned" name="txtRep" type="number" class="form-control">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="txtWeight" class="offset-1 col-3 col-form-label">Weight</label>
                                <div class="col-7">
                                    <input id="txtWeight" name="txtWeight" type="number" class="form-control">
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="offset-4 col-2">
                                    <button name="btn-cancel" type="button" class="btn" id="btn-cancel">Cancel</button>
                                </div>
                                <div class="offset-1 col-2">
                                    <button name="btn-submit" type="submit" class="btn" id="btn-submit">Submit</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- pop-up-notes -->
                <div class="pop-up note-pop-up">
                    <div class="note-overlay overlay" id="overlay"></div>
                    <div class="pop-up-content note-pop-up-content">
                        <h2 class="txt-title-pop-up">Notes Exercise Logs</h2>

                        <div class="form-group row">
                            <div class="offset-1 col-10">
                                <textarea id="txtNote" name="txtNote" type="text" class="form-control"></textarea>
                            </div>
                        </div>

                        <div class="form-group row">
                            <div class="offset-3 col-2">
                                <button name="btn-cancel" type="button" class="btn" id="btn-cancel">Cancel</button>
                            </div>
                            <div class="offset-1 col-2">
                                <button name="btn-submit" type="submit" class="btn" id="btn-submit">Submit</button>
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
        <script src="/CICOHealth/src/main/webapp/assets/scripts/navbar.js"></script>
        <script src="/CICOHealth/src/main/webapp/assets/scripts/exerciseLogAndMealLog.js"></script>
        <script src="/CICOHealth/src/main/webapp/assets/scripts/sidebar.js"></script>

        </html>