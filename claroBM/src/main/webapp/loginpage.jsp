<%-- 
    Document   : loginpage
    Created on : 22/04/2019, 10:57:20 AM
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

        <!-- Main CSS-->
        <link href="css/style.css" rel="stylesheet">


    </head>
    <body class="text-center">
        <div class="au-div col-lg-5 m-auto">
            <form class="form-signin" action="j_security_check" method="POST">
                <img class="au-img" src="images/clarologo.png" alt="">
                <label for="inputUser" class="sr-only">Username</label>
                <input type="text" id="inputUser" class="form-control" placeholder="Username" name="j_username" required autofocus>
                <label for="inputPassword" class="sr-only">Password</label>
                <input type="password" id="inputPassword" class="form-control" placeholder="Password" name="j_password" required>
                <button class="btn btn-lg btn-danger btn-block" type="submit">Sign in</button>
                <p class="mt-5 mb-3 text-muted">&copy; 2019</p>
            </form>
        </div>
        <!-- Jquery JS-->
        <script src="js/jquery-3.4.0.min.js"></script>

        <!-- Bootstrap JS-->
        <script src="js/bootstrap.js"></script>

        <!-- Main JS-->
        <script src="js/main.js"></script>
    </body>
</html>
<!-- End document -->

