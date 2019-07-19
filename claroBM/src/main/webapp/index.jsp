<%-- 
    Document   : index
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
        <!--        <span id="suc_add" class="text-success"></span>-->

        <main role="main">
            <div class="album py-5 bg-light">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="table-wrapper shadow">
                                <div class="table-title">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <i class=" central-i fas fa-warehouse"></i><label class="dat" >Centrals</label>                                        
                                        </div>
                                        <!--                                        <div class="col-lg-6">
                                                                                    <a href="#deleteAllCentral" class="btn btn-danger" data-toggle="modal"><i class="fas fa-minus-circle" ></i> <span>Delete</span></a>						
                                                                                    <a href="#addCentral" class="btn btn-success" data-toggle="modal"><i class="fas fa-plus-circle" ></i> <span>Add Central</span></a>                            
                                                                                </div>-->
                                    </div>
                                </div>
                                <form action="deleteAllCentral" method="POST">
                                    <display:table uid="row" class="table table-striped table-hover" name="listCentrals" pagesize="6" requestURI="index">
                                        <display:column title="<span class='custom-checkbox'> <input type='checkbox' id='selectAll'><label for='selectAll'></label></span>">                                               
                                            <span class="custom-checkbox">
                                                <input type="checkbox" id="checkbox1" name="id[${row_rowNum}]" value="<s:property value="%{#attr.row.cid}" />">
                                                <label for="checkbox1"></label>
                                            </span>
                                        </display:column>
                                        <display:column property="clli" title="CLLI" />                                    
                                        <display:column property="fullDescription" title="Central type" />
                                        <display:column title="Central Profiles">
                                            <s:iterator value="#attr.row.cprof">
                                                <s:property value="pname"/><br>
                                            </s:iterator>
                                        </display:column>
                                        <display:column property="cip" title="Central IP" />
                                        <display:column title="Central Ports">
                                            <s:iterator value="#attr.row.cp">
                                                <s:property value="cport"/><br>
                                            </s:iterator>
                                        </display:column>
                                        <display:column property="pip" title="Proxy IP" />
                                        <display:column property="pport" title="Proxy port" />
                                        <display:column title="Edit" >
                                            <form action="editCentral" method="POST">
                                                <input type='hidden' value="<s:property value="%{#attr.row.cid}"/>" name='cid'/>
                                                <button type="submit" class="btn btn-default2">
                                                    <i style="color: #FFC107;" class="fas fa-pencil-alt"></i>
                                                </button>
                                            </form>
                                        </display:column>
                                        <display:column title="Delete" >
                                            <a href="#deleteCentral<s:property value="%{#attr.row.cid}" />" class="delete" data-toggle="modal"><i data-toggle="tooltip" class="fas fa-trash-alt"></i></a>
                                            <!-- Delete Central Modal -->
                                            <div id="deleteCentral<s:property value="%{#attr.row.cid}" />" class="modal fade">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <form action="deleteCentral" method="POST">
                                                            <div class="modal-header">						
                                                                <h4 class="modal-title">Delete Central</h4>
                                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <div class="form-row">
                                                                    <div class="form-group col-lg-12">
                                                                        <input type="hidden" name="cid" value="<s:property value='%{#attr.row.cid}'/>">
                                                                        <p>Are you sure you want to delete central <strong><s:property value='%{#attr.row.clli}'/> <s:property value='%{#attr.row.fullDescription}'/></strong> ?</p>
                                                                        <div class="alert alert-warning" role="alert">
                                                                            This will also remove any USER related or associated with it. <br>
                                                                            This action cannot be undone                                                                      
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
                                                    <a href="#deleteAllCentral" class="btn btn-danger" data-toggle="modal"><i class="fas fa-minus-circle" ></i> <span>Delete</span></a>						
                                                    <a href="#addCentral" class="btn btn-success" data-toggle="modal"><i class="fas fa-plus-circle" ></i> <span>Add Central</span></a>                            
                                                    <!-- Delete Central Modal -->
                                                    <div id="deleteAllCentral" class="modal fade">
                                                        <div class="modal-dialog">
                                                            <div class="modal-content">
                                                                <form action="deleteAllCentral" method="POST">
                                                                    <div class="modal-header">						
                                                                        <h4 class="modal-title">Delete Centrals</h4>
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
        <!-- Add Central Modal -->
        <div id="addCentral" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <!--                    <form action="addCentral" method="POST" name="addCForm" onsubmit="return checkInpC()">-->
                    <form id="centralForm" action="addCentral" method="POST" onsubmit="return checkC()" >
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Central</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body ">
                            <div class="form-row">
                                <div class="form-group col-lg-12">
                                    <div id="response"></div>
                                </div>
                                <div class="form-group col-md-7">
                                    <label>CLLI</label> 
                                    <input id="mclli" name="mclli" type="text" class="form-control" required>
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
                                    <input id="mpip" name="mpip" type="text" class="form-control" required>
                                    <span id="em_pip" class="text-danger"></span>
                                </div>
                                <div class="form-group col-md-5">
                                    <label>Proxy port</label>
                                    <input autocomplete="off" id="mpport" name="mpport" type="text" class="form-control" required>
                                    <span id="em_pport" class="text-danger"></span>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-7">
                                    <label>Central IP</label>
                                    <input id="mcip"  name="mcip" type="text" class="form-control" required>
                                    <span id="em_cip" class="text-danger"></span>
                                </div>                                
                                <div class="form-group col-md-3">
                                    <label>Central ports</label>
                                    <input class="form-control" type="text" placeholder="# of ports" id="nports" name="nports" value="" required>
                                    <span id="em_nports" class="text-danger"></span>
                                </div>
                                <div class="form-group col-md-2">
                                    <label style="color: #fff; ">__</label>
                                    <a href="#" id="addPorts" onclick="addFields()" class="btn btn-link"><i class="fas fa-plus-circle" ></i></a>                          
                                </div>
                            </div>
                            <div class="form-row justify-content-md-end">
                                <div class="align-content-md-end form-group col-md-5" id="container"></div>  
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input id="cancelCentral" type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input id="submitCentral" type="submit" class="btn btn-success" value="Add">
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

