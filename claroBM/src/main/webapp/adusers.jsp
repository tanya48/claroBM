<%-- 
    Document   : adusers
    Created on : 9/05/2019, 01:45:48 PM
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
                        <div class="col-md-10">
                            <div class="table-wrapper shadow">
                                <div class="table-title">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <i class="central-i fas fa-user-shield"></i>
                                            <label class="dat" >Active Directory users</label>                                                                                                                    
                                        </div>
                                        <div class="col-lg-6">
                                            <a href="#deleteADUser" class="btn btn-danger" data-toggle="modal"><i class="fas fa-minus-circle" ></i> <span>Delete</span></a>						
                                            <a href="#addADUser" class="btn btn-success" data-toggle="modal"><i class="fas fa-plus-circle" ></i> <span>Add AD User</span></a>                            
                                        </div>

                                    </div>
                                </div>
                                <display:table uid="row" class="table table-striped table-hover" name="listADUsers" pagesize="7" requestURI="usersad">
                                    <display:column title="<span class='custom-checkbox'> <input type='checkbox' id='selectAll'><label for='selectAll'></label></span>">                                               
                                        <span class="custom-checkbox">
                                            <input type="checkbox" id="checkbox1" name="options[]" value="1">
                                            <label for="checkbox1"></label>
                                        </span>
                                    </display:column>
                                    <display:column property="uadname" title="Username" />
                                    <display:column property="clli" title="Central CLLI" />
                                    <display:column property="fullDescription" title="Central type" />
                                    <display:column property="cuname" title="Central username" />
                                    <display:column title="Actions" > 
                                        <a href="#editADUser" class="edit" data-toggle="modal"><i data-toggle="tooltip" class="fas fa-pencil-alt"></i></a>
                                        <a href="#deleteADUser<s:property value="%{#attr.row.uadid}" />" class="delete" data-toggle="modal"><i data-toggle="tooltip" class="fas fa-trash-alt"></i></a>
                                        <!-- Delete AD User Modal -->
                                        <div id="deleteADUser<s:property value="%{#attr.row.uadid}" />" class="modal fade">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <form action="deleteADUser" method="POST">
                                                        <div class="modal-header">						
                                                            <h4 class="modal-title">Delete Active Directory User</h4>
                                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                        </div>
                                                        <div class="modal-body">					
                                                            <div class="form-row">
                                                                <div class="form-group col-lg-12">
                                                                    <input type="hidden" name="uadid" value="<s:property value='%{#attr.row.uadid}'/>">
                                                                    <p>Are you sure you want to delete <strong> <s:property value='%{#attr.row.uadname}'/> </strong>?</p>
                                                                    <div class="alert alert-warning" role="alert">
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
                                        <!-- Edit AD User Modal -->
                                        <div id="editADUser" class="modal fade">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <form>
                                                        <div class="modal-header">						
                                                            <h4 class="modal-title">Edit Active Directory User</h4>
                                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="form-row">
                                                                <div class="form-group col-md-12">
                                                                    <label>Username</label>
                                                                    <input type="text" class="form-control" required>
                                                                </div>
                                                            </div>
                                                            <div class="form-row">
                                                                <div class="form-group col-md-12">
                                                                    <label>Central</label>
                                                                    <select id="inputStateCntral" class="form-control" required>
                                                                        <option>Choose...</option>
                                                                        <option>...</option>
                                                                    </select>
                                                                </div>
                                                            </div>  
                                                        </div>
                                                        <div class="modal-footer">
                                                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                                            <input type="submit" class="btn btn-info" value="Save">
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </display:column>
                                    <display:setProperty name="paging.banner.placement" value="bottom" />
                                </display:table>

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
        <!-- Add AD User Modal -->
        <div id="addADUser" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="addADUser">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Active Directory User</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-row">
                                <div class="form-group col-md-12">
                                    <label>Username</label>
                                    <input name="madname" type="text" class="form-control" required>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-12">
                                    <label>Central</label>
                                    <s:select name="lcwu" headerKey="-1" headerValue="--Select--"
                                              list="listCentralwU" class="form-control"
                                              listKey="cuid" listValue="clli + ' ' + fullDescription + ' : ' + cuname"/>
                                </div>
                            </div>  
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
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

