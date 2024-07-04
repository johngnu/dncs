<%-- 
    Document   : registro
    Created on : Feb 28, 2024, 12:29:17 PM
    Author     : Helen Castillo
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">

    <head>
        <%@include file="../cmp/titlemeta.jsp"%>

        <!-- App favicon -->
        <link rel="shortcut icon" href="assets/images/favicon.ico">

        <!-- Plugins css-->
        <link href="plugins/bootstrap-tagsinput/css/bootstrap-tagsinput.css" rel="stylesheet" />
        <link href="plugins/select2/css/select2.min.css" rel="stylesheet" />
        <link href="plugins/bootstrap-touchspin/css/jquery.bootstrap-touchspin.min.css" rel="stylesheet" />
        <link href="plugins/switchery/switchery.min.css" rel="stylesheet" />

        <!-- Plugins css -->
        <link href="plugins/timepicker/bootstrap-timepicker.min.css" rel="stylesheet">
        <link href="plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css" rel="stylesheet">
        <link href="plugins/bootstrap-datepicker/css/bootstrap-datepicker.min.css" rel="stylesheet">
        <link href="plugins/clockpicker/css/bootstrap-clockpicker.min.css" rel="stylesheet">
        <link href="plugins/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">


        <!-- App css -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/metismenu.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/icons.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/style.css" rel="stylesheet" type="text/css" />

        <link href="plugins/bootstrap-select/css/bootstrap-select.min.css" rel="stylesheet" />

        <script src="assets/js/modernizr.min.js"></script>
        
        <link href="<c:url value="/assets/css/fileinput.min.css"/>" rel="stylesheet"/>
    </head>


    <body class="enlarged">

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
                                    <h4 class="page-title">Registro</h4>
                                    <ol class="breadcrumb p-0 m-0">
                                        <li>
                                            <a href="#">Eventos</a>
                                        </li>
                                        <li>
                                            <a href="#">Normativas</a>
                                        </li>
                                        <li class="active">
                                            Registro
                                        </li>
                                    </ol>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <!-- end row -->

                        <div class="row">
                            <div class="col-lg-8">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="header-title m-t-0 m-b-30">Registrar normativa</h4>
                                        <p class="text-muted m-b-20">
                                            Completa todos los datos necesarios: <code>Descripción</code>, <code>Archivo</code>.
                                        </p>

                                        <form action="guardarnormativa" method="post" enctype="multipart/form-data">
                                            <div class="form-group">
                                                <label for="descripcion">Descripción<span class="text-danger">*</span></label>
                                                <input type="text" name="descripcion" parsley-trigger="change" required
                                                       placeholder="Descripción del  documento" class="form-control" id="descripcion">
                                            </div>
                                            
                                            <div class="form-group">
                                                <label>Documento PDF<span class="text-danger">*</span></label>
                                                <div class="form-group">
                                                    <input name="file" parsley-trigger="change" type="file" class="file" data-show-preview="false" required>
                                                </div>
                                            </div>
                                            
                                            <div class="form-group text-right m-b-0">
                                                <button type="reset" class="btn btn-secondary waves-effect m-l-5">
                                                    Cancelar
                                                </button>
                                                <button class="btn btn-primary waves-effect waves-light" type="submit">
                                                    Guardar
                                                </button>
                                            </div>
                                        </form>
                                    </div>
                                </div>


                            </div> <!-- end col -->
                        </div>
                        <!-- end row -->

                    </div> <!-- container -->

                </div> <!-- content -->

                <footer class="footer">
                    2024 © Sges. Eventos - INF-281
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

        <script src="plugins/parsleyjs/parsley.min.js"></script>

        <script src="plugins/select2/js/select2.min.js"></script>
        <script src="plugins/bootstrap-select/js/bootstrap-select.min.js"></script>

        <script src="plugins/autocomplete/jquery.mockjax.js"></script>
        <script src="plugins/autocomplete/jquery.autocomplete.min.js"></script>
        <script src="plugins/autocomplete/countries.js"></script>
        <script src="assets/pages/jquery.autocomplete.init.js"></script>

        <script src="plugins/moment/moment.js"></script>
        <script src="plugins/timepicker/bootstrap-timepicker.js"></script>
        <script src="plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>
        <script src="plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
        <script src="plugins/clockpicker/js/bootstrap-clockpicker.min.js"></script>
        <script src="plugins/bootstrap-daterangepicker/daterangepicker.js"></script>
        <script src="<c:url value="/assets/js/fileinput.min.js"/>"></script>
        <!-- App js -->
        <script src="assets/js/jquery.core.js"></script>
        <script src="assets/js/jquery.app.js"></script>
        
        <script>
            $(document).ready(function () {
                $('form').parsley();

                // Select2
                $(".select2").select2();

                $(".select2-limiting").select2({
                    maximumSelectionLength: 2
                });

                //$('.selectpicker').selectpicker();
                //$(":file").filestyle({input: false});
                // Date Picker
                //jQuery('#datepicker').datepicker();
                $('#datepicker-autoclose').datepicker({
                    format: 'dd/mm/yyyy',
                    //startDate: '-5d',
                    orientation: 'bottom',
                    autoclose: true,
                    todayHighlight: true
                });

            });
        </script>

    </body>
</html>