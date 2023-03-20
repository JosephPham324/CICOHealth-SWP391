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

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="/CICOHealth/assets/sass/main/createexerciseprogram.css">
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>


        <title>Create Program</title>
    </head>

    <body>
        <div class="container">
            <div class="create-exercise-program-header">
                <h1>Create Exercise Program</h1>
            </div>
            <form action="create-exercise-program" method="post" name="create-exercise-program-form"
                  class="create-exercise-program-form" id = "create-exercise-program-form">
                <div class="create-exercise-program-form-content">
                    <div class="form-item row">
                        <div class="offset-2 col-2">
                            <label for="txtUsername">Program Name</label>
                        </div>
                        <div class="col-6 form-item-input">
                            <input id="txtProgramName" name="txtProgramName" placeholder="Enter program name" type="text" required >
                            <i  id="error_txtProgramName" style="color: red ; display: none">(*)Please not be empty</i>
                        </div>
                    </div>
                    <div class="form-item row">
                        <div class="offset-2 col-2">
                            <label for="txtProgramDescription">Description</label>
                        </div>
                        <div class="col-6 form-item-input">
                            <textarea name="txtProgramDescription" id="txtProgramDescription" cols="30" rows="5"
                                      placeholder="Enter description"></textarea>
                                      <i  id="error_txtProgramDescription" style="color: red ; display: none">(*)Please not be empty</i>
                        </div>
                    </div>
                    <hr>
                    <div class="form-item row">
                        <div class="col-2">
                            <label for="txtPrice">List Workouts</label>
                        </div>
                    </div>
                    <div class="btn-add" id = "btn-add-workout">
                        <a name="submit" class="btn">Add workout</a>
                    </div>
                    <div class="btn-submit" id = "btn-submit">
                        <button name="submit" type="submit" class="btn" id = "btn-submit-program">Submit</button>
                    </div>
                </div>
            </form>


            <!-- pop-up-create-exercise -->
            <div class="pop-up create-exercise-pop-up" id="create-exercise-pop-up">
                <div class="create-exercise-overlay overlay" id="overlay"></div>
                <div class="pop-up-content create-exercise-pop-up-content">
                     <form action="create-exercise" method="post" name="create-exercise-form" id="create-exercise-form"
                          class="create-exercise-form">
                        <h2 class="txt-title-pop-up">Add Workout Exercise</h2>
                        <div class="form-group row">
                            <label for="txtExerciseOrderPopUp" class="offset-1 col-3 col-form-label">Exercise Name</label>
                            <div class="col-7">
                                <select id="select-exercise" class="form-control">                                
                                </select>
                                <i id="error-exercise-name" style="color: red ; display: none"></i>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="txtExerciseOrderPopUp" class="offset-1 col-3 col-form-label">Exercise Order</label>
                            <div class="col-7">
                                <input id="txtExerciseOrderPopUp" name="txtExerciseOrderPopUp" type="text"
                                       placeholder="Enter exercise order" class="form-control">
                                <i id="error-exercise-order" style="color: red ; display: none"></i>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="txtSetPopUp" class="offset-1 col-3 col-form-label">Set</label>
                            <div class="col-7">
                                <input id="txtSetPopUp" name="txtSetPopUp" type="text" class="form-control"
                                       placeholder="Enter set number">
                                <i id="error-exercise-set" style="color: red ; display: none"></i>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="txtRepPopUp" class="offset-1 col-3 col-form-label">Rep</label>
                            <div class="col-7">
                                <input id="txtRepPopUp" name="txtRepPopUp" type="text" class="form-control"
                                       placeholder="Enter rep with format XX/XX/XX...">
                                <i id="error-exercise-rep" style="color: red ; display: none"></i>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="txtWeightPopUp" class="offset-1 col-3 col-form-label">Weight</label>
                            <div class="col-7">
                                <input id="txtWeightPopUp" name="txtWeightPopUp" type="text" class="form-control"
                                       placeholder="Enter weight with format XX/XX/XX...">
                                <i id="error-exercise-weight" style="color: red ; display: none"></i>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="txtDurationPopUp" class="offset-1 col-3 col-form-label">Duration</label>
                            <div class="col-7">
                                <input id="txtDurationPopUp" name="txtDurationPopUp" type="text" class="form-control"
                                       placeholder="Enter duration">
                                <i id="error-exercise-duration" style="color: red ; display: none"></i>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="txtInstructionPopUp" class="offset-1 col-3 col-form-label">Instruction</label>
                            <div class="col-7">
                                <textarea name="txtInstructionPopUp" id="txtInstructionPopUp" cols="30" rows="5"
                                          placeholder="Enter instruction"></textarea>
                                <i id="error-exercise-instruction" style="color: red ; display: none"></i>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="offset-5 col-2">
                                <button name="btn-submit" type="submit" class="btn btn-submit"
                                        id="btn-submit">Submit</button>
                            </div>
                            <div class="col-2">
                                <input type="reset" value="Clear" class="btn btn-submit">
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <!-- pop-up-update-exercise -->
            <div class="pop-up create-exercise-pop-up" id="update-exercise-pop-up">
                <div class="create-exercise-overlay overlay"></div>
                <div class="pop-up-content create-exercise-pop-up-content">
                    <form action="create-exercise" method="post" name="update-exercise-form" id="update-exercise-form"
                          class="create-exercise-form">
                        <input type="hidden" name="target-row" id="target-row">
                        <h2 class="txt-title-pop-up">Update Workout Exercise</h2>
                        <div class="form-group row">
                            <label for="txtExerciseOrderPopUp" class="offset-1 col-3 col-form-label">Exercise Name</label>
                            <div class="col-7">
                                <select id = "select-exercise-update" class="form-control">
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="txtExerciseOrderPopUp" class="offset-1 col-3 col-form-label">Exercise Order</label>
                            <div class="col-7">
                                <input id="txtExerciseOrderUpdate" name="txtExerciseOrderPopUp" type="text"
                                       placeholder="Enter exercise order" class="form-control">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="txtSetPopUp" class="offset-1 col-3 col-form-label">Set</label>
                            <div class="col-7">
                                <input id="txtSetUpdate" name="txtSetPopUp" type="text" class="form-control"
                                       placeholder="Enter set number">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="txtRepUpdate" class="offset-1 col-3 col-form-label">Rep</label>
                            <div class="col-7">
                                <input id="txtRepUpdate" name="txtRepPopUp" type="text" class="form-control"
                                       placeholder="Enter rep with format XX/XX/XX...">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="txtWeightUpdate" class="offset-1 col-3 col-form-label">Weight</label>
                            <div class="col-7">
                                <input id="txtWeightUpdate" name="txtWeightPopUp" type="text" class="form-control"
                                       placeholder="Enter weight with format XX/XX/XX...">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="txtDurationUpdate" class="offset-1 col-3 col-form-label">Duration</label>
                            <div class="col-7">
                                <input id="txtDurationUpdate" name="txtDurationPopUp" type="text" class="form-control"
                                       placeholder="Enter duration">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="txtInstructionUpdate" class="offset-1 col-3 col-form-label">Instruction</label>
                            <div class="col-7">
                                <textarea name="txtInstructionUpdate" id="txtInstructionUpdate" cols="30" rows="5"
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

        <%@include file = "/view/general/footer.jsp"%>
        <script src="/CICOHealth/assets/scripts/popup.js"></script>
        <script src="/CICOHealth/assets/scripts/formhandling.js"></script>
        <script src="/CICOHealth/assets/scripts/exerciseProgram/programCreate.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script src="/CICOHealth/assets/scripts/exerciseProgram/validateProgramForm.js"></script>
    </body>

</html>