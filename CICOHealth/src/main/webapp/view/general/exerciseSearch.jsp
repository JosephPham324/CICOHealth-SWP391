<%-- 
    Document   : exerciseSearch
    Created on : Feb 19, 2023, 2:19:31 PM
    Author     : khiem
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="/exercise" method="get">
            <input type="text" name="txtExercise">
            <button type="submit" name="btnSearch" value="ex-search">Search</button>
        </form>
    </body>
</html>
