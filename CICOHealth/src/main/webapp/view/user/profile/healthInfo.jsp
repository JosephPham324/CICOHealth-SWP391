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
                <form action="ProfileController" method="post">
                    <input type="text" name="_method" style="display:none" value="put">
                    <input type="text" name="userID" style="display:none" value="${healthInfo.userID}">
                    <%@include file="../formHealthInfor.jsp" %>
                    <div class="form-group row">
                        <div class="offset-4 col-8">
                            <button name="btnUpdateHealth" type="submit" class="btn btn-primary">
                                Submit
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <script src="/CICOHealth/assets/scripts/healthRegister.js"></script>
    </body>
</html>
