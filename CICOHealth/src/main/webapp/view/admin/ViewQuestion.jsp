<%-- 
    Document   : ViewQuestion
    Created on : Feb 20, 2023, 2:40:00 PM
    Author     : vhqua
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="listQuestion" value="${listQuestion}" scope="request" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div>
            <c:forEach var="question" items="${listQuestion}">
                <p>Question ID: ${question.questionID}</p>
                <p>Submitted by: ${question.submittedBy}</p>
                <p>Topic: ${question.questionTopic}</p>
                <p>Content: ${question.questionContent}</p>
                <hr>
            </c:forEach>
        </div>
    </body>
</html>
