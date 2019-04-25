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
        <nav class="navbar navbar-expand-md navbar-dark fixed-top">
            <a class="navbar-brand" ><img class="au-img-ad" src="images/claroblanco.png" alt="">MANAGEMENT</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarsExampleDefault">
                <ul class="navbar-nav mr-auto">
                    <!--li class="nav-item dropdown active">
                        <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">USERS</a>
                        <div class="dropdown-menu" aria-labelledby="dropdown01">
                            <a class="dropdown-item" href="#">USERS</a>
                            <a class="dropdown-item" href="#">CENTRALS</a>
                            <a class="dropdown-item" href="#">PROFILES</a>
                        </div>
                    </li-->
                </ul>
                <a href="<s:url action='logout'/>" class="btn btn-default"><i class="fas fa-sign-out-alt"></i> <span>Sign out</span></a>
            </div>
        </nav>
        <div class="container-fluid">
            <div class="table-wrapper shadow">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Centrals</h2>
                        </div>
                        <div class="col-sm-6">
                            <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i class="fas fa-plus-circle" ></i> <span>Add Central</span></a>                            
                            <a href="#deleteEmployeeModal" class="btn btn-danger" data-toggle="modal"><i class="fas fa-minus-circle" ></i> <span>Delete</span></a>						
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
                        <tr>
                            <td>
                                <span class="custom-checkbox">
                                    <input type="checkbox" id="checkbox1" name="options[]" value="1">
                                    <label for="checkbox1"></label>
                                </span>
                            </td>
                            <td>MAINRD5E041</td>
                            <td>5ess</td>
                            <td>172.27.72.77</td>
                            <td>2007/2008/2009/201</td>
                            <td>0.0.0.0</td>
                            <td>1234</td>
                            <td>
                                <a href="#editEmployeeModal" class="edit" data-toggle="modal"><i data-toggle="tooltip" class="fas fa-pencil-alt"></i></a>
                                <a href="#deleteEmployeeModal" class="delete" data-toggle="modal"><i data-toggle="tooltip" class="fas fa-trash-alt"></i></a>
                            </td>
                        </tr>
<tr>
                            <td>
                                <span class="custom-checkbox">
                                    <input type="checkbox" id="checkbox1" name="options[]" value="1">
                                    <label for="checkbox1"></label>
                                </span>
                            </td>
                            <td>MAINRD5E041</td>
                            <td>5ess</td>
                            <td>172.27.72.77</td>
                            <td>2007/2008/2009/201</td>
                            <td>0.0.0.0</td>
                            <td>1234</td>
                            <td>
                                <a href="#editEmployeeModal" class="edit" data-toggle="modal"><i data-toggle="tooltip" class="fas fa-pencil-alt"></i></a>
                                <a href="#deleteEmployeeModal" class="delete" data-toggle="modal"><i data-toggle="tooltip" class="fas fa-trash-alt"></i></a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span class="custom-checkbox">
                                    <input type="checkbox" id="checkbox1" name="options[]" value="1">
                                    <label for="checkbox1"></label>
                                </span>
                            </td>
                            <td>MAINRD5E041</td>
                            <td>5ess</td>
                            <td>172.27.72.77</td>
                            <td>2007/2008/2009/201</td>
                            <td>0.0.0.0</td>
                            <td>1234</td>
                            <td>
                                <a href="#editEmployeeModal" class="edit" data-toggle="modal"><i data-toggle="tooltip" class="fas fa-pencil-alt"></i></a>
                                <a href="#deleteEmployeeModal" class="delete" data-toggle="modal"><i data-toggle="tooltip" class="fas fa-trash-alt"></i></a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span class="custom-checkbox">
                                    <input type="checkbox" id="checkbox1" name="options[]" value="1">
                                    <label for="checkbox1"></label>
                                </span>
                            </td>
                            <td>MAINRD5E041</td>
                            <td>5ess</td>
                            <td>172.27.72.77</td>
                            <td>2007/2008/2009/201</td>
                            <td>0.0.0.0</td>
                            <td>1234</td>
                            <td>
                                <a href="#editEmployeeModal" class="edit" data-toggle="modal"><i data-toggle="tooltip" class="fas fa-pencil-alt"></i></a>
                                <a href="#deleteEmployeeModal" class="delete" data-toggle="modal"><i data-toggle="tooltip" class="fas fa-trash-alt"></i></a>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div class="clearfix">
                    <div class="hint-text">Showing <b>5</b> out of <b>25</b> entries</div>
                    <ul class="pagination">
                        <li class="page-item disabled"><a href="#">Previous</a></li>
                        <li class="page-item"><a href="#" class="page-link">1</a></li>
                        <li class="page-item"><a href="#" class="page-link">2</a></li>
                        <li class="page-item active"><a href="#" class="page-link">3</a></li>
                        <li class="page-item"><a href="#" class="page-link">4</a></li>
                        <li class="page-item"><a href="#" class="page-link">5</a></li>
                        <li class="page-item"><a href="#" class="page-link">Next</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- Add Modal HTML -->
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form>
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Central</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>CLLI</label>
                                <input type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Central type</label>
                                <input type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Central IP</label>
                                <input type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Central ports</label>
                                <input type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Proxy IP</label>
                                <input type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Proxy port</label>
                                <input type="text" class="form-control" required>
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
        <!-- Edit Modal HTML -->
        <div id="editEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form>
                        <div class="modal-header">						
                            <h4 class="modal-title">Edit Central</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>CLLI</label>
                                <input type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Central type</label>
                                <input type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Central IP</label>
                                <input type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Central ports</label>
                                <input type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Proxy IP</label>
                                <input type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Proxy port</label>
                                <input type="text" class="form-control" required>
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
        
        <!-- Delete Modal HTML -->
        <div id="deleteEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form>
                        <div class="modal-header">						
                            <h4 class="modal-title">Delete Central</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <p>Are you sure you want to delete these Records?</p>
                            <p class="text-warning"><medium>This action cannot be undone.</medium></p>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-danger" value="Delete">
                        </div>
                    </form>
                </div>
            </div>
        </div>

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

