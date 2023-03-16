<%-- 
    Document   : resistanceStatistics
    Created on : Mar 6, 2023, 7:39:29 AM
    Author     : Pham Nhat Quang CE170036 (FPTU CANTHO)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        ${initParam.Bootstrap}   

        ${initParam.FontAwesome}

        <link rel="stylesheet" href="/CICOHealth/assets/sass/main/statistics/statistics.css">
        <title>Resistance Statistics</title>
    </head>
    <body>
        <jsp:include page="mainStructure.jsp" />
        <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
        <script type="module" src="/CICOHealth/assets/scripts/statistics/resistancestatistics.js"></script>
    </body>
</html>

