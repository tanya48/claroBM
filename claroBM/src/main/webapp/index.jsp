<%-- 
    Document   : index
    Created on : 16/04/2019, 05:57:36 PM
    Author     : User
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!-- Meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Title Page-->
    <title>ClaroBM</title>

    <!-- Fontfaces CSS-->
    <link href="css/font-face.css" rel="stylesheet" media="all">
    <link href="css/font-awesome.css" rel="stylesheet" media="all">

    <!-- Bootstrap CSS-->
    <link href="css/bootstrap.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="css/theme.css" rel="stylesheet" media="all">
</head>
<body>
<div class="row">
    <div class="col-lg-5 m-auto">
        <div class="card mt-5">
            <div class="card-title text-center mt-4 ml-3" >
                <img class="au-img" src="images/clarologo.png">
            </div>
            <div class="card-body">
                <form action="j_security_check" method="POST">
                    <div class="form-group">
                        <label>Username</label><br>
                        <input type="text" class="form-control py-4 inputstyle" name="j_username" >
                    </div>
                    <div class="form-group">
                        <label>Password</label>
                        <input type="password" class="form-control py-4 inputstyle" name="j_password" >
                    </div>
                    <div class="form-group" >
                        <button type="submit" class="btn btn-danger btn-block inputstyle">SIGN IN</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
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
