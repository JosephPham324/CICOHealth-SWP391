<%-- Document : createProgram Created on : Mar 8, 2023, 8:10:25 AM Author :
Admin --%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

        <title>Create Program</title>
    </head>

    <body>
        <div class="container">
            <div class="create-exercise-program-header">
                <h1>Exercise Program Details</h1>
            </div>
            <form
                action="create-exercise-program"
                method="post"
                name="create-exercise-program-form"
                class="create-exercise-program-form"
                id="create-exercise-program-form"
                >
                <div class="create-exercise-program-form-content">
                    <div class="form-item row">
                        <div class="offset-2 col-2">
                            <label for="txtUsername">Program Name</label>
                        </div>
                        <div class="col-6 form-item-input">
                            <h3 id="program-name">${program.programName}</h3>
                        </div>
                    </div>
                    <div class="form-item row">
                        <div class="offset-2 col-2">
                            <label for="txtProgramDescription">Description</label>
                        </div>
                        <div class="col-6 form-item-input">
                            <p id="program-description">${program.programDescription}</p>
                        </div>
                    </div>
                    <hr />
                    <div class="form-item row">
                        <div class="col-2">
                            <label for="txtPrice">List Workouts</label>
                        </div>
                    </div>
                    <c:forEach var="workout" items="${program.workoutCollection}">
                        <div class="card list-exercise-program-item">
                            <div
                                class="card-header btn"
                                data-toggle="collapse"
                                data-target="#workout-${workout.workoutID}"
                                >
                                ${workout.workoutName}
                            </div>
                            <div
                                class="card-body collapse workout"
                                data-toggle="collapse"
                                aria-expanded="false"
                                id="workout-${workout.workoutID}"
                                data-id="${workout.workoutID}"
                                >
                                <div class="form-item row">
                                    <div class="col-3">
                                        <label for="txtWorkoutName">Workout Name</label>
                                    </div>
                                    <div class="col-9 form-item-input">
                                        <input
                                            id="txtWorkoutName-${workout.workoutID}"
                                            name="txtWorkoutName"
                                            placeholder="Enter workout name"
                                            type="text"
                                            required="required"
                                            value="${workout.workoutName}"
                                            />
                                    </div>
                                </div>
                                <div class="form-item row">
                                    <div class="col-3">
                                        <label for="txtWorkoutDate">Workout Date</label>
                                    </div>
                                    <div class="col-9 form-item-input">
                                        <select
                                            id="txtWorkoutDate-${workout.workoutID}"
                                            name="txtWorkoutDate"
                                            class="col-12"
                                            >
                                            <option value="1" ${workout.workoutDate == 1 ? "selected": ""}>Monday</option>
                                            <option value="2" ${workout.workoutDate == 2 ? "selected": ""}>Tuesday</option>
                                            <option value="3" ${workout.workoutDate == 3 ? "selected": ""}>Wednesday</option>
                                            <option value="4" ${workout.workoutDate == 4 ? "selected": ""}>Thursday</option>
                                            <option value="5" ${workout.workoutDate == 5 ? "selected": ""}>Friday</option>
                                            <option value="6" ${workout.workoutDate == 6 ? "selected": ""}>Saturday</option>
                                            <option value="7" ${workout.workoutDate == 7 ? "selected": ""}>Sunday</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-item row">
                                    <div class="col-3">
                                        <label for="txtWorkoutDescription">Description</label>
                                    </div>
                                    <div class="col-9 form-item-input">
                                        <textarea
                                            name="txtWorkoutDescription"
                                            id="txtWorkoutDescription-${workout.workoutID}"
                                            cols="30"
                                            rows="5"
                                            placeholder="Enter workout description"
                                            required
                                            >${workout.workoutDescription}</textarea>
                                    </div>
                                </div>
                                <hr />
                                <div class="form-item row">
                                    <div class="col-2">
                                        <label for="txtListExercises">List Exercises</label>
                                    </div>
                                </div>

                                <table
                                    id="create-table-${workout.workoutID}"
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
                                        <c:forEach var="workoutExercise" items="${workout.workoutExercisesCollection}">
                                            <tr id = "workout-${workout.workoutID}-exercise-${workoutExercise.workoutExercisesPK.exerciseID}">
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
            </form>
        </div>

        <!-- footer -->
        <div class="wrapper">
            <footer>
                <div class="row block-footer">
                    <div class="offset-1 col-3 footer-content">
                        <span class="school-name"
                              ><strong>FPT University Can Tho</strong></span
                        >
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
                        <p>
                            © 2023 All rights reserved. Our website services, content, and
                            products are for informational purposes only. Nutrition does not
                            provide medical advice, diagnosis, or treatment.
                        </p>
                    </div>
                </div>
            </footer>
        </div>
        <!-- <script src="/CICOHealth/assets/scripts/formhandling.js"></script> -->
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
