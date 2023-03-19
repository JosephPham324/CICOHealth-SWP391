<%-- Document : nutritionStatistics Created on : Mar 3, 2023, 7:57:41 PM Author : Pham Nhat Quang CE170036 (FPTU CANTHO)
    --%>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            ${initParam.Bootstrap}

            ${initParam.FontAwesome}

            <link rel="stylesheet" href="/CICOHealth/assets/sass/main/statistics/statistics.css">
            <title>Nutrition Statistics</title>
        </head>

        <body>
            <jsp:include page="mainStructure.jsp" />
                <script type="module" src="/CICOHealth/assets/scripts/statistics/nutritionstatistics.js"></script>
        </body>

        </html>