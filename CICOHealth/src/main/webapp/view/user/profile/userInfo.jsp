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
                        <li><a href="/CICOHealth/user/profile/user-info?userid=${user.userID}" class="sidebar-link">User Info</a></li>
                        <li><a href="/CICOHealth/user/profile/login-info?userid=${user.userID}" class="sidebar-link">Login Info</a></li>
                        <li><a href="/CICOHealth/user/profile/health-info?userid=${user.userID}" class="sidebar-link">Health Info</a></li>
                    </ul>
                </div>
                <!--//edit-->
                <form action="/CICOHealth/user/profile" method="post">
                    <div class="col-9">
                        <div class="card mx-auto" style="width: 18rem;">
                            <div class="card-body">
                                <input type="text" value="${user.userID}" class="card-title" name ="userID" style="display: none"><br>
                                Firstname: <input type="text" value="${user.firstName}" class="card-title" name ="firstName"><br>
                                Lastname: <input type="text" value="${user.lastName}" class="card-title" name ="lastName"> <br>
                                Email: <input type="email" value="${user.email}" class="card-title" name ="email"> <br>
                                phone: <input type="tel" value="${user.phone}" class="card-title" name ="phone"> 
                            </div>
                        </div>
                        <input type="hidden" value="PUT" name="_method">
                        <button type="submit" name="btnUpdate" value="updateUser">Save</button>
                    </div>
                </form>

            </div>
        </div>
    </body>
</html>
