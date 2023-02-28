<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- Font Awesome -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Homepage.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/card.css">
<header class="header">
    <div class="logo txt-logo">CICOHealth</div>
    <div class="nav-content" id="nav-content">
        <ul class="menu">

            <li class="nav-link"><a href="/CICOHealth/" class="menu-item">Home</a></li>
            <li class="nav-link"><a href="/CICOHealth/food-search" class="menu-item">Food</a></li>
            <li class="nav-link"><a href="/CICOHealth/exercise-search" class="menu-item">Exercise</a></li>
            <li class="nav-link dropdown"><a href="" class="menu-item">Utilities <i class="fa-solid fa-caret-down"></i></a>
                <ul class="dropdown-menu">
                    <li class="dropdown-item"><a href="/CICOHealth/conversion">Convert Unit</a></li>
                    <li class="dropdown-item"><a href="/CICOHealth/timer">Timer</a></li>
                </ul>
            </li>
            <li class="nav-link"><a href="/CICOHealth/faq" class="menu-item">FAQ</a></li>
                <c:choose>
                    <c:when test="${sessionScope.user == null}">
                    <li class="nav-link nav-btn"><a href="/CICOHealth/login" class="btn-item">Login</a></li>
                    <li class="nav-link nav-btn"><a href="/CICOHealth/register" class="btn-item">Register</a></li>
                    </c:when>
                    <c:otherwise>
                    <li class="nav-link dropdown"><a href="" class="menu-item">User<i class="fa-solid fa-caret-down"></i></a>
                        <ul class="dropdown-menu">
                            <li class="dropdown-item"><a href="/CICOHealth/user/profile">Profile</a></li>
                            <li class="dropdown-item"><a href="/CICOHealth/user/meal-logs">Meal Logs</a></li>
                            <li class="dropdown-item"><a href="/CICOHealth/user/exercise-logs">Exercise Logs</a></li>
                        </ul>
                    </li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
    <div class="menu-hamburger" id="menu-hamburger">
        <img src="./assets/img/icon.png" alt="menu-hamburger">
    </div>
</header>