<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/sass/main/navbar.css">


<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
<!-- MDB -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.css" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/sass/main/card.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Homepage.css">
<!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/card.css"> -->
<c:set var = "user" value="${sessionScope.user}"></c:set>

    <nav class="navbar navbar-expand-lg">
        <div class="container">
            <a class="navbar-brand me-2" href="/CICOHealth/">CICO<span class="nav-title">Health</span> </a>

            <button class="navbar-toggler" type="button" data-mdb-toggle="collapse"
                    data-mdb-target="#navbarButtonsExample" aria-controls="navbarButtonsExample" aria-expanded="false"
                    aria-label="Toggle navigation">
                <i class="fas fa-bars"></i>
            </button>

            <div class="collapse navbar-collapse" id="navbarButtonsExample">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="/CICOHealth/food-search">Food</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/CICOHealth/exercise-search">Exercise</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                           data-mdb-toggle="dropdown" aria-expanded="false">
                            Utilities
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li>
                                <a class="dropdown-item" href="/CICOHealth/conversion">Convert Unit</a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="/CICOHealth/timer">Timer</a>
                            </li>
                            <li>
                        </ul>
                    </li>
                <c:choose>
                    <c:when test="${user!=null && user.getUserRole() == 'AD'}">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                               data-mdb-toggle="dropdown" aria-expanded="false">
                                FAQ
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li>
                                    <a class="dropdown-item" href="/CICOHealth/faq/questions">Questions</a>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="/CICOHealth/faq/answers">Answers</a>
                                </li>
                                <li>
                            </ul>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item">
                            <a class="nav-link" href="/CICOHealth/faq">FAQ</a>
                        </li>
                    </c:otherwise>
                </c:choose>

            </ul>
            <c:choose>
                <c:when test="${user == null}">
                    <div class="d-flex nav-right">
                        <a href="/CICOHealth/login" class="btn">Login</a>
                        <a href="/CICOHealth/register" class="btn">Register</a>
                    </div>
                </c:when>
                <c:otherwise>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                           data-mdb-toggle="dropdown" aria-expanded="false">
                            User
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
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
                                <a class="dropdown-item" href="/CICOHealth/log-out">Log out</a>
                            </li>
                        </ul>
                    </li>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</nav>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.js"></script>