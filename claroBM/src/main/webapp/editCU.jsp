<%-- 
    Document   : editCU
    Created on : 23/05/2019, 05:45:25 PM
    Author     : Tanya Tapia 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Claro · Management</title>

        <link href="css/font-face.css" rel="stylesheet" media="all">
        <link href="css/font-awesome.css" rel="stylesheet" media="all">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">

        <!-- Bootstrap CSS-->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
    </head>
    <body class="index-bd">
        <header>
            <nav class="navbar navbar-dark navbar-expand-lg shadow-sm">
                <div class="container">
                    <img src="images/claroblanco.png">                  
                    <div class="collapse navbar-collapse" id="navbarsExample07">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="<s:url action='index'/>">Centrals <span class="sr-only">(current)</span></a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Users</a>
                                <div class="dropdown-menu" aria-labelledby="dropdown01">
                                    <a class="dropdown-item" href="<s:url action='usersc'/>">Central users</a>
                                    <a class="dropdown-item" href="<s:url action='usersad'/>">Active Directory users</a>
                                </div>
                            </li>
                        </ul>
                        <form action="logout">
                            <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Sign out</button>
                        </form>
                    </div>
                </div>
            </nav>
        </header>

        <main role="main">
            <div class="album py-5 bg-light">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-md-6">
                            <div class="table-wrapper shadow">
                                <div class="table-title">
                                    <div class="row">
                                        <div class="col-lg-7">
                                            <i class=" central-i fas fa-user-edit"></i><label class="dat" > Edit central user</label>                                        
                                        </div>
                                        <div class="col-lg-5">
                                            <label class="dat-2" ><s:property value="centralUser.cuname"/> <s:property value="centralUser.fullDescription"/> </label>                                        
                                        </div>
                                    </div>
                                </div>
                                <form class="editModal" action="updateCU" method="POST" onsubmit="return checkCU()">
                                    <hr>
                                    <div class="modal-body">
                                        <div class="form-row">
                                            <div class="form-group col-lg-12">
                                                <label>Username</label>
                                                <input type="hidden" name="cuid" value="<s:property value="centralUser.cuid"/>"/>
                                                <input id="mcuname" name="mcuename" type="text" value="<s:property value="centralUser.cuname"/>" class="form-control" required>
                                                <span id="em_cuname" class="text-danger"></span>
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-md-12">
                                                <label>Central</label>
                                                <s:select requiredLabel="true" id="lcwt" name="lcwt" headerKey="-1" headerValue="--Select--"
                                                          list="listCentralwT" class="form-control"
                                                          listKey="cid" listValue="clli + ' ' + fullDescription"/>
                                                <span id="em_lcwt" class="text-danger"></span>
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-md-6">
                                                <label>New password</label>
                                                <input id="mcupass" name="mcuepass" type="password" class="form-control" required>
                                                <span id="em_cupass" class="text-danger"></span>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label>Confirm password</label>
                                                <input id="mcucpass" name="mcuecpass" type="password" class="form-control" required>
                                                <span id="em_cucpass" class="text-danger"></span>
                                                <span id="em_cucpass2" class="text-success"></span>
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-md-6">
                                                <label class="text-warning">- At least one number and one letter</label>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label class="text-warning">- 4 to 8 characters</label>                                    
                                            </div>
                                        </div>                           
                                    </div>
                                    <div class="modal-footer">
                                        <a href="usersc.action" class="btn btn-default">Cancel</a>
                                        <input type="submit" class="btn btn-info" value="Save">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <footer class="text-muted">
            <div class="container">
                <p>Claro footer </p>
            </div>
        </footer>
        <!-- Jquery JS-->
        <script src="js/jquery-3.4.0.min.js"></script>
        <script src="js/popper.min.js"></script>
        <!-- Bootstrap JS-->
        <script src="js/bootstrap.js"></script>
        <!-- Main JS-->
        <script src="js/main.js" type="text/javascript"></script>
</html>



