<%-- 
    Document   : editCU
    Created on : 22/05/2019, 05:51:06 PM
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
                        <div class="col-md-8">
                            <div class="table-wrapper shadow">
                                <div class="table-title">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <i class=" central-i fas fa-edit"></i><label class="dat" > Edit central</label>                                        
                                        </div>
                                        <div class="col-lg-6">
                                            <label class="dat-2" ><s:property value="centralU.clli"/> <s:property value="centralU.fullDescription"/> </label>                                        
                                        </div>
                                    </div>
                                </div>
                                <form class="editModal" action="updateCentral" method="POST" onsubmit="return checkC()">
                                    <hr>
                                    <div class="modal-body ">
                                        <!--Poner div alert-->
                                        <div class="form-row">
                                            <div class="form-group col-md-7">
                                                <label>CLLI</label>
                                                <input type="hidden" name="cid" value="<s:property value="centralU.cid"/>"/>
                                                <input id="mclli" name="mceclli" type="text" value="<s:property value="centralU.clli"/>" class="form-control" required>
                                                <span id="em_clli" class="text-danger"></span>
                                            </div>
                                            <div class="form-group col-md-5">
                                                <label>Central type</label>
                                                <s:select id="lc" name="lc" headerKey="-1" headerValue="--Select--"
                                                          list="listCentralType" class="form-control"
                                                          listKey="ctid" listValue="tecnologia + ' ' + descripcion "/>
                                                <span id="em_lc" class="text-danger"></span>
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-md-7">
                                                <label>Proxy IP</label>
                                                <input id="mpip" name="mcepip" type="text" value="<s:property value="centralU.pip"/>" class="form-control" required>
                                                <span id="em_pip" class="text-danger"></span>
                                            </div>
                                            <div class="form-group col-md-5">
                                                <label>Proxy port</label>
                                                <input id="mpport" name="mcepport" type="text" value="<s:property value="centralU.pport"/>" class="form-control" required>
                                                <span id="em_pport" class="text-danger"></span>
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-md-7">
                                                <label>Central IP</label>
                                                <input id="mcip" name="mcecip" type="text" value="<s:property value="centralU.cip"/>" class="form-control" required>
                                                <span id="em_cip" class="text-danger"></span>
                                            </div>
                                            <div class="form-group col-md-5">
                                                <label>Central ports</label>
                                                <s:iterator value="cp" status="status">
                                                    <s:textfield class="form-control" id="mcport0" name="central.cp[%{#status.index}].cport" value="%{cport}"/>
                                                    <span id="em_cports0" class="text-danger"></span>
                                                    <s:textfield type="hidden" class="form-control" name="central.cp2[%{#status.index}].cport" value="%{cport}"/><br>
                                                </s:iterator>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <a href="index.action" class="btn btn-default">Cancel</a>
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


