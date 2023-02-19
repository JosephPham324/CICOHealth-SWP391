<%-- 
    Document   : userInfo
    Created on : Feb 14, 2023, 11:29:08 AM
    Author     : vhqua
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="bean.HealthInfo"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="/CICOHealth/assets/sass/main/profile.css"/>
        <title>Health Information</title>
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
                <c:set var="health" value="${healthInfo}" scope="request" />
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
                                            <input type="text" name="_method" style="display:none" value="put" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <input type="text" name="userID" style="display:none" value="${healthInfo.userID}" class="form-control">

                                        </div>
                                        <%@include file="../formHealthInfor.jsp" %>
                                    </div>
                                    <div class="card-footer text-right">
                                        <input type="hidden" value="PUT" name="_method">
                                        <button name="btnUpdate" type="submit" class="btn btn-light" value="updateHealth" >Submit
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="/CICOHealth/assets/scripts/healthRegister.js"></script>
    </body>
</html>
