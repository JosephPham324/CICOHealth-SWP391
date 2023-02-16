<%-- 
    Document   : ViewExercise
    Created on : Feb 15, 2023, 8:42:00 AM
    Author     : Admin
--%>

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
        <title>View Exercise</title>
    </head>
    <body>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <div class="nav">
            <a href="admin" class="button" style="vertical-align:middle" href="/view/general/index.jsp"><span>Back </span></a>
            <h1 class="navbar-brand mx-auto">VIEW EXERCISE</h1>
        </div>
        <div class="info-container">
            <div class="info-table">            
                <table id="info-table" class="table table-striped table-hover display">
                    <thead>
                        <tr style="background-color:  greenyellow">
                            <th scope="col">Exercise ID</th>
                            <th scope="col">Exercise Type</th>
                            <th scope="col">Exercise Name</th>
                            <th scope="col">Exercise Description</th>
                            <th scope="col">Calories Per Hour</th>
                            <th scope="col">Action</th>
                        </tr>
                    </thead>
                    <tbody>

                        <c:forEach var="exercise" items="${exerciseList}">
                            <tr>
                                <td>${exercise.exerciseID}</td>
                                <td>${exercise.getExerciseType()}</td>
                                <td>${exercise.exerciseName}</td>
                                <td>${exercise.exerciseDescription}</td>
                                <td>${exercise.caloriesPerHour}</td>

                                <td>
                                    <a class="fa-solid fa-pen-to-square edit-button" style="color: blue;"></a>                                
                                    <a  style="color: red"><i class="fa-solid fa-ban"></i></a>
                                </td>

                            </tr> 
                        </c:forEach>

                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
