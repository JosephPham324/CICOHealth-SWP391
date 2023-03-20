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

        <title>Update program</title>
    </head>

    <body>
        <%@include file="/view/general/navbar.jsp" %>

        <div class="container">
            <div class="create-exercise-program-header">
                <h1>Update Program</h1>
            </div>
            <form
                onsubmit="event.preventDefault();"
                action="create-exercise-program"
                method="post"
                name="create-exercise-program-form"
                class="create-exercise-program-form"
                id="create-exercise-program-form"
                >
                <div class="create-exercise-program-form-content" data-id="${program.programID}">
                    <div class="form-item row">
                        <div class="offset-2 col-2">
                            <label for="txtUsername">Program Name</label>
                        </div>
                        <div class="col-6 form-item-input">
                            <input value ="${program.programName}" id="txtProgramName" name="txtProgramName" placeholder="Enter program name" type="text" required >
                            <i  id="error_txtProgramName" style="color: red ; display: none">(*)Please not be empty</i>
                        </div>
                    </div>
                    <div class="form-item row">
                        <div class="offset-2 col-2">
                            <label for="txtProgramDescription">Description</label>
                        </div>
                        <div class="col-6 form-item-input">
                            <textarea name="txtProgramDescription" id="txtProgramDescription" cols="30" rows="5"
                                      placeholder="Enter description">${program.programDescription}</textarea>
                            <i  id="error_txtProgramDescription" style="color: red ; display: none">(*)Please not be empty</i>
                        </div>
                    </div>
                    <hr />
                    <div class="form-item row">
                        <div class="col-2">
                            <label for="txtPrice">List Workouts</label>
                        </div>
                    </div>
                    <c:forEach var="workout" items="${program.workoutCollection}">
                        <div class="card list-exercise-program-item" data-id="${workout.workoutID}" data-action="update">
                            <div
                                class="card-header btn"
                                data-toggle="collapse"
                                data-target="#workout-${workout.workoutID}"
                                >
                                ${workout.workoutName}
                            </div>
                            <div
                                data-action = "update"
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
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody class="pop-up-body-table">
                                        <c:forEach var="workoutExercise" items="${workout.workoutExercisesCollection}">
                                            <tr data-id="${workoutExercise.workoutExercisesPK.exerciseID}" data-action="update" id = "workout-${workout.workoutID}-exercise-${workoutExercise.workoutExercisesPK.exerciseID}">
                                                <td data-id = "${workoutExercise.workoutExercisesPK.exerciseID}">${workoutExercise.workoutExercisesPK.exercise.exerciseName}</td>
                                                <td>${workoutExercise.exerciseOrder}</td>
                                                <td>${workoutExercise.set}</td>
                                                <td>${workoutExercise.reps}</td>
                                                <td>${workoutExercise.weight}</td>
                                                <td>${workoutExercise.duration}</td>
                                                <td>${workoutExercise.instruction}</td>
                                                <td>
                                                    <a class="btn" id = "btn-edit-${workout.workoutID}-exercise-${workoutExercise.workoutExercisesPK.exerciseID}" data-target = "#workout-${workout.workoutID}-exercise-${workoutExercise.workoutExercisesPK.exerciseID}" onclick = "fillEditExerciseForm(this)">Edit</a>
                                                    <a class="btn" id = "btn-delete-${workout.workoutID}-exercise-${workoutExercise.workoutExercisesPK.exerciseID}" data-target = "#workout-${workout.workoutID}-exercise-${workoutExercise.workoutExercisesPK.exerciseID}" onclick = "deleteExercise(this)">Delete</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <div class="btn-add-exericse">
                                    <a
                                        href="#"
                                        class="btn btn-create-exercise-pop-up"
                                        id="btn-create-exercise-pop-up-${workout.workoutID}"
                                        data-target="#workout-${workout.workoutID}"
                                        onclick="selectedWorkoutIndex = '${workout.workoutID}';displayPopUp('create-exercise-pop-up');"
                                        >Add exercise</a
                                    >
                                </div>
                                <div>
                                    <a
                                        href="#"
                                        class="btn btn-danger"
                                        id="btn-delete-workout"
                                        data-target="#workout-${workout.workoutID}"
                                        onclick="removeWorkout(this)"
                                        >Remove Workout</a
                                    >
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <div class="btn-add" id="btn-add-workout">
                        <a name="submit" class="btn">Add workout</a>
                    </div>
                    <div class="btn-submit" id="btn-submit">
                        <button
                            name="submit"
                            type="submit"
                            class="btn"
                            id="btn-submit-program"
                            >
                            Submit
                        </button>
                    </div>
                </div>
            </form>

            <!-- pop-up-create-exercise -->
            <div class="pop-up create-exercise-pop-up" id="create-exercise-pop-up">
                <div class="create-exercise-overlay overlay" id="overlay"></div>
                <div class="pop-up-content create-exercise-pop-up-content">
                    <form
                        action="create-exercise"
                        method="post"
                        name="create-exercise-form"
                        id="create-exercise-form"
                        class="create-exercise-form"
                        >
                        <h2 class="txt-title-pop-up">Add Workout Exercise</h2>
                        <div class="form-group row">
                            <label
                                for="txtExerciseOrderPopUp"
                                class="offset-1 col-3 col-form-label"
                                >Exercise Name</label
                            >
                            <div class="col-7">
                                <select id="select-exercise" class="form-control"></select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label
                                for="txtExerciseOrderPopUp"
                                class="offset-1 col-3 col-form-label"
                                >Exercise Order</label
                            >
                            <div class="col-7">
                                <input
                                    id="txtExerciseOrderPopUp"
                                    name="txtExerciseOrderPopUp"
                                    type="text"
                                    placeholder="Enter exercise order"
                                    class="form-control"
                                    />
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="txtSetPopUp" class="offset-1 col-3 col-form-label"
                                   >Set</label
                            >
                            <div class="col-7">
                                <input
                                    id="txtSetPopUp"
                                    name="txtSetPopUp"
                                    type="text"
                                    class="form-control"
                                    placeholder="Enter set number"
                                    />
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="txtRepPopUp" class="offset-1 col-3 col-form-label"
                                   >Rep</label
                            >
                            <div class="col-7">
                                <input
                                    id="txtRepPopUp"
                                    name="txtRepPopUp"
                                    type="text"
                                    class="form-control"
                                    placeholder="Enter rep with format XX/XX/XX..."
                                    />
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="txtWeightPopUp" class="offset-1 col-3 col-form-label"
                                   >Weight</label
                            >
                            <div class="col-7">
                                <input
                                    id="txtWeightPopUp"
                                    name="txtWeightPopUp"
                                    type="text"
                                    class="form-control"
                                    placeholder="Enter weight with format XX/XX/XX..."
                                    />
                            </div>
                        </div>
                        <div class="form-group row">
                            <label
                                for="txtDurationPopUp"
                                class="offset-1 col-3 col-form-label"
                                >Duration</label
                            >
                            <div class="col-7">
                                <input
                                    id="txtDurationPopUp"
                                    name="txtDurationPopUp"
                                    type="text"
                                    class="form-control"
                                    placeholder="Enter duration"
                                    />
                            </div>
                        </div>
                        <div class="form-group row">
                            <label
                                for="txtInstructionPopUp"
                                class="offset-1 col-3 col-form-label"
                                >Instruction</label
                            >
                            <div class="col-7">
                                <textarea
                                    name="txtInstructionPopUp"
                                    id="txtInstructionPopUp"
                                    cols="30"
                                    rows="5"
                                    placeholder="Enter instruction"
                                    ></textarea>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="offset-5 col-2">
                                <button
                                    name="btn-submit"
                                    type="submit"
                                    class="btn btn-submit"
                                    id="btn-submit"
                                    >
                                    Submit
                                </button>
                            </div>
                            <div class="col-2">
                                <input type="reset" value="Clear" class="btn btn-submit" />
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <!-- pop-up-update-exercise -->
            <div class="pop-up create-exercise-pop-up" id="update-exercise-pop-up">
                <div class="create-exercise-overlay overlay"></div>
                <div class="pop-up-content create-exercise-pop-up-content">
                    <form
                        action="create-exercise"
                        method="post"
                        name="update-exercise-form"
                        id="update-exercise-form"
                        class="create-exercise-form"
                        >
                        <input type="hidden" name="target-row" id="target-row" />
                        <h2 class="txt-title-pop-up">Update Workout Exercise</h2>
                        <div class="form-group row">
                            <label
                                for="txtExerciseOrderPopUp"
                                class="offset-1 col-3 col-form-label"
                                >Exercise Name</label
                            >
                            <div class="col-7">
                                <select
                                    id="select-exercise-update"
                                    class="form-control"
                                    ></select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label
                                for="txtExerciseOrderPopUp"
                                class="offset-1 col-3 col-form-label"
                                >Exercise Order</label
                            >
                            <div class="col-7">
                                <input
                                    id="txtExerciseOrderUpdate"
                                    name="txtExerciseOrderPopUp"
                                    type="text"
                                    placeholder="Enter exercise order"
                                    class="form-control"
                                    />
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="txtSetPopUp" class="offset-1 col-3 col-form-label"
                                   >Set</label
                            >
                            <div class="col-7">
                                <input
                                    id="txtSetUpdate"
                                    name="txtSetPopUp"
                                    type="text"
                                    class="form-control"
                                    placeholder="Enter set number"
                                    />
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="txtRepUpdate" class="offset-1 col-3 col-form-label"
                                   >Rep</label
                            >
                            <div class="col-7">
                                <input
                                    id="txtRepUpdate"
                                    name="txtRepPopUp"
                                    type="text"
                                    class="form-control"
                                    placeholder="Enter rep with format XX/XX/XX..."
                                    />
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="txtWeightUpdate" class="offset-1 col-3 col-form-label"
                                   >Weight</label
                            >
                            <div class="col-7">
                                <input
                                    id="txtWeightUpdate"
                                    name="txtWeightPopUp"
                                    type="text"
                                    class="form-control"
                                    placeholder="Enter weight with format XX/XX/XX..."
                                    />
                            </div>
                        </div>
                        <div class="form-group row">
                            <label
                                for="txtDurationUpdate"
                                class="offset-1 col-3 col-form-label"
                                >Duration</label
                            >
                            <div class="col-7">
                                <input
                                    id="txtDurationUpdate"
                                    name="txtDurationPopUp"
                                    type="text"
                                    class="form-control"
                                    placeholder="Enter duration"
                                    />
                            </div>
                        </div>
                        <div class="form-group row">
                            <label
                                for="txtInstructionUpdate"
                                class="offset-1 col-3 col-form-label"
                                >Instruction</label
                            >
                            <div class="col-7">
                                <textarea
                                    name="txtInstructionUpdate"
                                    id="txtInstructionUpdate"
                                    cols="30"
                                    rows="5"
                                    placeholder="Enter instruction"
                                    ></textarea>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="offset-5 col-2">
                                <button
                                    name="btn-submit"
                                    type="submit"
                                    class="btn btn-submit"
                                    id="btn-submit"
                                    >
                                    Submit
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
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
        <script src="/CICOHealth/assets/scripts/formhandling.js"></script>
        <script src="/CICOHealth/assets/scripts/popup.js"></script>
        <script src="/CICOHealth/assets/scripts/exerciseProgram/programUpdate.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link
            rel="stylesheet"
            href="https://cdn.datatables.net/1.13.2/css/jquery.dataTables.min.css"
            />
    </body>
</html>
