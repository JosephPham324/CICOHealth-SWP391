<%-- 
    Document   : ViewFAQ
    Created on : Feb 20, 2023, 1:01:50 PM
    Author     : vhqua
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="listQuestion" value="${listQuestion}" scope="request" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add new</title>
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
        <form action="faq" method="post">
            Name: <input type="text" name="submitedBy">
            Topic: <input type="text" name="questionTopic">
            Content: <input type="text" name="questionContent">
            <button type="submit" name="btnSubmitQuestion">Submit new question</button>
        </form>
        <button><a href="/CICOHealth/faq/admin?type=view">View Question</a></button>
    </body>
</html>
