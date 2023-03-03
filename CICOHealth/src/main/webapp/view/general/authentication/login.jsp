<%-- 
    Document   : login
    Created on : Feb 9, 2023, 8:00:55 AM
    Author     : Pham Nhat Quang CE170036 (FPTU CANTHO)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="/CICOHealth/src/main/webapp/assets/sass/main/loginscss.css">
        <title>JSP Page</title>
    </head>
    <body>
        
        <div class="container">
            <div class="login-left">
                <div class="login-header">
                    <h1>Welcome to Our Application</h1>
                    <p>Please login to use the platform</p>
                </div>
                <form action="login" method="post" name="sign-form" class="login-form">
                    <div class="login-form-content">
                        <div class="form-item">
                            <label for="txtUsername">Username</label>                           
                                <input id="txtUsername" name="txtUsername" placeholder="Enter username" type="text">                      
                        </div>
                        <div class="form-item">
                            <label for="txtPassword">Password</label> 
                                <input id="txtPassword" name="txtPassword" placeholder="Enter password" type="password" aria-describedby="txtPasswordHelpBlock"> 
                        </div>
                        <div class="form-item">
                            <div class="checkbox">
                                <input type="checkbox" id="rememberMeCheckbox" checked>
                                <label for="rememberMeCheckbox" class="checkboxLabel">Remember me</label>
                            </div>
                        </div>

                            <div>
                                <button name="submit" type="submit" class="btn btn-primary">Sign In</button>
                            </div>
                        
                    </div>
                    <div class="login-form-footer">
                        <div
                        id="g_id_onload"
                        data-client_id="641593933823-qlfnb62fuif3fcsu01b0hf9vijetfepj.apps.googleusercontent.com"
                        data-context="signin"
                        data-ux_mode="popup"
                        data-login_uri="http://localhost:8080/CICOHealth/login"
                        data-auto_prompt="false"
                        data-callback="handleCredentialResponse"
                        ></div>
                    <div
                        class="g_id_signin"
                        data-type="standard"
                        data-shape="reactangle"
                        data-theme="filled_blue"
                        data-text="signin_with"
                        data-size="huge"
                        data-logo_alignment="left"
                        ></div>
                    </div>
                    
                </form>
        
                <script src="https://accounts.google.com/gsi/client" async defer></script>
                <script src="/CICOHealth/assets/scripts/formhandling.js"></script>
                <script>
                    function handleCredentialResponse(response) {
                        const responsePayload = parseJwt(response.credential);
                        const formParams = {
                            googleID : responsePayload.sub
                        };
                        console.log(formParams);
                        post("login", formParams);
                    }
                </script>
                <p id="email"></p>
            </div>
            <div class="login-right">
                <img src="/CICOHealth/src/main/webapp/assets/img/loginbackground.png">
            </div>
        </div>
            
        
    </body>
</html>
