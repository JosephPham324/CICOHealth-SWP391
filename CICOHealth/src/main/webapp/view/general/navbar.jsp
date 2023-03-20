<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/sass/main/navbar.css" /> -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/sass/main/newnav.css" />

    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/sass/main/card.css" />

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Homepage.css" />
    <!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/card.css"> -->
    <c:set var="user" value="${sessionScope.user}"></c:set>

    <div class="nav">
        <input type="checkbox" id="nav-check">

        <div class="nav-header">
            <div class="nav-title">
                <a href="/CICOHealth/">CICO<span class="color-tlt">Health</span></a>
            </div>
        </div>

        <div class="nav-btn">
            <label for="nav-check">
                <span></span>
                <span></span>
                <span></span>
            </label>
        </div>

        <div class="nav-links">
            <ul>
                <li><a href="/CICOHealth/food-search">Food</a></li>
                <li><a href="/CICOHealth/exercise-search">Exercise</a></li>
                <li class="dropdown">
                    <a class="dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Utilities
                    </a>

                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="/CICOHealth/utilities/conversion">Convert Unit</a></li>
                        <li><a class="dropdown-item" href="/CICOHealth/utilities/timer">Timer</a></li>
                    </ul>
                </li>
                <c:choose>
                    <c:when test="${user!=null && user.getUserRole() == 'AD'}">
                        <li class="dropdown">
                            <a class="dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                                aria-expanded="false">
                                FAQ
                            </a>

                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="/CICOHealth/faq/questions">Question</a></li>
                                <li><a class="dropdown-item" href="/CICOHealth/faq/answers">Answer</a></li>
                            </ul>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="/CICOHealth/faq">FAQ</a></li>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${user!=null}">
                        <li><a href="/CICOHealth/exercise-programs">Programs</a></li>
                    </c:when>
                </c:choose>

                <c:choose>
                    <c:when test="${user == null}">
                        <li><a href="/CICOHealth/login">Login</a></li>
                        <li><a href="/CICOHealth/register">Register</a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="dropdown">
                            <a class="dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                                aria-expanded="false">
                                User
                            </a>
                            <ul class="dropdown-menu menu-user">
                                <li>
                                    <a class="dropdown-item" href="/CICOHealth/user/profile">Profile</a>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="/CICOHealth/user/meal-logs">Meals Log</a>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="/CICOHealth/user/exercise-logs">Exericse Log</a>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="/CICOHealth/user/statistics">Statistics</a>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="/CICOHealth/log-out">Log out</a>
                                </li>
                            </ul>
                        </li>
                        <c:if test="${user.getUserRole() == 'AD'}">
                            <li class="dropdown">
                                <a class="dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                                    aria-expanded="false">
                                    Admin
                                </a>
                                <ul class="dropdown-menu menu-admin">
                                    <li>
                                        <a class="dropdown-item" href="/CICOHealth/user/profile">Manage Users</a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="/CICOHealth/user/meal-logs">Manage Exercises</a>
                                    </li>
                                </ul>
                            </li>
                        </c:if>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
    <%@include file="/view/segments/message.jsp" %>
