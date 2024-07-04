<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">

    <head>
        <%@include file="cmp/titlemeta.jsp"%>

        <!-- App favicon -->
        <link rel="shortcut icon" href="assets/images/favicon.ico">

        <!-- C3 charts css -->
        <link href="plugins/c3/c3.min.css" rel="stylesheet" type="text/css"  />

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

            <%@include file="cmp/topbar.jsp"%>

            <%@include file="cmp/menu.jsp"%>

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
                                    <h4 class="page-title">¡Bienvenido!</h4>
                                    <ol class="breadcrumb p-0 m-0">
                                        <li>
                                            <a href="#">DNCS</a>
                                        </li>
                                        <li class="active">
                                            Dashboard
                                        </li>
                                    </ol>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <!-- end row -->

                        <div class="row">

                            <div class="col-xl-3 col-md-6">
                                <div class="card widget-box-two widget-two-purple">
                                    <div class="card-body">
                                        <i class="mdi mdi-timetable widget-two-icon"></i>
                                        <div class="wigdet-two-content">
                                            <p class="m-0 text-uppercase text-white font-600 font-secondary text-overflow" title="Statistics">Pendientes</p>
                                            <h2 class="text-white"><span data-plugin="counterup">${count_eventos}</span> <small><i class="mdi mdi-arrow-up text-white"></i></small></h2>
                                            <p class="text-white m-0"><b>10%</b> From previous period</p>
                                        </div>
                                    </div>
                                </div>
                            </div><!-- end col -->

                            <div class="col-xl-3 col-md-6">
                                <div class="card widget-box-two widget-two-info">
                                    <div class="card-body">
                                        <i class="mdi fa-user widget-two-icon"></i>
                                        <div class="wigdet-two-content">
                                            <p class="m-0 text-white text-uppercase font-600 font-secondary text-overflow" title="User Today">Mis donaciones</p>
                                            <h2 class="text-white"><span data-plugin="counterup">${count_donantes}</span> <small><i class="mdi mdi-arrow-up text-white"></i></small></h2>
                                            <p class="text-white m-0"><b>5.6%</b> From previous period</p>
                                        </div>
                                    </div>
                                </div>
                            </div><!-- end col -->



                        </div>
                        <!-- end row -->


                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="header-title m-t-0 m-b-20">Registros recientes</h4>

                                        <div class="table-responsive">
                                            <table class="table m-b-0">
                                                <thead>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>Descriocion</th>
                                                        <th>Fecha</th>
                                                        <th>Ciudad</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    
                                                    
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- end col -->

                        </div>
                        <!-- end row -->    

                    </div> <!-- container-fluid -->

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

        <!-- Counter js  -->
        <script src="plugins/waypoints/jquery.waypoints.min.js"></script>
        <script src="plugins/counterup/jquery.counterup.min.js"></script>

        <!--C3 Chart-->
        <script src="plugins/d3/d3.min.js"></script>
        <script src="plugins/c3/c3.min.js"></script>

        <!-- Dashboard init -->
        <script src="assets/pages/jquery.dashboard.js"></script>

        <!-- App js -->
        <script src="assets/js/jquery.core.js"></script>
        <script src="assets/js/jquery.app.js"></script>

    </body>
</html>