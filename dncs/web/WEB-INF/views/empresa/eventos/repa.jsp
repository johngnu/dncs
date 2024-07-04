<%-- 
    Document   : repa
    Created on : Jan 29, 2019, 12:29:17 PM
    Author     : John Castillo
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <%@include file="../cmp/titlemeta.jsp"%>

        <!-- App favicon -->
        <link rel="shortcut icon" href="assets/images/favicon.ico">

        <!-- Table Responsive css -->
        <link href="plugins/responsive-table/css/rwd-table.min.css" rel="stylesheet" type="text/css" media="screen">

        <!-- App css -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/metismenu.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/icons.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/style.css" rel="stylesheet" type="text/css" />

        <link href="plugins/bootstrap-select/css/bootstrap-select.min.css" rel="stylesheet" />

        <script src="assets/js/modernizr.min.js"></script>

    </head>


    <body>

        <!-- Begin page -->
        <div id="wrapper">

            <%@include file="../cmp/topbar.jsp"%>

            <%@include file="../cmp/menu.jsp"%>

            <!-- ============================================================== -->
            <!-- Start right Content here -->
            <!-- ============================================================== -->
            <div class="content-page">
                <!-- Start content -->
                <div class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                <div class="page-title-box">
                                    <h4 class="page-title">Reporte</h4>
                                    <ol class="breadcrumb p-0 m-0">
                                        <li>
                                            <a href="#">Bacheo</a>
                                        </li>
                                        <li>
                                            <a href="#">Guías</a>
                                        </li>
                                        <li class="active">
                                            Reporte
                                        </li>
                                    </ol>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <!-- end row -->

                        <div class="row">
                            <div class="col-sm-12">
                                <div class="card">
                                    <div class="card-body">

                                        <div class="table-rep-plugin">
                                            <div class="table-responsive" data-pattern="priority-columns">
                                                <table id="tech-companies-1" class="table  table-striped">
                                                    <thead>
                                                        <tr>
                                                            <th data-priority="1">Fecha</th>
                                                            <th>Número</th>
                                                            <th data-priority="1">Cliente</th>
                                                            <th data-priority="1">GD</th>
                                                            <th data-priority="3">Factura</th>
                                                            <th data-priority="1">Transporte</th>
                                                            <th data-priority="3">Estado</th>
                                                            <th data-priority="3">File</th>
                                                            <th data-priority="6">Opc.</th>                                                            
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="c" items="${guias}">
                                                            <tr>
                                                                <td><fmt:formatDate value="${c.emision}" pattern="d-MMM-yy"/></td>
                                                                <td>${c.numero}</td>                                                                
                                                                <th>${c.nombre_corto} <span class="co-name">${c.nombre_completo}</span></th>
                                                                <td>
                                                                    <c:if test="${empty c.filedata}">
                                                                        <span class="badge badge-danger">no tiene</span>
                                                                    </c:if>
                                                                </td>    
                                                                <td><span class="badge badge-danger">NO</span></td>
                                                                <td><span class="badge badge-info">Transito</span></td>
                                                                <td><span class="badge badge-success">Entregado</span></td>
                                                                <td>582.93</td>
                                                                <td class="actions">
                                                                    <!--                                                            <a href="#" class="hidden on-editing save-row"><i class="fa fa-save"></i></a>
                                                                                                                                <a href="#" class="hidden on-editing cancel-row"><i class="fa fa-times"></i></a>
                                                                    <a href="#" class=""><i class="fa fa-pencil"></i></a>
                                                                    <a href="#" class=""><i class="fa fa-trash-o"></i></a>
                                                                    <button class="btn btn-custom waves-effect waves-light btn-xs">
                                                                            Ver
                                                                        </button>-->
                                                                    <a href="<c:url value="/empresa/guia?id=${c.guia_id}"/>" class="btn waves-effect waves-light btn-custom btn-xs"> <i class="fa fa-pencil"></i> </a>
                                                                    <button class="btn waves-effect waves-light btn-danger btn-xs"> <i class="fa fa-trash-o"></i> </button>
                                                                </td>                                                               
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>

                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- end row -->

                    </div> <!-- container -->

                </div> <!-- content -->

                <footer class="footer">
                    2005 - 2019 © ICG SRL. - icg.com.bo
                </footer>

            </div>

            <!-- ============================================================== -->
            <!-- End Right content here -->
            <!-- ============================================================== -->

        </div>
        <!-- END wrapper -->

        <script>
            var resizefunc = [];
        </script>

        <!-- jQuery  -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/metisMenu.min.js"></script>
        <script src="assets/js/waves.js"></script>
        <script src="assets/js/jquery.slimscroll.js"></script>
        <script src="plugins/bootstrap-select/js/bootstrap-select.min.js"></script>

        <!-- responsive-table-->
        <script src="plugins/responsive-table/js/rwd-table.min.js"></script>

        <!-- App js -->
        <script src="assets/js/jquery.core.js"></script>
        <script src="assets/js/jquery.app.js"></script>

        <script>
            $(function () {
                $('.table-responsive').responsiveTable({
                    addDisplayAllBtn: 'btn btn-primary'
                });
            });
        </script>
    </body>
</html>