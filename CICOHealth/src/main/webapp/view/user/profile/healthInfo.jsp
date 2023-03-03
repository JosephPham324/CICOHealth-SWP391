<%-- 
    Document   : userInfo
    Created on : Feb 14, 2023, 11:29:08 AM
    Author     : vhqua
--%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="bean.HealthInfo"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="/CICOHealth/assets/css/healthInfo.css"/>
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
                                <input type="datetime" name="createdBy" id="createdBy"">
                                <div class="card">
                                    <div class="card-header">
                                        Health Information
                                    </div>
                                    <div class="card-body">
                                        <div class="form-group">
                                            <input type="text" name="_method" style="display:none" value="put" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <input type="text" name="userID" style="display:none" value="${healthInfo.userID}" id="userID" class="form-control">
                                            <input type="text" name="healthInfoID" style="display:none" value="${healthInfo.healthInfoID}" id="userID" class="form-control">
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
        <c:set var="history" value="${history}" scope="request" />
        <div class="history-container">
            <h3 class="txt-center">Histoy</h3>
            <div class="history-items-container" style="height: 200px; overflow-y: scroll;">
                <c:forEach var="healthInfo" items="${history}">
                    <a href="/CICOHealth/user/profile/health-info?userid=${healthInfo.userID}&healthinfo=${healthInfo.healthInfoID}">${healthInfo.createdDate}</a><br>
                </c:forEach>
            </div>

        </div>

        <!--        <script>
                    document.getElementById("createdBy").addEventListener("change", () => {
                        const userID = document.getElementById("userID").value;
                        // Get the value of the date picker
                        const datePicker = document.getElementById("createdBy");
                        const selectedDate = datePicker.value;
                        alert(selectedDate);
                        // Build the new URL using the selected date
                        const baseUrl = "/CICOHealth/user/profile/health-info?userid=" + userID; // remove any existing query string
                        const newUrl = baseUrl + `&selectedDate=` + selectedDate;
                        // Change the URL of the current page
                        window.location.href = newUrl;
                    });
                </script>-->
        <script src="/CICOHealth/assets/scripts/healthRegister.js"></script>
    </body>
</html>
