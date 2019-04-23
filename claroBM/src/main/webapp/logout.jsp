<%-- 
    Document   : logout
    Created on : 22/04/2019, 05:32:52 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Claro</title>

        <!-- Fontfaces CSS-->
        <link href="css/font-face.css" rel="stylesheet" media="all">
        <link href="css/font-awesome.css" rel="stylesheet" media="all">

        <!-- Bootstrap CSS-->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/signin.css" rel="stylesheet">

    </head>
    <body class="text-center">
        <%
            session.invalidate();
            response.sendRedirect("index.jsp");
        %>
        <!-- Jquery JS-->
        <script src="js/jquery-3.4.0.min.js"></script>

        <!-- Bootstrap JS-->
        <script src="js/bootstrap.js"></script>

        <!-- Main JS-->
        <script src="js/main.js"></script>
    </body>
</html>
