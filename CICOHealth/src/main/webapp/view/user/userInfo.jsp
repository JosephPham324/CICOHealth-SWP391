<%-- 
    Document   : userInfo
    Created on : Feb 14, 2023, 11:29:08 AM
    Author     : vhqua
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Information</title>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-3 bg-light pt-3">
                    <ul class="list-unstyled">
                        <li><a href="/CICOHealth/profile/userinfo" class="sidebar-link">User Info</a></li>
                        <li><a href="/CICOHealth/profile/logininfo" class="sidebar-link">Login Info</a></li>
                        <li><a href="/CICOHealth/profile/healthinfo" class="sidebar-link">Health Info</a></li>
                    </ul>
                </div>

                <div class="col-9">
                    <div class="card mx-auto" style="width: 18rem;">
                        <div class="card-body">
                            <p class="card-title">Firstname: </p>
                            <p class="card-text">Lastname: </p>
                            <p class="card-text">Email: </p>
                            <p class="card-text">phone: </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
