<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

        <!-- Sweet Alert -->
        <link href="plugins/sweet-alert2/sweetalert2.min.css" rel="stylesheet" type="text/css">
        <!-- Bootstrap fileupload css -->
        <!--<link href="plugins/bootstrap-fileupload/bootstrap-fileupload.css" rel="stylesheet" />-->

        <!-- App css -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/metismenu.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/icons.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/style.css" rel="stylesheet" type="text/css" />

        <link href="plugins/bootstrap-select/css/bootstrap-select.min.css" rel="stylesheet" />

        <script src="assets/js/modernizr.min.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
        <style>
            .fileinput-exists .fileinput-new, .fileinput-new .fileinput-exists {
                display: none;
            }
            .fileinput .thumbnail {
                display: inline-block;
                margin-bottom: 5px;
                overflow: hidden;
                text-align: center;
                vertical-align: middle;
            }
            .thumbnail {
                padding: 4px;
                line-height: 1.42857;
                background-color: #fff;
                border: 1px solid #ddd;
                border-radius: 4px;
                -webkit-transition: border .2s ease-in-out;
                -o-transition: border .2s ease-in-out;
                transition: border .2s ease-in-out;
            }
            .fileinput .thumbnail > img {
                max-height: 100%;
            }
            .thumbnail a > img, .thumbnail > img {
                display: block;
                max-width: 100%;
                height: auto;
                margin-left: auto;
                margin-right: auto;
            }
            img {
                vertical-align: middle;
            }
            hr, img {
                border: 0;
            }
        </style> 
        <link href="/metronic/theme/assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css" rel="stylesheet" type="text/css" />
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
                            <div class="col-sm-12">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="m-t-0 header-title"><b>ID - ${user.usuario_id}</b></h4>
                                        <p class="text-muted m-b-30">
                                            Información del usuario: <code>Nombre completo</code>, <code>usuario</code>, <code>Contraseña</code>.
                                        </p>

                                        <ul class="nav nav-tabs tabs-bordered" role="tablist">
                                            <li class="nav-item">
                                                <a class="nav-link active" id="home-tab-b1" data-toggle="tab" href="#home-b1" role="tab" aria-controls="home-b1" aria-selected="false">
                                                    <span class="d-block d-sm-none"><i class="fa fa-home"></i></span>
                                                    <span class="d-none d-sm-block">Información</span>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="profile-tab-b1" data-toggle="tab" href="#contenido-b1" role="tab" aria-controls="contenido-b1" aria-selected="true">
                                                    <span class="d-block d-sm-none"><i class="fa fa-database"></i></span>
                                                    <span class="d-none d-sm-block">Credencial</span>
                                                </a>
                                            </li>
                                        </ul>
                                        <div class="tab-content">
                                            <div class="tab-pane show active" id="home-b1" role="tabpanel" aria-labelledby="home-tab-b1">
                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <form class="form-horizontal" action="actualizarclave" method="post">
                                                            <div class="form-group row">
                                                                <label class="col-md-3 control-label">Nombre completo</label>
                                                                <div class="col-md-9">
                                                                    <input disabled type="text" class="form-control" value="${user.nombre} ${user.apellido}" placeholder="" required>
                                                                </div>
                                                            </div>

                                                            <div class="form-group row">
                                                                <label class="col-md-3 control-label">Usuario</label>
                                                                <div class="col-md-9">
                                                                    <input disabled type="text" class="form-control" value="${user.usuario}" placeholder="" required>
                                                                </div>
                                                            </div>     

                                                            <div class="form-group row">
                                                                <label class="col-md-3 control-label">Contraseña<span class="text-danger">*</span></label>
                                                                <div class="col-md-9">
                                                                    <div class="input-group">
                                                                        <input name="clave" parsley-trigger="change" required type="password" class="form-control" id="password" oninput="validatePassword(this.value)">
                                                                        <div class="input-group-append">
                                                                            <button class="btn btn-primary" type="button" id="togglePassword">
                                                                                <i class="fas fa-eye"></i>
                                                                            </button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="form-group row">
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

                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    <div class="form-group text-right m-b-0">
                                                                        <button type="reset" class="btn btn-secondary waves-effect m-l-5">
                                                                            Cancelar
                                                                        </button>
                                                                        <button class="btn btn-primary waves-effect waves-light" type="submit">
                                                                            Guardar
                                                                        </button>
                                                                    </div>
                                                                </div>
                                                            </div> <!-- end row -->      
                                                            <input type="hidden" name="id" value="${user.usuario_id}">
                                                        </form>
                                                    </div> <!-- end col -->
                                                </div>
                                                <!-- end row -->
                                            </div>
                                            <div class="tab-pane" id="contenido-b1" role="tabpanel" aria-labelledby="contenido-tab-b1">
                                                <p>Datos de la credencial del usuario.</p>

                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div><!-- end col -->
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

        <!-- modal -->
        <div id="addfactura" class="modal fade" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="addfacturaLabel" aria-hidden="true" style="display: none;">    
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title mt-0">Agregar</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="registrarfactura" method="post" enctype="multipart/form-data">
                        <div class="modal-body">
                            <div class="form-group row">
                                <label class="col-md-3 control-label">Número</label>
                                <div class="col-md-9">
                                    <input name="numero" type="number" class="form-control" placeholder="Número de la factura" required>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-md-3 control-label">Fecha</label>
                                <div class="col-md-9">
                                    <div class="input-group">
                                        <input name="fecha" type="text" class="form-control datepicker" placeholder="dd/mm/yyyy" required>
                                        <div class="input-group-append">
                                            <span class="input-group-text bg-custom text-white b-0"><i class="mdi mdi-calendar"></i></span>
                                        </div>
                                    </div><!-- input-group -->
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-md-3 control-label">Monto Total</label>
                                <div class="col-md-9">
                                    <input name="monto" step="any" type="number" class="form-control" placeholder="Total de la factura" required>
                                </div>
                            </div>            

                            <div class="form-group row">
                                <label class="control-label col-md-3">Archivo</label>
                                <div class="col-md-9">
                                    <div class="fileinput fileinput-new" data-provides="fileinput">
                                        <span class="btn btn-primary btn-file waves-effect waves-light">
                                            <span class="fileinput-new"> Seleccionar </span>
                                            <span class="fileinput-exists"> Cambiar </span>
                                            <input type="file" name="file" required> </span>
                                        <span class="fileinput-filename"> </span> &nbsp;
                                        <a href="javascript:;" class="close fileinput-exists" data-dismiss="fileinput"> </a>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group no-margin">
                                        <label for="field-7" class="control-label">Glosa</label>
                                        <textarea name="glosa" class="form-control autogrow" id="field-7" placeholder="Ingrese alguna nota o aclaración si corresponde." style="overflow: hidden; word-wrap: break-word; resize: horizontal; height: 104px;"></textarea>
                                    </div>
                                </div>
                            </div>
                            <input type="hidden" name="id" value="${evento.evento_id}"> 
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary waves-effect" data-dismiss="modal">Cancelar</button>
                            <button type="submit" class="btn btn-info waves-effect waves-light">Guardar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div><!-- /.modal -->     

        <div id="addproducto" class="modal fade" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="addproductoLabel" aria-hidden="true" style="display: none;">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title mt-0">Agregar</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="agregarproducto" method="post">
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="field-pid" class="control-label">Producto</label>
                                        <select name="pid" class="form-control" id="field-pid">
                                            <c:forEach var="c" items="${productos}">
                                                <option value="${c.producto_id}">${c.descripcion} (${c.unidad})</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="field-cantidad" class="control-label">Cantidad</label>
                                        <input type="number" class="form-control" id="field-cantidad" name="cantidad" required step="any">
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="field-lote" class="control-label">Lote</label>
                                        <input type="number" class="form-control" id="field-lote" name="lote" required>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group no-margin">
                                        <label for="field-7" class="control-label">Descripción</label>
                                        <textarea name="glosa" class="form-control autogrow" id="field-7" placeholder="Ingrese alguna nota o aclaración si corresponde." style="overflow: hidden; word-wrap: break-word; resize: horizontal; height: 104px;"></textarea>
                                    </div>
                                </div>
                            </div>
                            <input type="hidden" name="gid" value="${guia.guia_id}">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary waves-effect" data-dismiss="modal">Cancelar</button>
                            <button type="submit" class="btn btn-info waves-effect waves-light">Guardar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div><!-- /.modal -->

        <div id="factura-file" class="modal fade"  tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title mt-0">Factura</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <embed src="" frameborder="0" width="100%" height="400px" class="file-view">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary waves-effect" data-dismiss="modal">Cancelar</button>
                        <a class="btn btn-success waves-effect waves-light" href="/erp/erp/sales/pdffactura?fid=1291745920352259" target="_blank">
                            <i class="fa fa-download"></i>  Descargar
                        </a>
                    </div>
                </div>
            </div>
        </div> 
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

        <!-- Examples -->
        <script src="plugins/tiny-editable/mindmup-editabletable.js"></script>
        <script src="plugins/tiny-editable/numeric-input-example.js"></script>


        <!-- init -->
        <!--<script src="assets/pages/jquery.datatables.init.js"></script>-->
        <script src="assets/pages/jquery.datatables.editable.init.js"></script>

        <!-- Init Js file -->
        <!--        <script src="assets/pages/jquery.form-advanced.init.js"></script>-->

        <!-- Sweet-Alert  -->
        <script src="plugins/sweet-alert2/sweetalert2.min.js"></script>
        <!-- Bootstrap fileupload js -->
        <!--<script src="plugins/bootstrap-fileupload/bootstrap-fileupload.js"></script>-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js"></script>
        <!-- App js -->
        <script src="assets/js/jquery.core.js"></script>
        <script src="assets/js/jquery.app.js"></script>
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <script src="/metronic/theme/assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL PLUGINS -->

        <script type="text/javascript">
            loadPdf = function (op) {
                window.open(op, '_blank', 'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,width=700,height=600');
            };
            $(document).ready(function () {
                // Select2
                $(".select2").select2();

                $(".select2-limiting").select2({
                    maximumSelectionLength: 2
                });

                // Date Picker
                $('#datepicker-autoclose').datepicker({
                    format: 'dd/mm/yyyy',
                    //startDate: '-5d',
                    autoclose: true//,
                            //todayHighlight: true
                });
                $('.datepicker').datepicker({
                    format: 'dd/mm/yyyy',
                    autoclose: true
                });

                $('#factura-file').on('show.bs.modal', function (e) {
                    $(this).find('.file-view').attr('src', $(e.relatedTarget).data('href'));
                });

                $('#datatable-responsive').DataTable();

                $('#addproducto').on('show.bs.modal', function (event) {
                    //$('#selectproduct').select2({ dropdownParent: "#addproducto" });
                });

            });
        </script>
        <script type="text/javascript">
            !function ($) {
                "use strict";
                var SweetAlert = function () {};

                //examples
                SweetAlert.prototype.init = function () {
                    // Delete rec
                    $('.sa-delete').click(function () {
                        var href = $(this).data("href");
                        Swal.fire({
                            title: '¿Estas seguro?',
                            text: "Esta acción no podrá deshacerse!",
                            type: 'warning',
                            showCancelButton: true,
                            confirmButtonText: 'Si, eliminar',
                            cancelButtonText: 'No, cancelar',
                            confirmButtonColor: "#58db83",
                            cancelButtonColor: "#ec536c"
                        }).then(function (result) {
                            if (result.value) {
                                Swal.fire({
                                    title: '¡Eliminado!',
                                    text: 'El registro ha sido eliminado.',
                                    type: 'success',
                                    showOkButton: false
                                });
                                window.location = href;
                            } else if (
                                    // Read more about handling dismissals
                                    result.dismiss === Swal.DismissReason.cancel
                                    ) {
                                Swal.fire({
                                    title: 'Cancelado',
                                    text: 'Todo sigue igual que antes :)',
                                    type: 'error'
                                })
                            }
                        });
                    });
                };
                //init
                $.SweetAlert = new SweetAlert, $.SweetAlert.Constructor = SweetAlert;
            }(window.jQuery),
                    // initializing
                            function ($) {
                                "use strict";
                                $.SweetAlert.init();
                            }(window.jQuery);

                    // Function to toggle password visibility
                    document.getElementById('togglePassword').addEventListener('click', function () {
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