<%-- 
    Document   : index.jsp
    Created on : Feb 7, 2023, 7:18:25 AM
    Author     : Pham Nhat Quang CE170036 (FPTU CANTHO)
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CICO Health</title>
    </head>
    <body>
        <h1>Welcome to CICO Health</h1>
        <c:choose>
            <c:when test = "${sessionScope.user != null}">
                <a href = "log-out">Log out!</a>
            </c:when>
            <c:otherwise>
                <a href = "register">Register!</a>
                <a href = "login">Login!</a>
            </c:otherwise>
        </c:choose>

    </body>
</html>
