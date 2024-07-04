<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <%@include file="../cmp/titlemeta.jsp"%>

        <!-- App favicon -->
        <link rel="shortcut icon" href="assets/images/favicon.ico">

        <!-- DataTables -->
        <link rel="stylesheet" href="plugins/magnific-popup/css/magnific-popup.css" />
        <link href="plugins/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>
        <link href="plugins/datatables/buttons.bootstrap4.min.css" rel="stylesheet" type="text/css"/>
        <link href="plugins/datatables/fixedHeader.bootstrap4.min.css" rel="stylesheet" type="text/css"/>

        <link href="plugins/datatables/scroller.bootstrap4.min.css" rel="stylesheet" type="text/css"/>
        <link href="plugins/datatables/dataTables.colVis.css" rel="stylesheet" type="text/css"/>

        <link href="plugins/datatables/fixedColumns.dataTables.min.css" rel="stylesheet" type="text/css"/>

        <link href="plugins/datatables/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css"/>
        <link href="plugins/datatables/responsive.bootstrap4.min.css" rel="stylesheet" type="text/css"/>

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
                                    <h4 class="page-title">Consultar</h4>
                                    <ol class="breadcrumb p-0 m-0">
                                        <li>
                                            <a href="#">DNCS</a>
                                        </li>
                                        <li>
                                            <a href="#">Solicitudes</a>
                                        </li>
                                        <li class="active">
                                            Consultar
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
                                    <div class="card-body table-responsive">
                                        <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                            <thead>
                                                <tr>
                                                    <th data-priority="0">#</th>
                                                    <th>Fecha</th>
                                                    <th>Receptor</th>
                                                    <th>Ubicación</th>
                                                    <th>Ciudad</th>
                                                    <th>Estado</th>
                                                    <th data-priority="1"> Acción </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="c" items="${list}" varStatus="i">
                                                    <tr>
                                                        <td>${i.count}</td>
                                                        <td><fmt:formatDate value="${c.fecha}" pattern="dd/MM/yyyy"/></td>
                                                        <td>${c.donante.nombre} ${c.donante.apellido}</td>
                                                        <td>${c.ubicacion}</td>
                                                        <td>${c.ciudad}</td>
                                                        <td>${c.estado}</td>
                                                        <td class="actions">
                                                            <a href="<c:url value="/empresa/solicitud?id=${c.solicitud_id}"/>" class="btn waves-effect waves-light btn-custom btn-xs"> <i class="fa fa-pencil"></i> </a>
                                                            <a href="<c:url value="/empresa/solicitudpend?id=${c.solicitud_id}"/>" class="btn waves-effect waves-light btn-purple btn-xs"> <i class="fa fa-eye"></i> </a>                                                            
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <!-- end: page -->
                        </div> <!-- end Panel -->                        
                        <!-- end row -->
                        
                    </div> <!-- container -->

                </div> <!-- content -->

                <footer class="footer">
                    2024 © DNCS - INF-281
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

        <!-- Responsive examples -->
        <script src="plugins/magnific-popup/js/jquery.magnific-popup.min.js"></script>
        <script src="plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="plugins/datatables/dataTables.bootstrap4.min.js"></script>

        <script src="plugins/datatables/dataTables.buttons.min.js"></script>
        <script src="plugins/datatables/buttons.bootstrap4.min.js"></script>

        <script src="plugins/datatables/jszip.min.js"></script>
        <script src="plugins/datatables/pdfmake.min.js"></script>
        <script src="plugins/datatables/vfs_fonts.js"></script>

        <script src="plugins/datatables/buttons.html5.min.js"></script>
        <script src="plugins/datatables/buttons.print.min.js"></script>

        <script src="plugins/datatables/dataTables.fixedHeader.min.js"></script>
        <script src="plugins/datatables/dataTables.keyTable.min.js"></script>
        <script src="plugins/datatables/dataTables.responsive.min.js"></script>
        <script src="plugins/datatables/responsive.bootstrap4.min.js"></script>
        <script src="plugins/datatables/dataTables.scroller.min.js"></script>
        <script src="plugins/datatables/dataTables.colVis.js"></script>
        <script src="plugins/datatables/dataTables.fixedColumns.min.js"></script>

        <!-- init -->
        <script src="assets/pages/jquery.datatables.init.js"></script>

        <!-- App js -->
        <script src="assets/js/jquery.core.js"></script>
        <script src="assets/js/jquery.app.js"></script>

        <script>
            $(document).ready(function () {
                $('#datatable-responsive').DataTable();
            });
            TableManageButtons.init();
        </script>
    </body>
</html>