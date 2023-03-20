<%-- 
    Document   : healthInfoStatistic
    Created on : Mar 8, 2023, 8:33:56 AM
    Author     : vhqua
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="/CICOHealth/assets/sass/main/statistics/statistics.css">
        <title>Health Info Statistics | ${initParam.webappName}</title>
    </head>
    <body>
        <jsp:include page="mainStructure.jsp" />
        <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
        <script type="module" src="/CICOHealth/assets/scripts/statistics/healthinfostatistics.js"></script>
    </body>
</html>

