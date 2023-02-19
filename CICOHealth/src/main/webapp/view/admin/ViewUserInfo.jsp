<%-- 
    Document   : ViewUserInfo
    Created on : Feb 14, 2023, 11:28:09 AM
    Author     : User
--%>

<%@page import="java.util.List"%>
<%@page import="bean.User"%>
<%@page import="dao.UserDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Assets/css/adminuserinfo.css">       
        <title>Users Info</title>

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
                            <th scope="col">UserID</th>
                            <th scope="col">First name</th>
                            <th scope="col">Last name</th>
                            <th scope="col">Email</th>
                            <th scope="col">Phone number</th>
                            <th scope="col">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% UserDao dao = new UserDao();
                            List<User> users = dao.getAllUser();
                            for (User list : users) {%>
                        <tr>
                            <td><%= list.getUserID()%></td>
                            <td><%= list.getFirstName()%></td>
                            <td><%= list.getLastName()%></td>
                            <td><%= list.getEmail()%></td>
                            <td><%= list.getPhone()%></td>
                            <td>
                                <a class="fa-solid fa-pen-to-square edit-button" style="color: blue;" href="/CICOHealth/user/profile/userinfo?userid=<%= list.getUserID()%>"></a>                              
                                <a  style="color: red"
                                    ><i class="fa-solid fa-ban"></i></a>
                            </td>
                        </tr>
                        <% }%>                       
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
