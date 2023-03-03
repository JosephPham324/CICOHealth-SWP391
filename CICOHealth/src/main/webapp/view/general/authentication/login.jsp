<%-- Document : login Created on : Feb 9, 2023, 8:00:55 AM Author : Pham Nhat Quang CE170036 (FPTU CANTHO) --%>

    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css"
                integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
                crossorigin="anonymous">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
            <title>JSP Page</title>
        </head>

        <body>
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
                }

                input {
                    width: 300px !important;
                }
            </style>
            <form action="login" method="post" name="sign-form" id="login-form">
                <div class="form-group row">
                    <label for="txtUsername" class="col-4 col-form-label">Username</label>
                    <div class="col-8" id="password-field">
                        <input id="txtUsername" name="txtUsername" placeholder="Enter username" type="text"
                            class="form-control">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="txtPassword" class="col-4 col-form-label">Password</label>
                    <div class="col-8">
                        <input id="txtPassword" name="txtPassword" placeholder="Enter password" type="text"
                            class="form-control" aria-describedby="txtPasswordHelpBlock">
                    </div>
                </div>
                <div class="form-group row">
                    <div class="offset-4 col-8">
                        <button name="submit" type="submit" class="btn btn-primary">Submit</button>
                    </div>
                </div>
                <div id="g_id_onload"
                    data-client_id="641593933823-qlfnb62fuif3fcsu01b0hf9vijetfepj.apps.googleusercontent.com"
                    data-context="signin" data-ux_mode="popup" data-login_uri="http://localhost:8080/CICOHealth/login"
                    data-auto_prompt="false" data-callback="handleCredentialResponse"></div>
                <div class="g_id_signin" data-type="standard" data-shape="reactangle" data-theme="filled_blue"
                    data-text="signin_with" data-size="huge" data-logo_alignment="left"></div>
            </form>

            <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.js"></script>
            <script src="/CICOHealth/assets/scripts/login.js"></script>
            <script src="https://accounts.google.com/gsi/client" async defer></script>
            <script src="/CICOHealth/assets/scripts/formhandling.js"></script>
            <script>
                function handleCredentialResponse(response) {
                    const responsePayload = parseJwt(response.credential);
                    const formParams = {
                        googleID: responsePayload.sub
                    };
                    console.log(formParams);
                    post("login", formParams);
                }
            </script>
            <p id="email"></p>
        </body>

        </html>