<%-- Document : register.jsp Created on : Feb 7, 2023, 7:18:37 AM Author : Pham Nhat Quang CE170036 (FPTU CANTHO) --%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <link rel="stylesheet" href="/CICOHealth/assets/sass/main/loginscss.css" />       
        <title>Register</title>
    </head>

    <body>
        <%@include file="/view/segments/message.jsp" %>

        <script src="https://accounts.google.com/gsi/client" async defer></script>
        
        <div class="container">
            <div class="login-left">
                <div class="login-header register-header">
                    <h1>Welcome to Our Application</h1>
                    <p>Please register to login into the platform</p>
                </div>
                <form action="register" method="post" id="register-form" class="login-form">
                    <div class="login-form-content">
                        <div class="form-group row">
                            <div class="col-12">
                                <h1 style="text-align: center;">Register</h1>
                            </div>
                        </div>
                        <div class="form-item">
                            <label for="txtUsername" class="col-4 col-form-label">Username</label>
                            <div class="col-8">
                                <input
                                    required="required"
                                    id="txtUsername"
                                    name="txtUsername"
                                    placeholder="Enter username"
                                    type="text"
                                    class="form-control"
                                    />
                            </div>
                        </div>
                        <div class="form-item" id="password-field">
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
                                    />
                                <span id="txtPasswordHelpBlock" class="form-text text-muted"
                                      >Password must be between 6 to 20 characters!</span
                                >
                            </div>
                        </div>
                        <div class="form-item">
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
                        <div class="form-item">
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
                        <div class="form-item">
                            <label for="txtEmail" class="col-4 col-form-label">Email</label>
                            <div class="col-8">
                                <input
                                    required="required"
                                    id="txtEmail"
                                    name="txtEmail"
                                    placeholder="Enter your email address"
                                    type="text"
                                    class="form-control"
                                    />
                            </div>
                        </div>
                        <div class="form-item">
                            <label for="txtPhone" class="col-4 col-form-label">Phone</label>
                            <div class="col-8">
                                <input
                                    required="required"
                                    id="txtPhone"
                                    name="txtPhone"
                                    placeholder="Enter your phone number"
                                    type="text"
                                    class="form-control"
                                    />
                            </div>
                        </div>
                        <input type="hidden" name="healthReg" value="true" id="register-health" />
                        <div class="form-item">
                            <div style="display: flex; align-items: center;">
                                <button name="submit" type="submit" class="btn btn-primary">REGISTER</button>
                                <div class="register-form-footer">
                                    <div id="google-sign-up" style="display: flex; align-items: center; justify-content: center; margin: 10px;">
                                        <div id="g_id_onload" data-client_id="641593933823-qlfnb62fuif3fcsu01b0hf9vijetfepj.apps.googleusercontent.com" data-context="signup" data-ux_mode="popup" data-login_uri="http://localhost:8080/CICOHealth/register" data-auto_prompt="false" data-callback="handleCredentialResponse"></div>
                                        <div class="g_id_signin" data-type="standard" data-shape="pill" data-theme="filled_blue" data-text="signup_with" data-size="large" data-logo_alignment="left"></div>
                                    </div>
                                </div>
                            </div>
                            
                    </div>

                    
                    </div>

                    
                    
                </form>
            </div>
            <div class="login-right">
                <img src="/CICOHealth/assets/img/registerfillform.png">
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.js"></script>
        <script src="/CICOHealth/assets/scripts/formhandling.js"></script>
        <script src="/CICOHealth/assets/scripts/register.js"></script>
    </body>
</html>