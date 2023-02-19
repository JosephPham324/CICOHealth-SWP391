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
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <div class="container-fluid">
            <div class="row">
                <div class="col-3 bg-light pt-3">
                    <ul class="list-unstyled">
                        <li><a href="/CICOHealth/user/profile/user-info" class="sidebar-link">User Info</a></li>
                        <li><a href="/CICOHealth/user/profile/login-info" class="sidebar-link">Login Info</a></li>
                        <li><a href="/CICOHealth/user/profile/health-info" class="sidebar-link">Health Info</a></li>
                    </ul> 
                </div>
                <div class="col-9">
                    <div class="card mx-auto" style="width: 18rem;">
                        <div class="card-body">
                            <p class="card-title">Firstname: <c:out value="${user.userID}"/></p>
                            <p class="card-title">Firstname: <c:out value="${user.firstName}"/></p>
                            <p class="card-text">Lastname: <c:out value="${user.lastName}"/></p>
                            <p class="card-text">Email: <c:out value="${user.email}"/></p>
                            <p class="card-text">phone: <c:out value="${user.phone}"/></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
