<%-- 
Document   : userInfo
Created on : Feb 14, 2023, 11:29:08 AM
Author     : vhqua
--%>
<%@page import="bean.User"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>User Information</title>
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
            </main>
        </div>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="/CICOHealth/assets/scripts/sidebar.js"></script>
    </body>
</html>