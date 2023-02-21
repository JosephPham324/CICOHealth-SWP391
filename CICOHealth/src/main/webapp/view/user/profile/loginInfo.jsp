<%@page import="bean.Login"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="/CICOHealth/assets/sass/main/profile.css"/>
        <title>Login Information</title>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-3 bg-light pt-3">
                    <ul class="list-unstyled">
                        <li><a href="/CICOHealth/user/profile/user-info" class="sidebar-link">User Info</a></li>
                        <li><a href="/CICOHealth/user/profile/login-info" class="sidebar-link">Login Info</a></li>
                        <li><a href="/CICOHealth/user/profile/health-info" class="sidebar-link">Health Info</a></li>
                    </ul>
                </div>
                <c:set var="l" value="${loginInfo}" scope="request" />
                <div class="container mt-5">
                    <div class="row justify-content-center">
                        <div class="col-md-8">
                            <form action="ProfileController" method="post">
                                <div class="card">
                                    <div class="card-header">
                                        Login Information
                                    </div>
                                    <div class="card-body">
                                        <div class="form-group">
                                            <label for="firstName">Username</label>
                                            <input type="text" name="username" value="${l.username}" class="form-control">

                                        </div>
                                        <div class="form-group">
                                            <label for="firstName">Password</label>
                                            <input type="text" name="password" value="${l.passwordHash}" class="form-control">

                                        </div>
                                        <div class="form-group">
                                            <input type="text" name="_method" value="put" style="display: none" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <input type="text" name="userID" value="${l.userID}" style="display: none" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <input type="text" name="googleID" value="${l.googleID}" style="display: none" class="form-control">
                                        </div>
                                    </div>
                                    <div class="card-footer text-right">
                                        <input type="hidden" value="PUT" name="_method">
                                        <button type="submit" name="btnUpdate" value="updateLogin" class="btn btn-light">Save</button>
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
