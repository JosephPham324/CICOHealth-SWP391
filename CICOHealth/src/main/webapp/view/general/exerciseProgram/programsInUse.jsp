<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.2/css/jquery.dataTables.min.css">
        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
              rel="stylesheet" />
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
              rel="stylesheet" />
        <!-- MDB -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.css" rel="stylesheet" />
        <!-- Bootstrap 5 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
              crossorigin="anonymous">
        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
              rel="stylesheet" />
        <link rel="stylesheet" href="//cdn.datatables.net/1.13.3/css/jquery.dataTables.min.css" />
        <link rel="stylesheet" href="/CICOHealth/assets/sass/main/exerciseProgram.css">

        <style>
            main {
                position: relative;
                z-index: 0;
            }
        </style>
        <title>${sessionScope.user.firstName} ${sessionScope.user.lastName}'s Programs Inventory | ${initParam.webappName}</title>
    </head>
    <body>
        <%@include file="/view/general/navbar.jsp" %>
        <main>
            <h1 class="page-tlt">Programs Inventory</h1>
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
                                    <td>
                                        <c:out value="${program.programID}" />
                                    </td>
                                    <td>
                                        <c:out value="${program.programName}" />
                                    </td>
                                    <td>
                                        <c:out value="${program.programDescription}" />
                                    </td>
                                    <td>
                                        <c:out
                                            value="${program.createdBy.firstName} ${program.createdBy.lastName}" />
                                    </td>
                                    <td>
                                        <button class=" btn btn-info"><a class="see-detail"
                                                   href="/CICOHealth/exercise-programs/detail?id=${program.programID}">Details<i class="fa-solid fa-eye"></i></a></button>
                                        <form action="/CICOHealth/exercise-programs" method="post" style="display:inline;">
                                            <input type="hidden" value="update"
                                                   name="_method">
                                            <input type="hidden" value="inventory"
                                                   name="type">
                                            <input type="hidden" value="${program.programID}"
                                                   name="programID">
                                            <input type="hidden" value="true"
                                                   name="remove">
                                            <input class = "btn btn-danger"type="submit" value="Remove">
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <a href="/CICOHealth/exercise-programs/" class="btn btn-success btn-add-program">Add new
                        program</a>

                </div>
            </c:if>
        </main>
        <!-- footer -->
        <%@include file="/view/general/footer.jsp" %>

    </body>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="//cdn.datatables.net/1.13.3/js/jquery.dataTables.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#info-table').DataTable();
        });
    </script>

</html>