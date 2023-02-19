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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="/CICOHealth/assets/sass/main/profile.css"/>
        <title>User Information</title>
    </head>
    <body>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <div class="container-fluid">
            <div class="row">
                <div class="col-3 bg-light pt-3">
                    <ul class="list-unstyled">
                        <li><a href="/CICOHealth/user/profile/user-info?userid=${user.userID}" class="sidebar-link">User Info</a></li>
                        <li><a href="/CICOHealth/user/profile/login-info?userid=${user.userID}" class="sidebar-link">Login Info</a></li>
                        <li><a href="/CICOHealth/user/profile/health-info?userid=${user.userID}" class="sidebar-link">Health Info</a></li>
                    </ul>
                </div>
                <!--//edit-->
                <div class="container mt-5">
                    <div class="row justify-content-center">
                        <div class="col-md-8">
                            <form action="ProfileController" method="post">
                                <div class="card">
                                    <div class="card-header">
                                        User Information
                                    </div>
                                    <div class="card-body">
                                        <div class="form-group">
                                            <input type="text" value="${user.userID}" class="form-control" name ="userID" style="display: none">

                                        </div>
                                        <div class="form-group">
                                            <label for="firstName">First Name</label>
                                            <input type="text" value="${user.firstName}" class="form-control" name ="firstName">

                                        </div>
                                        <div class="form-group">
                                            <label for="lastName">Last Name</label>
                                            <input type="text" value="${user.lastName}" class="form-control" name ="lastName">
                                        </div>
                                        <div class="form-group">
                                            <label for="email">Email</label>
                                            <input type="email" value="${user.email}" class="form-control" name ="email">
                                        </div>
                                        <div class="form-group">
                                            <label for="phone">Phone</label>
                                            <input type="tel" value="${user.phone}" class="form-control" name ="phone">
                                        </div>
                                    </div>
                                    <div class="card-footer text-right">
                                        <input type="hidden" value="PUT" name="_method">
                                        <button type="submit" name="btnUpdate" value="updateUser" class="btn btn-light">Save</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>