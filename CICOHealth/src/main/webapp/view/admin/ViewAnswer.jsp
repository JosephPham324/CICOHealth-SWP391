<%-- 
    Document   : ViewAnswer
    Created on : Feb 23, 2023, 3:24:22 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Answer Information</title>
    </head>
    <body>
        <a href="/CICOHealth/view/admin/addAnswer.jsp">Add new</a>
        <div>
            <c:forEach var="answer" items="${listAnswer}">
                <p>Answer ID: ${answer.answerID}</p>
                <p>Created By: ${answer.createBy}</p>
                <p>Question Topic: ${answer.questionTopic}</p>
                <p>Question Content: ${answer.questionContent}</p>
                <p>Answer Content: ${answer.answerContent}</p>
                <hr>
            </c:forEach>
        </div>
    </body>
</html>
