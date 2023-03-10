<%-- 
    Document   : createProgram
    Created on : Mar 8, 2023, 8:10:25 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

    <link rel="stylesheet" href="/CICOHealth/assets/css/Homepage.css">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="/CICOHealth/assets/sass/main/createexerciseprogram.css">

    <title>Create Program</title>
</head>

<body>
    <%@include file = "/view/general/navbar.jsp"%>

    <div class="container">
        <div class="create-exercise-program-header">
            <h1>Create Exercise Program</h1>
        </div>
        <form action="create-exercise-program" method="post" name="create-exercise-program-form"
            class="create-exercise-program-form">
            <div class="create-exercise-program-form-content">
                <div class="form-item row">
                    <div class="offset-2 col-2">
                        <label for="txtUsername">Program Name</label>
                    </div>
                    <div class="col-6 form-item-input">
                        <input id="txtProgramName" name="txtProgramName" placeholder="Enter program name" type="text">
                    </div>
                </div>
                <div class="form-item row">
                    <div class="offset-2 col-2">
                        <label for="txtProgramDescription">Description</label>
                    </div>
                    <div class="col-6 form-item-input">
                        <textarea name="txtProgramDescription" id="txtProgramDescription" cols="30" rows="5"
                            placeholder="Enter description"></textarea>
                    </div>
                </div>
                <div class="form-item row">
                    <div class="offset-2 col-2">
                        <label for="txtPrice">Price</label>
                    </div>
                    <div class="col-6 form-item-input">
                        <input id="txtPrice" name="txtPrice" placeholder="Enter price" type="text">
                    </div>
                </div>
                <hr>
                <div class="form-item row">
                    <div class="col-2">
                        <label for="txtPrice">List Workouts</label>
                    </div>
                </div>
                <div class="card list-exercise-program-item">
                    <div class="card-header btn" data-toggle="collapse" data-target="#program1">
                        Workout 1
                    </div>
                    <div class="card-body collapse" data-toggle="collapse" aria-expanded="false" id="program1">
                        <div class="form-item row">
                            <div class="offset-2 col-2">
                                <label for="txtWorkoutID">WorkoutID</label>
                            </div>
                            <div class="col-6 form-item-input">
                                <input id="txtWorkoutID" name="txtWorkoutID" placeholder="Enter workout ID" type="text">
                            </div>
                        </div>
                        <div class="form-item row">
                            <div class="offset-2 col-2">
                                <label for="txtProgramID">ProgramID</label>
                            </div>
                            <div class="col-6 form-item-input">
                                <input id="txtProgramID" name="txtProgramID" placeholder="Enter program ID" type="text">
                            </div>
                        </div>
                        <div class="form-item row">
                            <div class="offset-2 col-2">
                                <label for="txtWorkoutName">WorkoutName</label>
                            </div>
                            <div class="col-6 form-item-input">
                                <input id="txtWorkoutName" name="txtWorkoutName" placeholder="Enter workout name"
                                    type="text">
                            </div>
                        </div>
                        <div class="form-item row">
                            <div class="offset-2 col-2">
                                <label for="txtWorkoutDate">WorkoutDate</label>
                            </div>
                            <div class="col-6 form-item-input">
                                <input id="txtWorkoutDate" name="txtWorkoutDate" placeholder="Enter workout date"
                                    type="text">
                            </div>
                        </div>
                        <div class="form-item row">
                            <div class="offset-2 col-2">
                                <label for="txtWorkoutDescription">WorkoutDescription</label>
                            </div>
                            <div class="col-6 form-item-input">
                                <textarea name="txtWorkoutDescription" id="txtWorkoutDescription" cols="30" rows="5"
                                    placeholder="Enter workout description"></textarea>
                            </div>
                        </div>
                        <hr>

                        <div class="form-item row">
                            <div class="col-2">
                                <label for="txtListExercises">List Exercises</label>
                            </div>
                        </div>

                        <table id="create-table" class="hover table-content" style="width: 100%">
                            <thead class="pop-up-thead-table">
                                <tr>
                                    <th>Exercise Order</th>
                                    <th>Set</th>
                                    <th>Rep</th>
                                    <th>Weight</th>
                                    <th>Duration</th>
                                    <th>Instruction</th>
                                </tr>
                            </thead>
                            <tbody class="pop-up-body-table">
                                <tr>
                                    <td>AAA</td>
                                    <td>3</td>
                                    <td>30/30/40</td>
                                    <td>20/25/30</td>
                                    <td>BBB</td>
                                    <td>CCC</td>
                                </tr>
                                <tr>
                                    <td>AAA</td>
                                    <td>3</td>
                                    <td>30/30/40</td>
                                    <td>20/25/30</td>
                                    <td>BBB</td>
                                    <td>CCC</td>
                                </tr>
                                <tr>
                                    <td>AAA</td>
                                    <td>3</td>
                                    <td>30/30/40</td>
                                    <td>20/25/30</td>
                                    <td>BBB</td>
                                    <td>CCC</td>
                                </tr>
                                <tr>
                                    <td>AAA</td>
                                    <td>3</td>
                                    <td>30/30/40</td>
                                    <td>20/25/30</td>
                                    <td>BBB</td>
                                    <td>CCC</td>
                                </tr>
                                <tr>
                                    <td>AAA</td>
                                    <td>3</td>
                                    <td>30/30/40</td>
                                    <td>20/25/30</td>
                                    <td>BBB</td>
                                    <td>CCC</td>
                                </tr>
                                <tr>
                                    <td>AAA</td>
                                    <td>3</td>
                                    <td>30/30/40</td>
                                    <td>20/25/30</td>
                                    <td>BBB</td>
                                    <td>CCC</td>
                                </tr>
                                <tr>
                                    <td>AAA</td>
                                    <td>3</td>
                                    <td>30/30/40</td>
                                    <td>20/25/30</td>
                                    <td>BBB</td>
                                    <td>CCC</td>
                                </tr>
                                <tr>
                                    <td>AAA</td>
                                    <td>3</td>
                                    <td>30/30/40</td>
                                    <td>20/25/30</td>
                                    <td>BBB</td>
                                    <td>CCC</td>
                                </tr>

                            </tbody>
                        </table>
                        <div class="btn-add-exericse">
                            <a href="#" class="btn btn-create-exercise-pop-up" id="btn-create-exercise-pop-up">Add
                                exercise</a>
                        </div>
                    </div>
                </div>

                <div class="btn-submit">
                    <button name="submit" type="submit" class="btn">Submit</button>
                </div>
            </div>
        </form>
        <!-- pop-up-create-exercise -->
        <div class="pop-up create-exercise-pop-up" id="create-exercise-pop-up">
            <div class="create-exercise-overlay overlay" id="overlay"></div>
            <div class="pop-up-content create-exercise-pop-up-content">
                <form action="create-exercise" method="post" name="create-exercise-form" id="create-exercise-form"
                    class="create-exercise-form">
                    <h2 class="txt-title-pop-up">Create Exercise</h2>
                    <div class="form-group row">
                        <label for="txtExerciseOrderPopUp" class="offset-1 col-3 col-form-label">Exercise Order</label>
                        <div class="col-7">
                            <input id="txtExerciseOrderPopUp" name="txtExerciseOrderPopUp" type="text"
                                placeholder="Enter exercise order" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="txtSetPopUp" class="offset-1 col-3 col-form-label">Set</label>
                        <div class="col-7">
                            <input id="txtSetPopUp" name="txtSetPopUp" type="text" class="form-control"
                                placeholder="Enter set number">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="txtRepPopUp" class="offset-1 col-3 col-form-label">Rep</label>
                        <div class="col-7">
                            <input id="txtRepPopUp" name="txtRepPopUp" type="text" class="form-control"
                                placeholder="Enter rep with format XX/XX/XX...">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="txtWeightPopUp" class="offset-1 col-3 col-form-label">Weight</label>
                        <div class="col-7">
                            <input id="txtWeightPopUp" name="txtWeightPopUp" type="text" class="form-control"
                                placeholder="Enter weight with format XX/XX/XX...">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="txtDurationPopUp" class="offset-1 col-3 col-form-label">Duration</label>
                        <div class="col-7">
                            <input id="txtDurationPopUp" name="txtDurationPopUp" type="text" class="form-control"
                                placeholder="Enter duration">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="txtInstructionPopUp" class="offset-1 col-3 col-form-label">Instruction</label>
                        <div class="col-7">
                            <textarea name="txtInstructionPopUp" id="txtInstructionPopUp" cols="30" rows="5"
                                placeholder="Enter instruction"></textarea>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="offset-5 col-2">
                            <button name="btn-submit" type="submit" class="btn btn-submit"
                                id="btn-submit">Submit</button>
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

    <script src="/CICOHealth/assets/scripts/popup.js"></script>
    <script src="/CICOHealth/assets/scripts/createProgram.js"></script>
    <script src="https://cdn.datatables.net/1.13.2/js/jquery.dataTables.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</body>

</html>
