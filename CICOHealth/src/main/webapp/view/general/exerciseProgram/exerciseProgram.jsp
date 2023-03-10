<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
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
        <title>Document</title>
    </head>
    <body>
        <%@include file="/view/general/navbar.jsp"%>
        <a href="/CICOHealth/exercise-programs/create" class="btn">Add new program</a>
        <c:if test="${not empty listProgram}">
            <div class="container">
                <table id="info-table" class="hover" style="width:100%">
                    <thead>
                        <tr>
                            <th scope="col">Program ID</th>
                            <th scope="col">Program Name</th>
                            <th scope="col">Program Description</th>
                            <th scope="col">Created By</th>
                            <th scope="col">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="program" items="${listProgram}">
                            <tr>
                                <td><c:out value="${program.programID}" /></td>
                                <td><c:out value="${program.programName}" /></td>
                                <td><c:out value="${program.programDescription}" /></td>
                                <td><c:out value="${program.createdBy.firstName} ${program.createdBy.lastName}" /></td>
                                <td>
                                    <form action="/CICOHealth/exercise-programs" method="post">
                                        <input type="hidden" value = "${program.programID}" name="programID">
                                        <input type="hidden" value = "delete" name="_method">
                                        <input type="submit" value="Delete"> 
                                </form>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:if>
        <!-- footer -->
        <div class="wrapper">
            <footer>
                <div class="row block-footer">
                    <div class="offset-1 col-3 footer-content">
                        <span class="school-name"><strong>FPT University Can Tho</strong></span>
                        <p>600, Nguyen Van Cu, An Binh, Ninh Kieu, Can Tho</p>
                        <p>Phone: (0292) 360 1996</p>
                        <p>Email: fptu.cantho@fe.edu.vn</p>
                    </div>
                    <div class="offset-1 col-3 footer-content">
                        <p>Le Duy Khanh</p>
                        <p>Pham Nhat Quang</p>
                        <p>Vo Hong Quan</p>
                        <p>Huynh Gia Khiem</p>
                        <p>Pham Tan Phat</p>
                    </div>
                    <div class="col-3 footer-content">
                        <p>?? 2023 All rights reserved. Our website services, content, and products are for
                            informational
                            purposes only. Nutrition does not provide medical advice, diagnosis, or treatment.</p>
                    </div>
                </div>
            </footer>
        </div>
    </body>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="//cdn.datatables.net/1.13.3/js/jquery.dataTables.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#info-table').DataTable();
        });
    </script>
</html>      