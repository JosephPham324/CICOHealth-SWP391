<%-- 
    Document   : register.jsp
    Created on : Feb 7, 2023, 7:18:37 AM
    Author     : Pham Nhat Quang CE170036 (FPTU CANTHO)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            body{
                width:100vw;
                height:100vh;
                display:flex;
                flex-direction:column;
                align-items:center;
                justify-content:center;
            }
        </style>
        <title>JSP Page</title>
    </head>
    <body>
        <form action="register" method="post">
            <div class="form-group row">
                <label for="txtUsername" class="col-4 col-form-label">Username</label> 
                <div class="col-8">
                    <input id="txtUsername" name="txtUsername" placeholder="Enter username" type="text" class="form-control">
                </div>
            </div>
            <div class="form-group row">
                <label for="txtPassword" class="col-4 col-form-label">Password</label> 
                <div class="col-8">
                    <input id="txtPassword" name="txtPassword" placeholder="Enter password" type="text" class="form-control" aria-describedby="txtPasswordHelpBlock"> 
                    <span id="txtPasswordHelpBlock" class="form-text text-muted">Password must be between 6 to 20 characters!</span>
                </div>
            </div>
            <div class="form-group row">
                <label for="txtFirstName" class="col-4 col-form-label">First name</label> 
                <div class="col-8">
                    <input id="txtFirstName" name="txtFirstName" placeholder="Enter your first name" type="text" class="form-control">
                </div>
            </div>
            <div class="form-group row">
                <label for="txtLastName" class="col-4 col-form-label">Last name</label> 
                <div class="col-8">
                    <input id="txtLastName" name="txtLastName" placeholder="Enter your last name" type="text" class="form-control">
                </div>
            </div>
            <div class="form-group row">
                <label for="txtEmail" class="col-4 col-form-label">Email</label> 
                <div class="col-8">
                    <input id="txtEmail" name="txtEmail" placeholder="Enter your email address" type="text" class="form-control">
                </div>
            </div> 
            <input type ="hidden" name="healthReg" value="true" id="register-health">
            <div class="form-group row">
                <div class="offset-4 col-8">
                    <button name="submit" type="submit" class="btn btn-primary">Submit</button>
                </div>
            </div>
        </form>
    </body>
</html>
