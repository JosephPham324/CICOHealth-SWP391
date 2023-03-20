<%-- Document : createProgram Created on : Mar 8, 2023, 8:10:25 AM Author :
Admin --%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />

        <!-- Font Awesome -->
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
            rel="stylesheet"
            />
        <!-- Google Fonts -->
        <link
            href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
            rel="stylesheet"
            />
        <!-- MDB -->
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.css"
            rel="stylesheet"
            />
        <link
            rel="stylesheet"
            href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
            />

        <!-- Font Awesome -->
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
            rel="stylesheet"
            />

        <link rel="stylesheet" href="/CICOHealth/assets/css/Homepage.css" />
        <link
            rel="stylesheet"
            href="/CICOHealth/assets/sass/main/createexerciseprogram.css"
            />
        <style>
            .btn-use{
                background-color: #4CAF50; /* Green */
                border: none;
                color: white;
                padding: 15px 32px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
            }
            .btn-use.remove{
                background-color: orange; /* Green */
            }
            .btn-use:hover{
                box-shadow: inset 0 0 100px 100px rgba(255, 255, 255, 0.1);
            }
            .btn-use:active{
                transform:scale(0.98);
            }
        </style>

        <title>Program Details</title>
    </head>

    <body>
        <jsp:useBean id="now" class="java.util.Date"/>    
        <div class="container">
            <div class="create-exercise-program-header">
                <h1>Workouts on</h1>
                <h2><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></h2>
            </div>
            <form
                onsubmit="event.preventDefault();"
                name="create-exercise-program-form"
                class="create-exercise-program-form"
                id="create-exercise-program-form"
                >
                <div class="create-exercise-program-form-content">
                    <c:forEach var="workoutGroup" items = "${workouts}">
                        <div class="workout-group">
                            <div class="form-item row">
                                <div class="offset-2 col-2">
                                    <label for="txtUsername">Program ID</label>
                                </div>
                                <div class="col-6 form-item-input">
                                    <input value="${workoutGroup.get(0).programID.programID}" id="program-name" name="txtProgramName" placeholder="Enter program name" type="text" readonly>
                                </div>
                                <div class="col-2">
                                    <a class="btn btn-primary" href="/CICOHealth/exercise-programs/detail?id=${workoutGroup.get(0).programID.programID}">Program Details</a>
                                </div>
                            </div>
                            <hr />
                            <div class="form-item row">
                                <div class="col-2">
                                    <label for="txtPrice">Workouts List</label>
                                </div>
                            </div>
                            <c:forEach var="workout1" items="${workoutGroup}">
                                <div class="card list-exercise-program-item">
                                    <div
                                        class="card-header btn"
                                        data-toggle="collapse"
                                        data-target="#workout-${workout1.workoutID}"
                                        >
                                        ${workout1.workoutName}
                                    </div>
                                    <div
                                        class="card-body collapse workout"
                                        data-toggle="collapse"
                                        aria-expanded="false"
                                        id="workout-${workout1.workoutID}"
                                        data-id="${workout1.workoutID}"
                                        >
                                        <div class="form-item row">
                                            <div class="col-3">
                                                <label for="txtWorkoutName">Workout Name</label>
                                            </div>
                                            <div class="col-9 form-item-input">
                                                <input
                                                    id="txtWorkoutName-${workout1.workoutID}"
                                                    name="txtWorkoutName"
                                                    placeholder="Enter workout name"
                                                    type="text"
                                                    required="required"
                                                    value="${workout1.workoutName}"
                                                    readonly
                                                    />
                                            </div>
                                        </div>
                                        <div class="form-item row">
                                            <div class="col-3">
                                                <label for="txtWorkoutDate">Workout Date</label>
                                            </div>
                                            <div class="col-9 form-item-input">
                                                <select
                                                    id="txtWorkoutDate-${workout1.workoutID}"
                                                    name="txtWorkoutDate"
                                                    class="col-12"
                                                    disabled
                                                    >
                                                    <option value="1" ${workout1.workoutDate == 1 ? "selected": ""}>Monday</option>
                                                    <option value="2" ${workout1.workoutDate == 2 ? "selected": ""}>Tuesday</option>
                                                    <option value="3" ${workout1.workoutDate == 3 ? "selected": ""}>Wednesday</option>
                                                    <option value="4" ${workout1.workoutDate == 4 ? "selected": ""}>Thursday</option>
                                                    <option value="5" ${workout1.workoutDate == 5 ? "selected": ""}>Friday</option>
                                                    <option value="6" ${workout1.workoutDate == 6 ? "selected": ""}>Saturday</option>
                                                    <option value="7" ${workout1.workoutDate == 7 ? "selected": ""}>Sunday</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-item row">
                                            <div class="col-3">
                                                <label for="txtWorkoutDescription">Description</label>
                                            </div>
                                            <div class="col-9 form-item-input">
                                                <textarea
                                                    readonly
                                                    name="txtWorkoutDescription"
                                                    id="txtWorkoutDescription-${workout1.workoutID}"
                                                    cols="30"
                                                    rows="5"
                                                    placeholder="Enter workout description"
                                                    required
                                                    >${workout1.workoutDescription}</textarea>
                                            </div>
                                        </div>
                                        <hr />
                                        <div class="form-item row">
                                            <div class="col-2">
                                                <label for="txtListExercises">List Exercises</label>
                                            </div>
                                        </div>
        
                                        <table
                                            id="create-table-${workout1.workoutID}"
                                            class="hover table-content"
                                            style="width: 100%"
                                            >
                                            <thead class="pop-up-thead-table">
                                                <tr>
                                                    <th>Exercise</th>
                                                    <th>Order</th>
                                                    <th>Set</th>
                                                    <th>Rep</th>
                                                    <th>Weight</th>
                                                    <th>Duration</th>
                                                    <th>Instruction</th>
                                                </tr>
                                            </thead>
                                            <tbody class="pop-up-body-table">
                                                <c:forEach var="workoutExercise" items="${workout1.workoutExercisesCollection}">
                                                    <tr id = "workout-${workout1.workoutID}-exercise-${workoutExercise.workoutExercisesPK.exerciseID}">
                                                        <td data-id = "${workoutExercise.workoutExercisesPK.exerciseID}">${workoutExercise.workoutExercisesPK.exercise.exerciseName}</td>
                                                        <td>${workoutExercise.exerciseOrder}</td>
                                                        <td>${workoutExercise.set}</td>
                                                        <td>${workoutExercise.reps}</td>
                                                        <td>${workoutExercise.weight}</td>
                                                        <td>${workoutExercise.duration}</td>
                                                        <td>${workoutExercise.instruction}</td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </c:forEach>
                </div>
                </div>
            </form>
        </div>
        <!-- footer -->
        <%@include file="/view/general/footer.jsp" %>
        <script src="/CICOHealth/assets/scripts/formhandling.js"></script> 
        <!-- <script src="/CICOHealth/assets/scripts/popup.js"></script> -->
        <!-- <script src="/CICOHealth/assets/scripts/exerciseProgram/programDetails.js"></script> -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link
            rel="stylesheet"
            href="https://cdn.datatables.net/1.13.2/css/jquery.dataTables.min.css"
            />
    </body>
</html>
