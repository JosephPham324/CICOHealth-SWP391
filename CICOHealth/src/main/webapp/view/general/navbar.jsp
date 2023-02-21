<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <li class="nav-link"><a href="/CICOhealth/faq" class="menu-item">FAQ</a></li>
                <c:choose>
                    <c:when test="${sessionScope.user == null}">
                    <li class="nav-link nav-btn"><a href="/CICOHealth/login" class="btn-item">Login</a></li>
                    <li class="nav-link nav-btn"><a href="/CICOHealth/register" class="btn-item">Register</a></li>
                    </c:when>
                    <c:otherwise>
                    <li class="nav-link dropdown"><a href="" class="menu-item">User<i class="fa-solid fa-caret-down"></i></a>
                        <ul class="dropdown-menu">
                            <li class="dropdown-item"><a href="/CICOHealth/user/profile">Profile</a></li>
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