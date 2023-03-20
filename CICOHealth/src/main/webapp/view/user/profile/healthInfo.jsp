<%-- 
    Document   : userInfo
    Created on : Feb 14, 2023, 11:29:08 AM
    Author     : vhqua
--%>
<%@page import="java.util.List"%>
<%@page import="bean.User"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="history" value="${history}" scope="request" />
<c:set var="health" value="${healthInfo}" scope="request" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="bean.HealthInfo"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
            rel="stylesheet"
            />
        <!-- MDB -->
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.css"
            rel="stylesheet"
            />
        <link rel="stylesheet" href="/CICOHealth/assets/css/healthInfo.css"/>
        <title>Health Information  | ${initParam.webappName}</title>
    </head>
    <body>
        <%@include file="/view/general/navbar.jsp" %>
        <div class="page-wrapper chiller-theme">   
            <%@include file="sidebarProfile.jsp" %>
            <!-- sidebar-wrapper  -->
            <main class="page-content">
                <div class="container mt-5">
                    <div class="row justify-content-center">
                        <div class="col-md-8">
                            <form action="ProfileController" method="post">
                               
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
                <div class="history-container">
                    <h3 class="txt-center">History</h3>
                    <div class="history-items-container" style="height: 200px; overflow-y: scroll;">
                        <c:forEach var="healthInfo" items="${history}">
                            <a class="history-items" href="/CICOHealth/user/profile/health-info?userid=${healthInfo.userID}&healthinfo=${healthInfo.healthInfoID}">${healthInfo.createdDate}</a><br>
                        </c:forEach>
                    </div>

                </div>
            </main>
        </div>
        <%@include file="/view/general/footer.jsp" %>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="/CICOHealth/assets/scripts/sidebar.js"></script>
        <script src="/CICOHealth/assets/scripts/healthRegister.js"></script>
    </body>
</html>
