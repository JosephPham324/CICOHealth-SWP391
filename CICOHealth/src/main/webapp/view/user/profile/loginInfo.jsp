<%@page import="bean.Login"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                <div class="col-9">
                    <div class="card mx-auto" style="width: 18rem;">
                        <div class="card-body">
                            <form action="ProfileController" method="post">
                                <input type="text" name="_method" value="put" style="display: none">
                                Username:<input type="text" name="username" value="${l.username}">
                                Password<input type="text" name="password" value="${l.passwordHash}">
                                <input type="text" name="userID" value="${l.userID}" style="display: none">
                                <input type="text" name="googleID" value="${l.googleID}" style="display: none">
                                
                                <input type="submit" value="Save" name="btnUpdateLoginInfo">
                            </form>
                            <p class="card-text">Username: </p>
                            <p class="card-text">Password: ${l.passwordHash}</p>
                            <p class="card-text">Google ID: ${l.googleID}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
