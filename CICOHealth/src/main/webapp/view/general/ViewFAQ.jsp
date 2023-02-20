<%-- 
    Document   : ViewFAQ
    Created on : Feb 20, 2023, 1:01:50 PM
    Author     : vhqua
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add new</title>
    </head>
    <body>
        
        <form action="faq" method="post">
            Name: <input type="text" name="submitedBy">
            Topic: <input type="text" name="questionTopic">
            Content: <input type="text" name="questionContent">
            <button type="submit" name="btnSubmitQuestion">Submit new question</button>
        </form>
        <button><a href="/CICOHealth/faq/questions">View Question</a></button>
    </body>
</html>
