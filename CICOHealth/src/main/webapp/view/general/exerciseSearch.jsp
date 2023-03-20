<%-- Document : exerciseSearch Created on : Feb 19, 2023, 2:19:31 PM Author : khiem --%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="/CICOHealth/assets/sass/main/exercisesearch.css">
        <!-- Bootstrap CSS -->
        ${initParam.Bootstrap}
        <!--FontAwesome -->
        ${initParam.FontAwesome}
        <!<!-- DataTable display -->
        ${initParam.DataTableCDN}
        <script src="/CICOHealth/assets/scripts/popup.js"></script>
        <title>Exercise Search | ${initParam.webappName}</title>
    </head>

    <body>
        <%@include file="/view/general/navbar.jsp" %>
        <div class="pop-up" id="exercise-log-pop-up" data-action="${sessionScope.user!=null?"log":"view"}">
            <div class="overlay"></div>
            <div class="pop-up-content"></div>
        </div>
        <div class="nav">
            <h1 class="navbar-brand nav-title-exercise-search mx-auto">SEARCH EXERCISE</h1>
        </div>
        <div class="container">
            <table id="info-table" class="hover" style="width:100%">
                <thead>
                    <tr>
                        <!--No ID-->
                        <!--<th scope="col">Exercise ID</th>-->
                        <th scope="col">Exercise Type</th>
                        <th scope="col">Exercise Name</th>
                        <th scope="col">Exercise Description</th>
                        <th scope="col">Calories Per Hour</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="exercise" items="${exerciseList}">
                        <tr data-type="${exercise.getExerciseType()}" data-exercise-info="{
                            &quot;exerciseID&quot;: &quot;${exercise.exerciseID}&quot;,
                            &quot;exerciseName&quot;: &quot;${exercise.exerciseName}&quot;,
                            &quot;exerciseType&quot;: &quot;${exercise.getExerciseType()}&quot;,
                            &quot;exerciseDescription&quot;: &quot;${exercise.exerciseDescription}&quot;,
                            &quot;caloriesPerHour&quot;: &quot;${exercise.caloriesPerHour}&quot;
                            }">
                                    <!--<td>${exercise.exerciseID}</td>-->
                            <td>${exercise.getExerciseType()}</td>
                            <td>${exercise.exerciseName}</td>
                            <td>${exercise.exerciseDescription}</td>
                            <td>${exercise.caloriesPerHour}</td>
                            <td class="btn-select">
                                <c:if test="${sessionScope.user!=null}">
                                    <i class="fa-solid fa-pen-nib"
                                       style="color:blue"></i>&nbsp;Log
                                </c:if>
                                <c:if test="${sessionScope.user==null}">
                                    <i class="fa-solid fa-eye"
                                       style="color:blue"></i>&nbsp;View
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <%@include file="/view/general/footer.jsp" %>

        <script src="/CICOHealth/assets/scripts/formhandling.js"></script>
        <script src="/CICOHealth/assets/scripts/exercisesearch.js"></script>      
        <script>
            $(document).ready(function () {
                $('#info-table').DataTable();
            });
        </script>
    </body>

</html>