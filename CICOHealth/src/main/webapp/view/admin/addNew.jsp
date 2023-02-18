<%-- Document : register.jsp Created on : Feb 7, 2023, 7:18:37 AM Author : Pham
Nhat Quang CE170036 (FPTU CANTHO) --%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css"
            integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
            crossorigin="anonymous"
            />
        <link
            rel="stylesheet"
            href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
            />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <style>
            body {
                width: 100vw;
                height: 100vh;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
            }
        </style>
        <title>Add</title>
    </head>
    <body>
        <script src="https://accounts.google.com/gsi/client" async defer></script>

        <form action="/CICOHealth/admin/user-management" method="post" id="register-form">
            <div class="form-group row">
                <div class="col-12">
                    <h1 style="text-align: center;">Creation Account</h1>
                </div>
            </div>
            <div class="form-group row">
                <label for="txtUsername" class="col-4 col-form-label">Username</label>
                <div class="col-8">
                    <input
                        required="required"
                        id="txtUsername"
                        name="txtUsername"
                        placeholder="Enter username"
                        type="text"
                        class="form-control"
                        readonly="true"
                        />
                </div>
            </div>
            <div class="form-group row" id="password-field">
                <label for="txtPassword" class="col-4 col-form-label">Password</label>
                <div class="col-8">
                    <input
                        required="required"
                        id="txtPassword"
                        name="txtPassword"
                        placeholder="Enter password"
                        type="password"
                        class="form-control"
                        aria-describedby="txtPasswordHelpBlock"
                        readonly="true"
                        />
                    <span id="txtPasswordHelpBlock" class="form-text text-muted"></span>
                </div>
            </div>
            <div class="form-group row">
                <label for="txtFirstName" class="col-4 col-form-label"
                       >First name</label
                >
                <div class="col-8">
                    <input
                        required="required"
                        id="txtFirstName"
                        name="txtFirstName"
                        placeholder="Enter your first name"
                        type="text"
                        class="form-control"
                        />
                </div>
            </div>
            <div class="form-group row">
                <label for="txtLastName" class="col-4 col-form-label">Last name</label>
                <div class="col-8">
                    <input
                        required="required"
                        id="txtLastName"
                        name="txtLastName"
                        placeholder="Enter your last name"
                        type="text"
                        class="form-control"
                        />
                </div>
            </div>
            <div class="form-group row">
                <label for="txtFirstName" class="col-4 col-form-label"
                       >Type</label
                >
                <div class="col-8">
                    <select id="cars" name="cars" style="
                            border: 0.5px solid cornflowerblue;
                            width: 273px;
                            height: 38px;"onchange="getValue(this)">
                        <option value="0">---</option>
                        <option value="1">ME</option>
                        <option value="2">FE</option>
                        <option value="3">AD</option>
                    </select>
                </div>
            </div>

            <input type="hidden" name="healthReg" value="true" id="register-health" />
            <div class="form-group row">
                <div class="offset-4 col-8">
                    <button name="submit" type="submit" class="btn btn-primary">
                        Submit
                    </button>
                </div>
            </div>
        </form>


        <script>
            function getValue(sel) {
                if (sel.value === '1') {
                    var name = $("#txtFirstName").val();
                    var lastName = $("#txtLastName").val();
                    var new_userID = 'ME' + name[0] + name[1] + "0000000";

                    $("#txtUsername").val(new_userID);
                    $("#txtPassword").val(new_userID);

                } else if (sel.value === '2') {
                    var name = $("#txtFirstName").val();
                    var lastName = $("#txtLastName").val();
                    var new_userID = 'FE' + name[0] + name[1] + "0000000";

                    $("#txtUsername").val(new_userID);
                    $("#txtPassword").val(new_userID);
                } else if (sel.value === '3') {
                    var name = $("#txtFirstName").val();
                    var lastName = $("#txtLastName").val();
                    var new_userID = 'AD' + name[0] + name[1] + "0000000";

                    $("#txtUsername").val(new_userID);
                    $("#txtPassword").val(new_userID);
                }



            }



        </script>

        <script src="/CICOHealth/assets/scripts/formhandling.js"></script>
        <script src="/CICOHealth/assets/scripts/register.js"></script>
    </body>
</html>
