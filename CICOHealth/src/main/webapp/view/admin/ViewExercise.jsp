<%-- Document : ViewExercise Created on : Feb 15, 2023, 8:42:00 AM Author : Admin --%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        ${initParam.Bootstrap}
        ${initParam.DataTableCDN}
        ${initParam.FontAwesome}
        ${initParam.JqueryValidation}
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/sass/main/exercisemanagement.css" />
        <title>View Exercise</title>
    </head>

    <body>
        <%@ include file="/view/general/navbar.jsp" %>
        <div class="pop-up" id="edit-exercise-popup">
            <div class="overlay"></div>
            <div class="pop-up-content">
                <form id="edit-exercise-form" action="/CICOHealth/admin/exercise-management" method="POST">
                    <div class="form-group row">
                        <div class="offset-4 col-8">
                            <h2>Update Exercise</h2>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="txtExerciseID" class="col-4 col-form-label">Exercise ID</label>
                        <div class="col-8">
                            <input id="txtExerciseID" name="txtExerciseID" type="text" class="form-control" required="required"
                                   readonly />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="txtExerciseType" class="col-4 col-form-label">Exercise Type</label>
                        <div class="col-8">
                            <input id="txtExerciseType" name="txtExerciseType" type="text" class="form-control"
                                   required="required" readonly />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="txtExerciseName" class="col-4 col-form-label">Exercise Name</label>
                        <div class="col-8">
                            <input id="txtExerciseName" name="txtExerciseName" placeholder="Enter Exercise Name" type="text"
                                   class="form-control" required="required" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="txtExerciseDescription" class="col-4 col-form-label">Exercise Description</label>
                        <div class="col-8">
                            <textarea id="txtExerciseDescription" name="txtExerciseDescription" cols="40" rows="3"
                                      required="required" class="form-control"></textarea>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="numCaloriePerHour" class="col-4 col-form-label">Calorie Per Hour</label>
                        <div class="col-8">
                            <input id="numCaloriePerHour" name="numCaloriePerHour" type="number" step="0.1" class="form-control"
                                   aria-describedby="numCaloriePerHourHelpBlock" />
                            <span id="numCaloriePerHourHelpBlock" class="form-text text-muted">Optional</span>
                        </div>
                    </div>
                    <input type="hidden" name="_method" value="PUT">
                    <div class="form-group row">
                        <div class="offset-4 col-8">
                            <button name="submit" type="submit" class="btn btn-primary">
                                Submit
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="container" style=" margin: auto;
             padding-top: 3rem;">
            <div class="row  justify-content-md-center">  
                <div class="col-md-auto">
                    <div class="content">
                        <button name="submit" class="btn btn-success" id="add-button">
                            Add Exercise
                        </button>
                        <table id="info-table" class="table table-striped table-hover display content-table">
                            <thead>
                                <tr style="background-color: greenyellow">
                                    <th scope="col">Exercise ID</th>
                                    <th scope="col">Exercise Type</th>
                                    <th scope="col">Exercise Name</th>
                                    <th scope="col">Exercise Description</th>
                                    <th scope="col">Calories Per Hour</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="exercise" items="${exerciseList}">
                                    <tr>
                                        <td>${exercise.exerciseID}</td>
                                        <td>${exercise.getExerciseType()}</td>
                                        <td>${exercise.exerciseName}</td>
                                        <td>${exercise.exerciseDescription}</td>
                                        <td>${exercise.caloriesPerHour}</td>
                                        <td>
                                            <button class="btn btn-info edit-button" data-exercise='{"exerciseID": "${exercise.exerciseID}",
                                                    "exerciseType": "${exercise.getExerciseType()}",
                                                    "exerciseName": "${exercise.exerciseName}",
                                                    "exerciseDescription": "${exercise.exerciseDescription}",
                                                    "caloriesPerHour": "${exercise.caloriesPerHour}"
                                                    }'>
                                                <a class="fa-solid fa-pen-to-square " style="color: #fff"></a>
                                            </button>
                                            <form action="/CICOHealth/admin/exercise-management" method="POST" style="display:inline">
                                                <input type="hidden" name="_method" value="DELETE">
                                                <input type="hidden" name="exerciseid" value="${exercise.exerciseID}">
                                                <button type="submit" class="btn btn-danger"><i class="fa-solid fa-ban"></i></button>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div>



        <script src="${pageContext.request.contextPath}/assets/scripts/validate.js"></script>
        <script src="${pageContext.request.contextPath}/assets/scripts/popup.js"></script>
        <script src="${pageContext.request.contextPath}/assets/scripts/exerciseManagement.js"></script>
    </body>

</html>