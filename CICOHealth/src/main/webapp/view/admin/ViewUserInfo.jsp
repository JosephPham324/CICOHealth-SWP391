<%-- 
    Document   : ViewUserInfo
    Created on : Feb 14, 2023, 11:28:09 AM
    Author     : User
--%>

<%@page import="java.util.List"%>
<%@page import="bean.User"%>
<%@page import="dao.UserDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
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

        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/adminuserinfo.css">       
        <title>Users Info</title>
        <style>

            .banned{
                color: red !important ;
            }
            .unbaned {
                color: blue !important;
            }
            * {
                font-family: sans-serif;
            }

            .content-table {
                border-collapse: collapse;

                font-size: 0.9em;
                min-width: 1000px;
                border-radius: 5px 5px 0 0;
                overflow: hidden;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
            }

            .content-table thead tr {
                background-color: rgb(131, 184, 46);
                color: #ffffff;
                text-align: left;
                font-weight: bold;
            }

            .content-table th,
            .content-table td {
                padding: 12px 15px;
            }

            .content-table tbody tr {
                border-bottom: 1px solid #dddddd;
            }

            .content-table tbody tr:nth-of-type(even) {
                background-color: #f3f3f3;
            }

            .content-table tbody tr:last-of-type {
                border-bottom: 2px solid #009879;
            }

            .content-table tbody tr.active-row {
                font-weight: bold;
                color: #009879;
            }
            .text_title{
                text-align: center;
            }
        </style>
    </head>
    <body>
        <%@ include file="/view/general/navbar.jsp" %>
        <div class="container" style=" margin: auto;
             padding-top: 6rem;">
            <div >
                <h1 class="text_title" >USER INFO</h1> 
            </div>
            <div class="row  justify-content-md-center">  
                <div class="col-md-auto">
                    <div class="content">
                        <button name="submit" class="btn btn-success" id="add-button" >
                            Add Account
                        </button>
                        <table class="content-table" id ="users-table">
                            <thead>
                                <tr>
                                    <th>UserID</th>
                                    <th>First name</th>
                                    <th>Last name</th>
                                    <th>Email</th>
                                    <th>Phone number</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% UserDao dao = new UserDao();
                                    List<User> users = dao.getAllUser();
                                    for (User list : users) {%>
                                <tr class="table-active">
                                    <td><%= list.getUserID()%></td>
                                    <td><%= list.getFirstName()%></td>
                                    <td><%= list.getLastName()%></td>
                                    <td><%= list.getEmail()%></td>
                                    <td><%= list.getPhone()%></td>
                                    <td>
                                        <a class="fa-solid fa-pen-to-square edit-button" style="color: blue;" href="/CICOHealth/user/profile/user-info?userid=<%= list.getUserID()%>"></a> 
                                        <c:set var = "us" scope = "session" value = "<%= list.getUserID()%>"/>
                                        <c:set var = "banned" scope = "session" value = "<%= list.isIsBanned()%>"/>
                                        <c:if test = "${banned}">
                                            <a  class="unbaned" id="banned" data-value ="1" 
                                                onclick ="changeStatus('<%= list.getUserID()%>', this)"><i class="fa-solid fa-ban "></i></a>    
                                            </c:if>
                                            <c:if test = "${!banned}">
                                            <a  class="banned" id="banned" data-value ="1" 
                                                onclick ="changeStatus('<%= list.getUserID()%>', this)"><i class="fa-solid fa-ban "></i></a>   
                                            </c:if>                           
                                    </td>
                                </tr>
                                <% }%> 
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div>
        <%@include file="/view/general/footer.jsp" %>

        <script>

            function changeStatus(userId, sel) {
                var obj = $(sel).css('color');
                if (obj === 'rgb(255, 0, 0)') {
                    var select = confirm("Do you want to ban this account?");
                    $(sel).removeClass("banned");
                    $(sel).addClass("unbaned");
                    if (select) {
                        $.get("/CICOHealth/banController?id=" + userId, function (data, status) {
                            alert("banned successful");
                        });
                    }
                }
                if (obj === 'rgb(0, 0, 255)') {
                    var select = confirm("Do you want to unban this account?");
                    if (select) {
                        $(sel).removeClass("unbaned");
                        $(sel).addClass("banned");
                        $.get("/CICOHealth/banController?id=" + userId, function (data, status) {
                            alert("unbanned successful");
                        });
                    }
                }
            }
        </script>
        <script src="https://cdn.datatables.net/1.13.2/js/jquery.dataTables.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/scripts/popup.js"></script>
        <script src="${pageContext.request.contextPath}/assets/scripts/adduser.js"></script>
    </body>
</html>
