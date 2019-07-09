<%-- 
    Document   : users
    Created on : 8/05/2019, 12:18:19 PM
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
                                <a class="nav-link" href="index.action">Centrals <span class="sr-only">(current)</span></a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Users</a>
                                <div class="dropdown-menu" aria-labelledby="dropdown01">
                                    <a class="dropdown-item" href="usersc.action">Central users</a>
                                    <a class="dropdown-item" href="usersad.action">Active Directory users</a>
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
                        <div class="col-md-9">
                            <div class="table-wrapper shadow">
                                <div class="table-title">
                                    <div class="row">
                                        <div class="col-lg-5">
                                            <i class="central-i fas fa-user-tag"></i>
<!--                                            <p for="resultado" style="color: #FF0000"><s:actionerror/></p> -->
                                            <label class="dat">Central users </label>                                                                              
                                        </div>
<!--                                        <div class="col-lg-5">
                                            <a href="#deleteCentralUser" class="btn btn-danger" data-toggle="modal"><i class="fas fa-minus-circle" ></i> <span>Delete</span></a>						
                                            <a href="#addCentralUser" class="btn btn-success" data-toggle="modal"><i class="fas fa-plus-circle" ></i> <span>Add Central User</span></a>                            
                                        </div>-->
                                    </div>
                                </div>
                                <form action="deleteAllCu" method="POST">
                                    <display:table uid="row" class="table table-striped table-hover" name="listCentralUsers" pagesize="6" requestURI="usersc">
                                        <display:column title="<span class='custom-checkbox'> <input type='checkbox' id='selectAll'><label for='selectAll'></label></span>">                                               
                                            <span class="custom-checkbox">
                                                <input type="checkbox" id="checkbox1" name="idcu[${row_rowNum}]" value="<s:property value="%{#attr.row.cuid}"/>">
                                                <label for="checkbox1"></label>
                                            </span>
                                        </display:column>
                                        <display:column property="cuname" title="Username" />
                                        <display:column property="clli" title="Central CLLI" />
                                        <display:column property="fullDescription" title="Central type" />
                                        <display:column title="Edit" >
                                            <form action="editCU" method="POST">
                                                <input type='hidden' value="<s:property value="%{#attr.row.cuid}"/>" name='cuid'/>
                                                <button type="submit" class="btn btn-default2">
                                                    <i style="color: #FFC107;" class="fas fa-pencil-alt"></i>
                                                </button>
                                            </form>
                                        </display:column>
                                        <display:column title="Delete" > 
                                            <a href="#deleteCentralUser<s:property value="%{#attr.row.cuid}" />" class="delete" data-toggle="modal"><i data-toggle="tooltip" class="fas fa-trash-alt"></i></a>
                                            <!-- Delete Central User Modal-->
                                            <div id="deleteCentralUser<s:property value="%{#attr.row.cuid}" />" class="modal fade">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <form action="deleteCentralUser" method="POST">
                                                            <div class="modal-header">						
                                                                <h4 class="modal-title">Delete Central User</h4>
                                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                            </div>
                                                            <div class="modal-body">					
                                                                <div class="form-row">
                                                                    <div class="form-group col-lg-12">
                                                                        <input type="hidden" name="cuid" value="<s:property value='%{#attr.row.cuid}'/>">
                                                                        <p>Are you sure you want to delete <strong> <s:property value='%{#attr.row.cuname}'/> </strong> ?</p>
                                                                        <div class="alert alert-warning" role="alert">
                                                                            This will also remove any Active Directory User related or associated with it.<br>
                                                                            This action cannot be undone.
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                                                <input type="submit" class="btn btn-danger" value="Delete">
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>  
                                        </display:column>
                                        <display:footer>
                                            <div class="row align-content-end ">
                                                <div class="col-lg-12 fot align-self-end">
                                                    <a href="#deleteAllCentralUser" class="btn btn-danger" data-toggle="modal"><i class="fas fa-minus-circle" ></i> <span>Delete</span></a>						
                                                    <a href="#addCentralUser" class="btn btn-success" data-toggle="modal"><i class="fas fa-plus-circle" ></i> <span>Add Central User</span></a>
                                                    <!-- Delete Central User Modal -->
                                                    <div id="deleteAllCentralUser" class="modal fade">
                                                        <div class="modal-dialog">
                                                            <div class="modal-content">
                                                                <form action="deleteAllCu" method="POST">
                                                                    <div class="modal-header">						
                                                                        <h4 class="modal-title">Delete Central Users</h4>
                                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        <div class="form-row">
                                                                            <div class="form-group col-lg-12">
                                                                                <p>Are you sure you want to delete central <strong>All these records</strong> ?</p>
                                                                                <div class="alert alert-warning" role="alert">
                                                                                    This will also remove any USER related or associated with it. <br>
                                                                                    This action cannot be undone                                                                      
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <input type="button" class="btn btn-da btn-default" data-dismiss="modal" value="Cancel">
                                                                        <input type="submit" class="btn btn-da btn-danger" value="Delete">
                                                                    </div>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div> 
                                        </display:footer>
                                        <display:setProperty name="paging.banner.placement" value="bottom" />
                                    </display:table>
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


        <!-- Add Central User Modal-->
        <div id="addCentralUser" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="addCentralUser" method="POST" onsubmit="return checkCU()">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Central User</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>

                        <div class="modal-body">
                            <div class="form-row">
                                <div class="form-group col-lg-12">
                                    <div id="response"></div>
                                </div>
                                <div class="form-group col-lg-12">
                                    <label>Username</label>
                                    <input name="mcuname" id="mcuname" type="text" class="form-control" required>
                                    <span id="em_cuname" class="text-danger"></span>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-12">
                                    <label>Central</label>
                                    <s:select id="lcwt" requiredLabel="true" name="lcwt" headerKey="-1" headerValue="--Select--"
                                              list="listCentralwT" class="form-control"
                                              listKey="cid" listValue="clli + ' ' + fullDescription"/>
                                    <span id="em_lcwt" class="text-danger"></span>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label>Password</label>
                                    <input name="mcupass" id="mcupass" type="password" class="form-control" required>
                                    <span id="em_cupass" class="text-danger"></span>
                                </div>
                                <div class="form-group col-md-6">
                                    <label>Confirm password</label>
                                    <input name="mcucpass" id="mcucpass" type="password" class="form-control" required>
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
                            <input id="cancelCentralUser" type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!--        -->  
        <!-- Jquery JS-->
        <script src="js/jquery-3.4.0.min.js"></script>
        <script src="js/popper.min.js"></script>
        <!-- Bootstrap JS-->
        <script src="js/bootstrap.js"></script>
        <!-- Main JS-->
        <script src="js/main.js" type="text/javascript"></script>
</html>

