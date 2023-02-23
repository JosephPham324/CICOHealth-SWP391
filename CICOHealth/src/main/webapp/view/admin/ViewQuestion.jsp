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
    </head>
    <body>
        <div class="nav">
            <a href="admin" class="button" style="vertical-align:middle"><span>Back </span></a>
            <h1 class="navbar-brand mx-auto">USER INFO</h1>
        </div>
        <div class="info-container">
            <div class="info-table">            
                <table id="info-table" class="table table-striped table-hover display">
                    <thead>
                        <tr style="background-color:  greenyellow">
                            <th scope="col">ID</th>
                            <th scope="col">Submit by</th>
                            <th scope="col">Question Topic</th>
                            <th scope="col">Question Content</th>
                            <th scope="col">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="question" items="${listQuestion}">
                            <tr>
                        <form action="CICOHealth/faq/questions" method="post">

                            <td>${question.questionID}</td>
                            <td>${question.submittedBy}</td>
                            <td>${question.questionTopic}</td>
                            <td>${question.questionContent}</td>
                            <td>                        
                                <input type="hidden" name="_method" value="Delete">
                                <input type="hidden" name="id_question" value="${question.questionID}" >
                                <button type="submit" name="btl_delete" style="border: none">
                                    <i style="color: red;" class="fa fa-trash" aria-hidden="true"></i>
                                </button>
                            </td>
                        </form>
                        </tr>
                    </c:forEach>              
                    </tbody>
                </table>
            </div>
        </div>








    </body>
</html>
