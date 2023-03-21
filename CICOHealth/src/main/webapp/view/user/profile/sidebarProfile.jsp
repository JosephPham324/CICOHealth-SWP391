<%@page import="dao.UserDao"%>
<%@page import="bean.User"%>
<link rel="stylesheet" href="/CICOHealth/assets/css/sidebarProfile.css">
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
                <% User sessionUser = (User) session.getAttribute("user"); %>
                <% User requestUser = (User) new UserDao().getUser(request.getParameter("userid"));%>
                <li><a href="/CICOHealth/user/profile/user-info?userid=<%=requestUser != null ? requestUser.getUserID() : sessionUser.getUserID()%>" class="sidebar-link">User Info</a></li>
                <li><a href="/CICOHealth/user/profile/login-info?userid=<%=requestUser != null ? requestUser.getUserID() : sessionUser.getUserID()%>" class="sidebar-link">Login Info</a></li>
                <li><a href="/CICOHealth/user/profile/health-info?userid=<%=requestUser != null ? requestUser.getUserID() : sessionUser.getUserID()%>" class="sidebar-link">Health Info</a></li>
                    <%
                        if (sessionUser.getUserRole().equalsIgnoreCase("FE")) {
                    %>
                <li><a href="/CICOHealth/user/profile/expert-info?userid=<%=sessionUser.getUserID()%>" class="sidebar-link">Expert Info</a></li>
                    <%}%>
            </ul>
        </div>
    </div>
</nav>

