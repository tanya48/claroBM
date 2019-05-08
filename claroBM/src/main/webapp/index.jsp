<%-- 
    Document   : index
    Created on : 8/05/2019, 12:18:19 PM
    Author     : Tanya Tapia 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
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
                            <li class="nav-item">
                                <a class="nav-link" href="<s:url action='users'/>">Users</a>
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
                    <div class="row">
                        <div class="col-md-12">
                            <div class="table-wrapper shadow">
                                <div class="table-title">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <i class=" central-i fas fa-warehouse"></i><label class="dat" >Centrals</label>                                        
                                        </div>
                                        <div class="col-lg-6">
                                            <a href="#deleteCentral" class="btn btn-danger" data-toggle="modal"><i class="fas fa-minus-circle" ></i> <span>Delete</span></a>						
                                            <a href="#addCentral" class="btn btn-success" data-toggle="modal"><i class="fas fa-plus-circle" ></i> <span>Add Central</span></a>                            
                                        </div>
                                    </div>
                                </div>
                                <table class="table table-striped table-hover">
                                    <thead>
                                        <tr>
                                            <th>
                                                <span class="custom-checkbox">
                                                    <input type="checkbox" id="selectAll">
                                                    <label for="selectAll"></label>
                                                </span>
                                            </th>
                                            <th>CLLI</th>
                                            <th>Central type</th>                            
                                            <th>Central IP</th>
                                            <th>Central ports</th>
                                            <th>Proxy IP</th>
                                            <th>Proxy port</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <s:iterator  value="list">
                                            <tr>
                                                <td>
                                                    <span class="custom-checkbox">
                                                        <input type="checkbox" id="checkbox1" name="options[]" value="1">
                                                        <label for="checkbox1"></label>
                                                    </span>
                                                </td>
                                                <td><s:property value="clli"/></td>
                                                <td><s:property value="ctype"/></td>
                                                <td><s:property value="cip"/></td>
                                                <td><s:property value="cports"/></td>
                                                <td><s:property value="pip"/></td>
                                                <td><s:property value="pport"/></td>
                                                <td>
                                                    <a href="#editCentral" class="edit" data-toggle="modal"><i data-toggle="tooltip" class="fas fa-pencil-alt"></i></a>
                                                    <a href="#deleteCentral" class="delete" data-toggle="modal"><i data-toggle="tooltip" class="fas fa-trash-alt"></i></a>
                                                </td>
                                            </tr>
                                        </s:iterator>
                                    </tbody>
                                </table>
                                <div class="clearfix">
                                    <div class="hint-text"><b>5</b> out of <b>25</b> entries</div>
                                    <ul class="pagination">
                                        <li class="page-item disabled"><a href="#">Previous</a></li>
                                        <li class="page-item"><a href="#" class="page-link">1</a></li>
                                        <li class="page-item active"><a href="#" class="page-link">2</a></li>
                                        <li class="page-item"><a href="#" class="page-link">3</a></li>
                                        <li class="page-item"><a href="#" class="page-link">Next</a></li>
                                    </ul>
                                </div>
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
                    <form action="addCentral" method="POST">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Central</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body ">
                            <div class="form-row">
                                <div class="form-group col-md-7">
                                    <label>CLLI</label>
                                    <input name="clli" type="text" class="form-control" required>
                                </div>
                                <div class="form-group col-md-5">
                                    <label>Central type</label>
                                    <select id="inputState" class="form-control" required>
                                        <option>Choose...</option>
                                        <option>...</option>
                                    </select>
                                </div>
                            </div>                            
                            <div class="form-row">
                                <div class="form-group col-md-7">
                                    <label>Proxy IP</label>
                                    <input name="pip" type="text" class="form-control" required>
                                </div>
                                <div class="form-group col-md-5">
                                    <label>Proxy port</label>
                                    <input name="pport" type="text" class="form-control" required>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-7">
                                    <label>Central IP</label>
                                    <input name="cip" type="text" class="form-control" required>
                                </div>                                
                                <div class="form-group col-md-3">
                                    <label>Central ports</label>
                                    <input class="form-control" type="text" placeholder="# of ports" id="member" name="member" value="">
                                </div>
                                <div class="form-group col-md-2">
                                    <label style="color: #fff; ">__</label>
                                    <a href="#" onclick="addFields()" class="btn btn-link"><i class="fas fa-plus-circle" ></i></a>                          
                                </div>
                            </div>
                            <div class="form-row justify-content-md-end">
                                <div class="align-content-md-end form-group col-md-5" id="container"></div>  
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
        <!-- Edit Central Modal -->
        <div id="editCentral" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form>
                        <div class="modal-header">						
                            <h4 class="modal-title">Edit Central</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body ">
                            <div class="form-row">
                                <div class="form-group col-md-7">
                                    <label>CLLI</label>
                                    <input type="text" class="form-control" required>
                                </div>
                                <div class="form-group col-md-5">
                                    <label>Central type</label>
                                    <select id="inputState" class="form-control" required>
                                        <option>Choose...</option>
                                        <option>...</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-7">
                                    <label>Central IP</label>
                                    <input type="text" class="form-control" required>
                                </div>
                                <div class="form-group col-md-5">
                                    <label>Central ports</label>
                                    <a href="#editCentralPorts" class="btn btn-warning" data-toggle="modal"><i class="fas fa-pencil-alt" ></i> <span>Edit Central Ports</span></a>                            
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-7">
                                    <label>Proxy IP</label>
                                    <input type="text" class="form-control" required>
                                </div>
                                <div class="form-group col-md-5">
                                    <label>Proxy port</label>
                                    <input type="text" class="form-control" required>
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
        <!-- Delete Central Modal -->
        <div id="deleteCentral" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form>
                        <div class="modal-header">						
                            <h4 class="modal-title">Delete Central</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-row">
                                <div class="form-group col-lg-12">
                                    <p>Are you sure you want to delete these Records?</p>
                                    <p class="text-warning"><medium>This action cannot be undone.</medium></p>
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
        <!--        -->  
        <!-- Jquery JS-->
        <script src="js/jquery-3.4.0.min.js"></script>
        <script src="js/popper.min.js"></script>
        <!-- Bootstrap JS-->
        <script src="js/bootstrap.js"></script>
        <!-- Main JS-->
        <script type="text/javascript">
                                        function noBack()
                                        {
                                            window.history.forward();
                                        }
                                        noBack();
                                        window.onload = noBack;
                                        window.onpageshow = function (evt) {
                                            if (evt.persisted)
                                                noBack();
                                        }
                                        window.onunload = function () {
                                            void (0);
                                        }
                                        function addFields() {
                                            // Number of inputs to create
                                            var number = document.getElementById("member").value;
                                            // Container <div> where dynamic content will be placed
                                            var container = document.getElementById("container");
                                            // Clear previous contents of the container
                                            while (container.hasChildNodes()) {
                                                container.removeChild(container.lastChild);
                                            }
                                            for (i = 0; i < number; i++) {
                                                // Append a node with a random text
                                                container.appendChild(document.createTextNode("Port " + (i + 1)));
                                                // Create an <input> element, set its type and name attributes
                                                var input = document.createElement("input");
                                                input.type = "text";
                                                input.setAttribute('class', 'form-control');
                                                input.name = "port" + i;
                                                container.appendChild(input);
                                                // Append a line break 
                                                container.appendChild(document.createElement("br"));
                                            }
                                        }
        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                // Activate tooltip
                $('[data-toggle="tooltip"]').tooltip();

                // Select/Deselect checkboxes
                var checkbox = $('table tbody input[type="checkbox"]');
                $("#selectAll").click(function () {
                    if (this.checked) {
                        checkbox.each(function () {
                            this.checked = true;
                        });
                    } else {
                        checkbox.each(function () {
                            this.checked = false;
                        });
                    }
                });
                checkbox.click(function () {
                    if (!this.checked) {
                        $("#selectAll").prop("checked", false);
                    }
                });
            });
        </script>
</html>

