<%-- Document : mealLogs Created on : Feb 9, 2023, 8:03:20 AM Author : Pham Nhat Quang CE170036 (FPTU CANTHO) --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.2/css/jquery.dataTables.min.css" />
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.datatables.net/1.13.2/js/jquery.dataTables.min.js"></script>

        <link rel="stylesheet" href="/CICOHealth/assets/css/sidebar.css" />
        <link rel="stylesheet" href="/CICOHealth/assets/sass/main/mealLog.css" />
        <!--Functions scripts-->
        <script src="/CICOHealth/assets/scripts/popup.js"></script>
        <title>Meal Logs</title>
    </head>

    <body>
        <%@ include file="/view/general/navbar.jsp" %>
        <main class="page-content">
            <div class="container">
                <h1 class="txt-title">LIST OF YOUR MEALS</h1>
                <div class="datepicker-container">
                    <input type="date" id="date-picker" class="datepicker" />
                </div>

                        <table id="meal-logs-table" class="hover table-content" style="width: 100%">
                            <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>Time</th>
                                    <th>Name</th>
                                    <th>Protein</th>
                                    <th>Fat</th>
                                    <th>Carbs</th>
                                    <th>Calories</th>
                                    <th>Note</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                
                            </tbody>
                        </table>
                        <hr />

                        <div class="total" id="day-total">
                            <div class="txt-title-total">
                                <h2>Total of day</h2>
                            </div>
                            <div class="table-head row">
                                <div class="title-total col-3">
                                    <p>Protein</p>
                                </div>
                                <div class="title-total col-3">
                                    <p>Fat</p>
                                </div>
                                <div class="title-total col-3">
                                    <p>Carbs</p>
                                </div>
                                <div class="title-total col-3">
                                    <p>Calories</p>
                                </div>
                            </div>

                            <div class="table-body row">
                                <div class="total-content col-3">
                                    <p id="protein-value">30.0</p>
                                </div>
                                <div class="total-content col-3">
                                    <p id="fat-value">377.5</p>
                                </div>
                                <div class="total-content col-3">
                                    <p id="carbs-value">30.0</p>
                                </div>
                                <div class="total-content col-3">
                                    <p id="calories-value">377.5</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>

                <!-- pop-up-edit -->
                <div class="pop-up edit-pop-up" id="edit-pop-up">
                    <div class="edit-overlay overlay" id="overlay"></div>
                    <div class="pop-up-content edit-pop-up-content">
                        <form action="meal-log" method="post" name="edit-meal-log-form" class="edit-meal-log-form"
                            id="edit-meal-log-form">
                            <h2 class="txt-title-pop-up">Edit Meal Logs</h2>
                            <table id="edit-table" class="hover table-content" style="width: 100%">
                                <thead class="pop-up-thead-table">
                                    <tr>
                                        <th>Name</th>
                                        <th>Protein</th>
                                        <th>Fat</th>
                                        <th>Carbs</th>
                                        <th>Calories</th>
                                        <th>Mass(g)</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody class="pop-up-body-table">

                                </tbody>
                                <tfoot class="pop-up-foot-table">

                                </tfoot>
                            </table>

                            <div class="form-group row">
                                <div class="offset-4 col-2">
                                    <button name="btn-submit" type="submit" class="btn" id="btn-submit">
                                        Submit
                                    </button>
                                </div>
                                <div class="col-2">
                                    <a name="btn-cancel" class="btn"> Cancel </a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </main>

        <!-- pop-up-edit -->

        <div class="pop-up edit-pop-up" id="edit-pop-up">
            <div class="edit-overlay overlay" id="overlay"></div>
            <div class="pop-up-content edit-pop-up-content">
                <form action="meal-log" method="post" name="edit-meal-log-form" class="edit-meal-log-form"
                      id="edit-meal-log-form">
                    <h2 class="txt-title-pop-up">Edit Meal Logs</h2>
                    <table id="edit-table" class="hover table-content" style="width: 100%">
                        <thead class="pop-up-thead-table">
                            <tr>
                                <th>Name</th>
                                <th>Protein</th>
                                <th>Fat</th>
                                <th>Carbs</th>
                                <th>Calories</th>
                                <th>Mass(g)</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody class="pop-up-body-table"></tbody>
                        <tfoot class="pop-up-foot-table">
                            <tr>
                                <td>Breakfast</td>
                                <td>45.4</td>
                                <td>66.0</td>
                                <td>6.4</td>
                                <td>787.8</td>
                                <td></td>
                                <td></td>
                            </tr>
                        </tfoot>
                    </table>

                    <div class="form-group row">
                        <div class="offset-4 col-2">
                            <button name="btn-submit" type="submit" class="btn" id="btn-submit">
                                Submit
                            </button>
                        </div>
                        <div class="col-2">
                            <a name="btn-cancel" class="btn"> Cancel </a>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <!-- pop-up-notes -->
        <form action="meal-logs" method="post" class="edit-meal-log-note-form"
              id="edit-meals-log-note">
            <div class="pop-up note-pop-up" id="note-pop-up">
                <div class="note-overlay overlay" id="overlay"></div>
                <div class="pop-up-content note-pop-up-content">
                    <!-- <div class="note-pop-up"> -->
                    <h2 class="txt-title-pop-up">Notes Meal Logs</h2>
                    <div class="form-group row">
                        <div class="offset-1 col-10">
                            <textarea id="txtNote" name="txtNote" type="text" class="form-control"></textarea>
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="offset-4 col-2">
                            <button name="btn-submit" type="submit" class="btn" id="btn-submit">
                                Submit
                            </button>
                        </div>
                        <div class="col-2">
                            <a name="btn-cancel" class="btn"> Cancel</a>
                        </div>
                    </div>
                    <!-- </div> -->
                </div>
            </div>
        </form>


        <!-- footer -->
        <%@include file="/view/general/footer.jsp" %>

    </body>
    <script src="/CICOHealth/assets/scripts/navbar.js"></script>
    <script src="/CICOHealth/assets/scripts/formLog.js"></script>
    <script src="/CICOHealth/assets/scripts/sidebar.js"></script>
    <script src="/CICOHealth/assets/scripts/formhandling.js"></script>
    <script src="/CICOHealth/assets/scripts/meallogs.js"></script>

</html>