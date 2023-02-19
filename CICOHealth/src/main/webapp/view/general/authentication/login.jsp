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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>JSP Page</title>
    </head>
    <body>
        <style>
            body{
                width:100vw;
                height:100vh;
                display:flex;
                flex-direction:column;
                align-items:center;
                justify-content:center;
            }
            .cbRemember {
                font-size: 14px;
            }

            .card{
                background: lightgrey;
                border-radius: 10%;
            }

            .form-control{
                width: 400px;
            }

            .btn {
                width: 200px;
            }
            .txt-title{
                text-align: center;
            }
        </style>
        <button class="button btn-back"> Back </button>
        <form action="login" method="post">
            <div class="card">
                <h1 class="txt-title">Login</h1>
                <div class="form-group row">
                    <!--<label for="txtUsername" class="col-4 col-form-label">Username</label>--> 
                    <div class="col-8 txt">
                        <input id="txtUsername" name="txtUsername" placeholder="Enter username" type="text" class="form-control">
                    </div>
                </div>
                <div class="form-group row">
                    <!--<label for="txtPassword" class="col-4 col-form-label">Password</label>--> 
                    <div class="col-8 txt">
                        <input id="txtPassword" name="txtPassword" placeholder="Enter password" type="text" class="form-control" aria-describedby="txtPasswordHelpBlock"> 
                        <!--<span id="txtPasswordHelpBlock" class="form-text text-muted">Password must be between 6 to 20 characters!</span>-->
                    </div>
                </div>
                <div class="form-group row cbRemember">
                    <div class="col-8 txt">
                        <input type="checkbox" id="remember" name="remember"> Remember Me
                    </div>
                </div>
                <div class="form-group row">
                    <div class="offset-3 txt">
                        <button name="submit" type="submit" class="btn btn-light">Login</button>
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>
