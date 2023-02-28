<%-- 
    Document   : ViewAnswer
    Created on : Feb 23, 2023, 3:24:22 PM
    Author     : User
--%>

<%@page import="bean.Answer"%>
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
                        <form action="/CICOHealth/faq" method="post">     
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
                                    <a href="/CICOHealth/faq/answers?updateid=${answer.answerID}">Update</a>
                                </td>
                            </tr>
                        </form>
                    </c:forEach>
                    </tbody>
                </table>
                <!--sau nay lam cai nay thanh pop up-->
                <%
                    Answer answer = null;
                    if (request.getAttribute("AnswerUpdate") != null) {
                        answer = (Answer) request.getAttribute("AnswerUpdate");
                        %>
                <form class="form-horizontal" action="/CICOHealth/faq/answers" method="post">
                    <input type="hidden" name="answerID" value="<%= answer.getAnswerID() %>" readonly>
                    <input type="hidden" name="_method" value="put">
                    <input type="hidden" name="createdBy" value="<%= answer.getCreateBy() %>">
                    <div class="form-group">
                        <label class="control-label col-sm-2">Please select an option:</label>
                        
                        <div class="col-sm-10">
                            <select id="topic" name="questionTopic">
                                <option value="optionA" <%= answer.getQuestionContent() == "optionA" ? "selected" : ""%> >Option A</option>
                                <option value="optionB" <%= answer.getQuestionContent() == "optionB" ? "selected" : ""%>>Option B</option>
                                <option value="optionC" <%= answer.getQuestionContent() == "optionC" ? "selected" : ""%>>Option C</option>
                                <option value="optionD" <%= answer.getQuestionContent() == "optionD" ? "selected" : ""%>>Option D</option>
                                <option value="optionE" <%= answer.getQuestionContent() == "optionE" ? "selected" : ""%>>Option E</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" >Question Content</label>
                        <div class="col-sm-10">          
                            <input type="text" class="form-control"  name="questionContent" value="<%= answer.getQuestionContent() %>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" >Answer Content</label>
                        <div class="col-sm-10">          
                            <input type="text" class="form-control"  name="answerContent" value="<%= answer.getAnswerContent() %>">
                        </div>
                    </div>
                    <div class="form-group">        
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-default">Submit</button>
                        </div>
                    </div>
                </form>
                        
                <%
                    }
                %>
                
            </div>
        </div>
    </body>
</html>
