<%@page import="bean.User"%>
<%@page import="bean.Login"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="l" value="${loginInfo}" scope="request" />
<!DOCTYPE html>
<html>
    <head>
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
        <link rel="stylesheet" href="/CICOHealth/assets/css/loginInfo.css"/>
        <link rel="stylesheet" href="/CICOHealth/assets/css/healthInfo.css"/>
        <title>Login Information</title>
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
                                        Login Information
                                    </div>
                                    <div class="card-body">
                                        <div class="form-group">
                                            <label for="firstName">Username</label>
                                            <input type="text" name="username" value="${l.username}" class="form-control">

                                        </div>
                                        <div class="form-group">
                                            <label for="firstName">Password</label>
                                            <input type="password" name="password" value="${l.passwordHash}" class="form-control"  id="id_password">
                                            <i class="far fa-eye" id="togglePassword" onclick="eyeToggle()" data-passwordHash="${l.passwordHash}"></i>
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

            </main>
        </div>
        <%@include file="/view/general/footer.jsp" %>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="/CICOHealth/assets/scripts/sidebar.js"></script>
       <script src="/CICOHealth/assets/scripts/loginInfo.js"></script>
        
    </body>
</html>
