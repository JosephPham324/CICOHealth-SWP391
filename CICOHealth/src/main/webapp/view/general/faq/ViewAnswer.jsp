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
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
            integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
            crossorigin="anonymous"
            />
        <link
            rel="stylesheet"
            href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css"
            />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
            integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />
        <link
            rel="stylesheet"
            href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
            />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Assets/css/adminuserinfo.css"> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Answer Information</title>
    </head>
    <body>
        <div class="nav">
            <h1 class="navbar-brand mx-auto">Answer Information</h1>
        </div>
        <div class="info-container">
            <button><a href="/CICOHealth/faq/answers/create">Add</a></button>
            <div class="info-table">            
                <table id="info-table" class="table table-striped table-hover display">
                    <thead>
                        <tr style="background-color:  greenyellow">
                            <th scope="col">Answer ID</th>
                            <th scope="col">Created By</th>
                            <th scope="col">Question Topic</th>
                            <th scope="col">Question Content</th>
                            <th scope="col">Answer Content</th>
                            <th scope="col">Actions</th>

                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="answer" items="${listAnswer}">
                        <form action="/CICOHealth/faq/answers/delete" method="post" onSubmit="return confirm('Do you want to delete?')">     
                            <tr>
                                <td>${answer.answerID}</td>
                                <td>${answer.createBy}</td>
                                <td>${answer.questionTopic}</td>
                                <td>${answer.questionContent}</td>
                                <td>${answer.answerContent}</td>
                                <td>
                                    <input type="hidden" name="_method" value="Delete">
                                    <input type="hidden" name="Id_answer" value="${answer.answerID}">
                                    <button type="submit" style="border: none;">
                                        <i class="fa-solid fa-trash" style="color: red;"></i>
                                    </button>
                                </td>
                            </tr>
                        </form>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
