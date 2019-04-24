<%-- 
    Document   : index
    Created on : 16/04/2019, 05:57:36 PM
    Author     : Tanya Tapia
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Administration</title>
        <!-- Fontfaces CSS-->
        <link href="css/font-face.css" rel="stylesheet" media="all">
        <link href="css/font-awesome.css" rel="stylesheet" media="all">

        <!-- Bootstrap CSS-->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Main CSS-->
        <link href="css/style.css" rel="stylesheet">

    </head>
    <body>
        <nav class="navbar navbar-expand-md navbar-light fixed-top">
            <a class="navbar-brand" href="#"><img class="au-img-ad" src="images/claroblanco.png" alt=""></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarsExampleDefault">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item dropdown active">
                        <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">USERS</a>
                        <div class="dropdown-menu" aria-labelledby="dropdown01">
                            <a class="dropdown-item" href="#">USERS</a>
                            <a class="dropdown-item" href="#">CENTRALS</a>
                            <a class="dropdown-item" href="#">PROFILES</a>
                        </div>
                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <!--input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search"-->

                    <a href="<s:url action='logout'/>" class="button"> Sign out</a>
                </form>
            </div>
        </nav>
        s        <main role="main" class="container">

            <div class="starter-template">
                
            </div>

        </main><!-- /.container -->

        <!-- Jquery JS-->
        <script src="js/jquery-3.4.0.min.js"></script>

        <!-- Bootstrap JS-->
        <script src="js/bootstrap.js"></script>

        <!-- Main JS-->
        <script type="text/javascript">
            function noBack()
            {
                window.history.forward()
            }
            noBack();
            window.onload = noBack;
            window.onpageshow = function (evt) {
                if (evt.persisted)
                    noBack()
            }
            window.onunload = function () {
                void (0)
            }
        </script>
    </body>
</html>
<!-- End document -->

