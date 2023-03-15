<%-- 
    Document   : exerciseProgramDetail
    Created on : Mar 15, 2023, 7:27:18 AM
    Author     : vhqua
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.2/css/jquery.dataTables.min.css">
        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
        <!-- MDB -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.css" rel="stylesheet" />
        <!-- Bootstrap 5 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="/CICOHealth/assets/css/Homepage.css">
        <link rel="stylesheet" href="//cdn.datatables.net/1.13.3/css/jquery.dataTables.min.css" />
        <style>
            main {
                position: relative;
                z-index: 0;
            }
            .btn {
                background-color: greenyellow;
            }
        </style>
        <title>Program Details</title>
    </head>
    <body>
        <table class="table table-striped">
            <tr>
                <th>Exercise Name</th>
                <th>Exercise Order</th>
                <th>Set</th>
                <th>Rep</th>
                <th>Weight</th>
                <th>Duration</th>
                <th>Calorie Burnt</th>
                <th>Instruction</th>
            </tr>
            <c:forEach var="exercise" items="${workout}">
                <tr>
                    <td>${exercise.workoutExercisesPK.exercise.getExerciseID()}</td>
                    <td>${exercise.exerciseOrder}</td>
                    <td>${exercise.set}</td>
                    <td>${exercise.reps}</td>
                    <td>${exercise.weight}</td>
                    <td>${exercise.duration}</td>
                    <td>${exercise.duration}</td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
