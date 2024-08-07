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
                                    <h4 class="page-title">Registro</h4>
                                    <ol class="breadcrumb p-0 m-0">
                                        <li>
                                            <a href="#">Eventos</a>
                                        </li>
                                        <li>
                                            <a href="#">Beneficiarios</a>
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
                                        <h4 class="header-title m-t-0 m-b-30">Registrar Beneficiario</h4>
                                        <ul class="nav nav-tabs" role="tablist">
                                            <li class="nav-item">
                                                <a class="nav-link active" id="persona-tab" data-toggle="tab" href="#persona" role="tab" aria-controls="persona" aria-selected="true">
                                                    <span class="d-block d-sm-none"><i class="fa fa-user"></i></span>
                                                    <span class="d-none d-sm-block">Persona</span>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="empresa-tab" data-toggle="tab" href="#empresa" role="tab" aria-controls="empresa" aria-selected="false">        
                                                    <span class="d-block d-sm-none"><i class="fa fa-home"></i></span>
                                                    <span class="d-none d-sm-block">Organizaci�n</span>
                                                </a>
                                            </li>
                                        </ul>
                                        <div class="tab-content">
                                            <div class="tab-pane show active" id="persona" role="tabpanel" aria-labelledby="persona-tab">
                                                <div class="card">
                                                    <div class="card-body">
                                                        <p class="text-muted m-b-20">
                                                            Donante tipo: <code>Persona</code>.
                                                        </p>

                                                        <form action="guardarbeneficiario" method="post">
                                                            <div class="form-group">
                                                                <label for="documento">Documento CI<span class="text-danger">*</span></label>
                                                                <input type="text" name="documento" parsley-trigger="change" required
                                                                       placeholder="N�mero de documento" class="form-control" id="documento">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="nombre">Nombre<span class="text-danger">*</span></label>
                                                                <input type="text" name="nombre" parsley-trigger="change" required
                                                                       placeholder="" class="form-control" id="nombre">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="apellidos">Apellidos<span class="text-danger">*</span></label>
                                                                <input type="text" name="apellidos" parsley-trigger="change" required
                                                                       placeholder="" class="form-control" id="apellidos">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="emailAddress">Correo electr�nico</label>
                                                                <input type="email" name="email" parsley-trigger="change"
                                                                       placeholder="nombre@empresa.com" class="form-control" id="emailAddress">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="telefono">Tel�fono</label>
                                                                <input type="phone" name="telefono" parsley-trigger="change"
                                                                       placeholder="" class="form-control" id="telefono">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="celular">Celular</label>
                                                                <input type="phone" name="celular" parsley-trigger="change"
                                                                       placeholder="" class="form-control" id="celular">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="direccion">Direcci�n</label>
                                                                <textarea name="direccion" class="form-control" id="direccion"></textarea>
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Tipo cliente</label>
                                                                <p class="form-control-static"> Persona </p>
                                                                <input type="hidden" name="tipo" value="PER">
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
                                            </div>
                                            <div class="tab-pane" id="empresa" role="tabpanel" aria-labelledby="empresa-tab">
                                                <div class="card">
                                                    <div class="card-body">
                                                        <p class="text-muted m-b-20">
                                                            Donante tipo: <code>Organicaci�n</code>.
                                                        </p>

                                                        <form action="guardarbeneficiario" method="post">
                                                            <div class="form-group">
                                                                <label for="documento">NIT<span class="text-danger">*</span></label>
                                                                <input type="text" name="documento" parsley-trigger="change" required
                                                                       placeholder="N�mero de documento" class="form-control" id="documento">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="nombre">Nombre<span class="text-danger">*</span></label>
                                                                <input type="text" name="nombre" parsley-trigger="change" required
                                                                       placeholder="Nombre corto de la empresa" class="form-control" id="nombre">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="emailAddress">Correo electr�nico</label>
                                                                <input type="email" name="email" parsley-trigger="change"
                                                                       placeholder="nombre@empresa.com" class="form-control" id="emailAddress">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="telefono">Tel�fono</label>
                                                                <input type="phone" name="telefono" parsley-trigger="change"
                                                                       placeholder="" class="form-control" id="telefono">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="celular">Celular</label>
                                                                <input type="phone" name="celular" parsley-trigger="change"
                                                                       placeholder="" class="form-control" id="celular">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="direccion">Direcci�n</label>
                                                                <textarea name="direccion" class="form-control" id="direccion"></textarea>
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Tipo cliente</label>
                                                                <p class="form-control-static"> Organicaci�n </p>
                                                                <input type="hidden" name="tipo" value="ORG">
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
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div> <!-- end col -->
                        </div>
                        <!-- end row -->

                    </div> <!-- container -->

                </div> <!-- content -->

                <footer class="footer">
                    2024 � Sges. Eventos - INF-281
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

        <!-- App js -->
        <script src="assets/js/jquery.core.js"></script>
        <script src="assets/js/jquery.app.js"></script>

        <script>
            $(document).ready(function () {
                $('form').parsley();
            });
        </script>

    </body>
</html>