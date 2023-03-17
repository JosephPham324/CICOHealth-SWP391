<%-- Document : message Created on : Mar 16, 2023, 4:48:27 PM Author : Pham Nhat
Quang CE170036 (FPTU CANTHO) --%> <%@page
import="org.apache.commons.lang3.StringUtils"%> <%@page contentType="text/html"
pageEncoding="UTF-8"%> <%if (request.getParameter("status") != null) {%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <link rel="stylesheet" href="/CICOHealth/view/segments/messagestyle.css">
  </head>

  <body>
    <% // Retrieve the status and message parameters from the request 
    String status = request.getParameter("status"); String message =
    request.getParameter("message"); 
    // Set the CSS class for the message element based on the status parameter 
    String cssClass = ""; if
    ("success".equals(status)) { cssClass = "success"; } else if
    ("failure".equals(status)) { cssClass = "failure"; } else if
    ("error".equals(status)) { cssClass = "error"; } %>
    <div id="message" class="<%= cssClass%> hide-on-animation">
      <div class="message-wrapper">
        <div class="status"><%=StringUtils.capitalize(status) + ": "%></div>
        <%= message%>
      </div>
    </div>
  </body>
</html>
<%}%>
