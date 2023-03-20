<%@page import="bean.User"%>
<link rel="stylesheet" href="/CICOHealth/assets/css/sidebarProfile.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
      rel="stylesheet" />
<!-- MDB -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.css"
      rel="stylesheet" />
<link rel="stylesheet" href="/CICOHealth/assets/css/loginInfo.css" /> 
<link rel="stylesheet" href="/CICOHealth/assets/css/healthInfo.css" /> 
<link rel="stylesheet" href="/CICOHealth/assets/sass/main/loginInfo.css">
<a id="show-sidebar" class="btn btn-sm" href="#">
    <i class="fas fa-bars"></i>
</a>
<nav id="sidebar" class="sidebar-wrapper">
    <div class="sidebar-content">
        <div class="sidebar-brand">
            <a href="#">View</a>
            <div id="close-sidebar">
                <i class="fas fa-times"></i>
            </div>
        </div>
        <div class="sidebar-menu">
            <ul class="list-unstyled">
                <li><a href="/CICOHealth/user/statistics/nutrition" class="sidebar-link">Nutrition</a></li>
                <li><a href="/CICOHealth/user/statistics/exercise/cardio" class="sidebar-link">Cardio Exercise</a></li>
                <li><a href="/CICOHealth/user/statistics/exercise/resistance" class="sidebar-link">Resistance Exercise</a></li>
                <li><a href="/CICOHealth/user/statistics/health-info" class="sidebar-link">Health Information</a></li>
            </ul>
        </div>
    </div>
</nav>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/CICOHealth/assets/scripts/sidebar.js"></script>


