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
                        <div class="col-md-10">
                            <div class="table-wrapper shadow">
                                <div class="table-title">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <i class="central-i fas fa-user-shield"></i>
                                            <label class="dat" >Active Directory Users</label>                                                                                                                    
                                        </div>
                                        <!--                                        <div class="col-lg-6">
                                                                                    <a href="#deleteADUser" class="btn btn-danger" data-toggle="modal"><i class="fas fa-minus-circle" ></i> <span>Delete</span></a>						
                                                                                    <a href="#addADUser" class="btn btn-success" data-toggle="modal"><i class="fas fa-plus-circle" ></i> <span>Add AD User</span></a>                            
                                                                                </div>-->
                                    </div>
                                </div>
                                <form action="deleteAllAd" method="POST">
                                    <display:table uid="row" class="table table-striped table-hover" name="listADUsers" pagesize="6" requestURI="usersad">
                                        <display:column title="<span class='custom-checkbox'> <input type='checkbox' id='selectAll'><label for='selectAll'></label></span>">                                               
                                            <span class="custom-checkbox">
                                                <input type="checkbox" id="checkbox1" name="idad[${row_rowNum}]" value="<s:property value="%{#attr.row.uadid}"/>">
                                                <label for="checkbox1"></label>
                                            </span>
                                        </display:column>
                                        <display:column property="uadname" title="Username" />
                                        <display:column property="clli" title="Central CLLI" />
                                        <display:column title="Central Profiles">
                                            <s:iterator value="#attr.row.cprof">
                                                <s:property value="pname"/><br>
                                            </s:iterator>
                                        </display:column>
                                        <display:column property="fullDescription" title="Central type" />
                                        <display:column property="cuname" title="Central username" />
                                        <display:column title="Edit" >
                                            <form action="editAD" method="POST">
                                                <input type='hidden' value="<s:property value="%{#attr.row.uadid}"/>" name='uadid'/>
                                                <button type="submit" class="btn btn-default2">
                                                    <i style="color: #FFC107;" class="fas fa-pencil-alt"></i>
                                                </button>
                                            </form>
                                        </display:column>
                                        <display:column title="Delete" > 
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
                                        </display:column>
                                        <display:footer>
                                            <div class="row align-content-end ">
                                                <div class="col-lg-12 fot align-self-end">
                                                    <a href="#deleteAllAdUser" class="btn btn-danger" data-toggle="modal"><i class="fas fa-minus-circle" ></i> <span>Delete</span></a>						
                                                    <a href="#addADUser" class="btn btn-success" data-toggle="modal"><i class="fas fa-plus-circle" ></i> <span>Add AD User</span></a>
                                                    <!-- Delete Central User Modal -->
                                                    <div id="deleteAllAdUser" class="modal fade">
                                                        <div class="modal-dialog">
                                                            <div class="modal-content">
                                                                <form action="deleteAllAd" method="POST">
                                                                    <div class="modal-header">						
                                                                        <h4 class="modal-title">Delete Active Directory Users</h4>
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
        <!-- Add AD User Modal -->
        <div id="addADUser" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="addADUser" method="POST" name="addADForm" onsubmit="return checkAD()">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Active Directory User</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-row">
                                <div class="form-group col-lg-12">
                                    <div id="response"></div>
                                </div>
                                <div class="form-group col-md-12">
                                    <label>Username</label>
                                    <input id="madname" name="madname" type="text" class="form-control" required>
                                    <span id="em_adname" class="text-danger"></span>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-12">
                                    <label>Central</label>
                                    <s:select id="lcwu" required="true" name="lcwu" headerKey="-1" headerValue="--Select--"
                                              list="listCentralwU" class="form-control"
                                              listKey="cuid" listValue="clli + ' ' + fullDescription + ' : ' + cuname"/>
                                    <span id="em_lcwu" class="text-danger"></span>
                                </div>
                            </div>  
                            <div class="form-row">
                                <div class="form-group col-md-12">
                                    <label>Profiles</label>
                                    <select id="lcwup" name="profiles">
                                        <option value="">Select profile</option>
                                    </select>
                                    <span id="em_lcwu" class="text-danger"></span>
                                </div>
                            </div>  
                        </div>
                        <div class="modal-footer">
                            <input id="cancelADUser" type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
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

