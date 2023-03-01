<%-- 
    Document   : newnavbar
    Created on : Mar 1, 2023, 6:53:01 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/sass/main/navbar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Homepage.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/card.css">

<nav class="navbar">
    <div class="container">
        <div class="navbar-header">
            <button class="navbar-toggler" data-toggle="open-navbar1">
                <span></span>
                <span></span>
                <span></span>
            </button>
            <a href="/CICOHealth/">
                <h4>CICO<span>Health</span></h4>
            </a>
        </div>

        <div class="navbar-menu" id="open-navbar1">
            <ul class="navbar-nav">
                <li><a href="/CICOHealth/food-search">Food</a></li>
                <li><a href="/CICOHealth/exercise-search">Exercise</a></li>

                <li class="navbar-dropdown">
                    <a href="#" class="dropdown-toggler" data-dropdown="my-dropdown-id">
                        Utilities <i class="fa fa-angle-down"></i>
                    </a>
                    <ul class="dropdown" id="my-dropdown-id">
                        <li><a href="/CICOHealth/conversion">Conver Unit</a></li>
                        <li class="separator"></li>
                        <li><a href="/CICOHealth/timer">Timer</a></li>
                    </ul>
                </li>

                <li><a href="/CICOHealth/faq">FAQ</a></li>
                    <c:choose>
                        <c:when test="${sessionScope.user == null}">
                        <li><a href="/CICOHealth/login" class="nav-btn">Login</a></li>
                        <li><a href="/CICOHealth/register" class="nav-btn">Register</a></li>
                        </c:when>
                        <c:otherwise>
                        <li class="navbar-dropdown">
                            <a href="#" class="dropdown-toggler" data-dropdown="my-dropdown-id">
                                User <i class="fa fa-angle-down"></i>
                            </a>
                            <ul class="dropdown" id="my-dropdown-id">
                                <li><a href="/CICOHealth/user/profile">Profile</a></li>
                                <li class="separator"></li>
                                <li><a href="/CICOHealth/user/meal-logs">Meal Logs</a></li>
                                <li class="separator"></li>
                                <li><a href="/CICOHealth/user/exercise-logs">Exercise Logs</a></li>
                                <li class="separator"></li>
                                <li><a href="/CICOHealth/log-out">Log out</a></li>
                            </ul>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
</nav>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="${pageContext.request.contextPath}assets/scripts/newnavbar.js"></script>

