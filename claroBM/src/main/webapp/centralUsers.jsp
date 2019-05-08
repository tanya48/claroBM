<%-- 
    Document   : centralUsers
    Created on : 7/05/2019, 01:16:36 PM
    Author     : Tanya Tapia 
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Claro Management</title>
        <!-- Fontfaces CSS-->
        <link href="css/font-face.css" rel="stylesheet" media="all">
        <link href="css/font-awesome.css" rel="stylesheet" media="all">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">

        <!-- Bootstrap CSS-->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Main CSS-->
        <link href="css/styles.css" rel="stylesheet">

    </head>
    <body class="index-bd">
        <!--Navbar-->
        <nav class="navbar navbar-expand-md navbar-dark fixed-top">
            <a class="navbar-brand" ><img class="au-img-ad" src="images/claroblanco.png" alt="">MANAGEMENT</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarsExampleDefault">
                <ul class="navbar-nav mr-auto">
                </ul>
                <a href="<s:url action='logout'/>" class="btn btn-default"><i class="fas fa-sign-out-alt"></i> <span>Sign out</span></a>
            </div>
        </nav>
        <!--Data table--> 
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <div class="table-wrapper shadow">
                        <div class="table-title">
                            <div class="row">
                                <div class="col-lg-4">
                                    <label class="dat-cu">Central Users</label>                                        
                                </div>
                                <div class="col-lg-8 btn-ad">
                                    <a href="#deleteCentralUser" class="btn btn-danger" data-toggle="modal"><i class="fas fa-minus-circle" ></i> <span>Delete</span></a>						
                                    <a href="#addCentralUser" class="btn btn-success" data-toggle="modal"><i class="fas fa-plus-circle" ></i> <span>Add Central User</span></a>                            
                                </div>
                            </div>
                        </div>
                        <table class="table table-striped table-hover" id="ADtable">
                            <thead>
                                <tr>
                                    <th>
                                        <span class="custom-checkbox">
                                            <input type="checkbox" id="selectAll">
                                            <label for="selectAll"></label>
                                        </span>
                                    </th>
                                    <th>Username</th>
                                    <th>Central</th>                            
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody> 
                                <s:iterator  value="list2">
                                <tr>
                                    <td>
                                        <span class="custom-checkbox">
                                            <input type="checkbox" id="checkbox1" name="options[]" value="1">
                                            <label for="checkbox1"></label>
                                        </span>
                                    </td>
                                    <td><s:property value="cuname"/></td>
                                    <td><s:property value="cuclli"/></td>
                                    <td>
                                        <a href="#editCentralUser" class="edit" data-toggle="modal"><i data-toggle="tooltip" class="fas fa-pencil-alt"></i></a>
                                        <a href="#deleteCentralUser" class="delete" data-toggle="modal"><i data-toggle="tooltip" class="fas fa-trash-alt"></i></a>
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
        <!-- Add Central User Modal-->
        <div id="addCentralUser" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form>
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Central User</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-row">
                                <div class="form-group col-lg-12">
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
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label>Password</label>
                                    <input type="password" class="form-control" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label>Confirm password</label>
                                    <input type="password" class="form-control" required>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label class="text-warning">- Minimum length: 8 characters</label>                                    
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="text-warning">- At least one special character</label>
                                </div>
                            </div>                            
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label class="text-warning">- At least one number and one letter</label>
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="text-warning">- Must contain a capital letter</label>
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
        <!-- Edit Central User Modal-->
        <div id="editCentralUser" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form>
                        <div class="modal-header">						
                            <h4 class="modal-title">Edit Central User</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-row">
                                <div class="form-group col-lg-12">
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
                            <div class="form-row">
                                <div class="form-group col-lg-12">
                                    <label>Old password</label>
                                    <input type="password" class="form-control" required>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label>New password</label>
                                    <input type="password" class="form-control" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label>Confirm password</label>
                                    <input type="password" class="form-control" required>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label class="text-warning">- Minimum length: 8 characters</label>                                    
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="text-warning">- At least one special character</label>
                                </div>
                            </div>                            
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label class="text-warning">- At least one number and one letter</label>
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="text-warning">- Must contain a capital letter</label>
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
        <!-- Delete Central User Modal-->
        <div id="deleteCentralUser" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form>
                        <div class="modal-header">						
                            <h4 class="modal-title">Delete Central User</h4>
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
            function addFields(){
            // Number of inputs to create
            var number = document.getElementById("member").value;
            // Container <div> where dynamic content will be placed
            var container = document.getElementById("container");
            // Clear previous contents of the container
            while (container.hasChildNodes()) {
                container.removeChild(container.lastChild);
            }
            for (i=0;i<number;i++){
                // Append a node with a random text
                container.appendChild(document.createTextNode("Port " + (i+1)));
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
    </body>
</html>
<!-- End document -->


