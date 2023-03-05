<%-- Document : register.jsp Created on : Feb 7, 2023, 7:18:37 AM Author : Pham Nhat Quang CE170036 (FPTU CANTHO) --%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css"
              integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
              crossorigin="anonymous" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
        <style>
            body {
                width: 100vw;
                height: 100vh;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
            }

            .error {
                color: red;
                font-style: initial;
                font-weight: bold;
            }

            input {
                width: 300px !important;
            }
        </style>
        <title>Register</title>
    </head>

    <body>
        <script src="https://accounts.google.com/gsi/client" async defer></script>

        <form action="register" method="post" id="register-form">
            <div class="form-group row">
                <div class="col-12">
                    <h1 style="text-align: center;">Register</h1>
                </div>
            </div>
            <div class="form-group row">
                <label for="txtUsername" class="col-4 col-form-label">Username</label>
                <div class="col-8">
                    <input required="required" id="txtUsername" name="txtUsername" placeholder="Enter username"
                           type="text" class="form-control" />
                </div>
            </div>
            <div class="form-group row" id="password-field">
                <label for="txtPassword" class="col-4 col-form-label">Password</label>
                <div class="col-8">
                    <input required="required" id="txtPassword" name="txtPassword" placeholder="Enter password"
                           type="password" class="form-control" aria-describedby="txtPasswordHelpBlock" />
                </div>
            </div>
            <div class="form-group row">
                <label for="txtFirstName" class="col-4 col-form-label">First name</label>
                <div class="col-8">
                    <input required="required" id="txtFirstName" name="txtFirstName"
                           placeholder="Enter your first name" type="text" class="form-control" />
                </div>
            </div>
            <div class="form-group row">
                <label for="txtLastName" class="col-4 col-form-label">Last name</label>
                <div class="col-8">
                    <input required="required" id="txtLastName" name="txtLastName"
                           placeholder="Enter your last name" type="text" class="form-control" />
                </div>
            </div>
            <div class="form-group row">
                <label for="txtEmail" class="col-4 col-form-label">Email</label>
                <div class="col-8">
                    <input required="required" id="txtEmail" name="txtEmail" placeholder="Enter your email address"
                           type="text" class="form-control" />
                </div>
            </div>
            <div class="form-group row">
                <label for="txtPhone" class="col-4 col-form-label">Phone</label>
                <div class="col-8">
                    <input required="required" id="txtPhone" name="txtPhone" placeholder="Enter your phone number"
                           type="text" class="form-control" />
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
            <div id="google-sign-up" style="
                 display: flex;
                 align-items: center;
                 justify-content: center;
                 margin: 10px;
                 ">
                <div id="g_id_onload"
                     data-client_id="641593933823-qlfnb62fuif3fcsu01b0hf9vijetfepj.apps.googleusercontent.com"
                     data-context="signup" data-ux_mode="popup"
                     data-login_uri="http://localhost:8080/CICOHealth/register" data-auto_prompt="false"
                     data-callback="handleCredentialResponse"></div>
                <div class="g_id_signin" data-type="standard" data-shape="pill" data-theme="filled_blue"
                     data-text="signup_with" data-size="large" data-logo_alignment="left"></div>
            </div>
        </form>
        
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.js"></script>
        
        <script src="/CICOHealth/assets/scripts/formhandling.js"></script>
        <script src="/CICOHealth/assets/scripts/register.js"></script>
    </body>
</html>