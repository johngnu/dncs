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
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">

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
                                            <a href="#">DNCS</a>
                                        </li>
                                        <li>
                                            <a href="#">Usuarios</a>
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
                                        <h4 class="header-title m-t-0 m-b-30">Registrar usuario</h4>
                                        <p class="text-muted m-b-20">
                                            Completa todos los datos necesarios: <code>Nombre completo</code>, <code>Cargo</code>, <code>Correo electrónico</code>, <code>Datos de acceso</code>.
                                        </p>

                                        <form action="guardarusuario" method="post">
                                            <div class="form-group">
                                                <label for="documento">CI<span class="text-danger">*</span></label>
                                                <input type="text" name="documento" parsley-trigger="change" required
                                                       placeholder="Cédula de identidad" class="form-control" id="documento">
                                            </div>
                                            <div class="form-group">
                                                <label for="nombre">Nombres<span class="text-danger">*</span></label>
                                                <input type="text" name="nombre" parsley-trigger="change" required
                                                       placeholder="Nombres" class="form-control" id="nombre">
                                            </div>
                                            <div class="form-group">
                                                <label for="apellido">Apellidos<span class="text-danger">*</span></label>
                                                <input type="text" name="apellido" parsley-trigger="change" required
                                                       placeholder="Apellidos" class="form-control" id="apellido">
                                            </div>
                                            <div class="form-group">
                                                <label for="direccion">Dirección<span class="text-danger">*</span></label>
                                                <input type="text" name="direccion" parsley-trigger="change" required
                                                       placeholder="Dirección domicilio" class="form-control" id="direccion">
                                            </div>
                                            <div class="form-group">
                                                <label for="celular">Celular<span class="text-danger">*</span></label>
                                                <input type="tel" name="celular" parsley-trigger="change" required
                                                       placeholder="" class="form-control" id="celular">
                                            </div>
                                            <div class="form-group">
                                                <label for="email">Correo electrónico<span class="text-danger">*</span></label>
                                                <input type="email" name="email" parsley-trigger="change" required
                                                       placeholder="Correo electrónico" class="form-control" id="email">
                                            </div>
                                            <hr>
                                            <p class="text-muted">Datos de Acceso</p>
                                            <div class="form-group">
                                                <label for="rol">Rol<span class="text-danger">*</span></label>
                                                <select name="rol" class="form-control" id="rol">
                                                    <option value="admin">Administrador</option>
                                                    <option value="voluntario">Voluntario</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="usuario">Usuario<span class="text-danger">*</span></label>
                                                <input type="text" name="usuario" parsley-trigger="change" required
                                                       placeholder="" class="form-control" id="usuario">
                                            </div>
                                            
                                            <div class="form-group">
                                                <label for="password">Contraseña<span class="text-danger">*</span></label>
                                                <div class="input-group">
                                                    <input name="clave" parsley-trigger="change" required type="password" class="form-control" id="password" oninput="validatePassword(this.value)">
                                                    <div class="input-group-append">
                                                        <button class="btn btn-primary" type="button" id="togglePassword">
                                                            <i class="fas fa-eye"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="form-group">
                                                <ul>
                                                    <li id="minLength"><i class="fas fa-times text-danger"></i> Mínimo 8 caracteres</li>
                                                    <li id="uppercase"><i class="fas fa-times text-danger"></i> Al menos una letra mayúscula</li>
                                                    <li id="lowercase"><i class="fas fa-times text-danger"></i> Al menos una letra minúscula</li>
                                                    <li id="symbol"><i class="fas fa-times text-danger"></i> 
                                                        Al menos un caracter especial (#@$!%*?&)
                                                    </li>
                                                </ul>
                                            </div>
                                            <span id="errorMessage" class="font-weight-bold text-danger"></span>

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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js"></script>
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

            // Function to toggle password visibility
            document.getElementById('togglePassword').addEventListener('click',
                    function () {
                        const passwordInput = document.getElementById('password');
                        const icon = this.querySelector('i');

                        if (passwordInput.type === 'password') {
                            passwordInput.type = 'text';
                            icon.classList.remove('fa-eye');
                            icon.classList.add('fa-eye-slash');
                        } else {
                            passwordInput.type = 'password';
                            icon.classList.remove('fa-eye-slash');
                            icon.classList.add('fa-eye');
                        }
                    });

            function validatePassword(password) {
                const strongPasswordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%#*?&])[A-Za-z\d@$!%#*?&]{8,}$/;
                const errorMessage = document.getElementById('errorMessage');

                // Check each condition and update the corresponding label
                document.getElementById('minLength').innerHTML = password.length >= 8 ?
                        '<i class="fas fa-check text-success"></i> Mínimo 8 caracteres' :
                        '<i class="fas fa-times text-danger"></i> Mínimo 8 caracteres';
                document.getElementById('uppercase').innerHTML = /[A-Z]/.test(password) ?
                        '<i class="fas fa-check text-success"></i> Al menos una letra mayúscula' :
                        '<i class="fas fa-times text-danger"></i> Al menos una letra mayúscula';
                document.getElementById('lowercase').innerHTML = /[a-z]/.test(password) ?
                        '<i class="fas fa-check text-success"></i> Al menos una letra minúscula' :
                        '<i class="fas fa-times text-danger"></i> Al menos una letra minúscula';
                document.getElementById('symbol').innerHTML = /[#@$!%*?&]/.test(password) ?
                        '<i class="fas fa-check text-success"></i> Al menos un caracter especial (#@$!%*?&)' :
                        '<i class="fas fa-times text-danger"></i> Al menos un caracter especial (#@$!%*?&)';

                // Check overall validity and update the error message
                //if (strongPasswordRegex.test(password)) {
                if (password.length >= 8 && /[A-Z]/.test(password) && /[a-z]/.test(password) && /[#@$!%*?&]/.test(password)) {
                    errorMessage.textContent = 'Contraseña fuerte';
                    errorMessage.classList.remove('text-danger');
                    errorMessage.classList.add('text-success');
                } else {
                    errorMessage.textContent = 'Contraseña débil';
                    errorMessage.classList.remove('text-success');
                    errorMessage.classList.add('text-danger');
                }
            }

        </script>

    </body>
</html>