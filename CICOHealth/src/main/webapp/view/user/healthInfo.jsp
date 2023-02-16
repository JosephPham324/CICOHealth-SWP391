<%-- 
    Document   : userInfo
    Created on : Feb 14, 2023, 11:29:08 AM
    Author     : vhqua
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Health Information</title>
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
                <c:set var="heatlh" value="${healthInfo}" scope="request" />
                <div class="col-9">
                    <div class="card mx-auto" style="width: 18rem;">
                        <div class="card-body">
                            <p class="card-text">gender: ${health.gender}</p>
                            <p class="card-text">height: ${health.height}</p>
                            <p class="card-text">weight: ${health.weight}</p>
                            <p class="card-text">age: ${health.age}</p>
                            <p class="card-text">activeness: ${health.activeness}</p>
                            <p class="card-text">tdee: ${health.tdee}</p>
                            <p class="card-text">dailyCalorie: ${health.dailyCalorie}</p>
                            <p class="card-text">dailyProtein: ${health.dailyProtein}</p>
                            <p class="card-text">dailyFat: ${health.dailyFat}</p>
                            <p class="card-text">dailyCarb: ${health.dailyCarb}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
