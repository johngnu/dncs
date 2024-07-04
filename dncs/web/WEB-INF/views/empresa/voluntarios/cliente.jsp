<%-- 
    Document   : cliente
    Created on : Mar 12, 2019, 05:30:10 PM
    Author     : John Castillo
--%>
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
                                            <a href="#">Bacheo</a>
                                        </li>
                                        <li>
                                            <a href="#">Clientes</a>
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
                                        <h4 class="m-t-0 header-title"><b>Información del cliente</b></h4>
                                        <p class="text-muted m-b-30">
                                            Datos del cliente: <code>Contacto</code>, <code>dirección</code>, <code>ubicación geográfica</code>, <code>historial</code>, <code>facturas</code>, <code>cotizaciones</code>.
                                        </p>
                                        <form class="form-horizontal" action="actualizarcliente" method="post">
                                            <div class="row">
                                                <div class="col-lg-6">
                                                    <c:if test="${cliente.tipo_cliente != 'PERSONA'}">
                                                        <div class="form-group row">
                                                            <label class="col-md-3 control-label">Nombre corto</label>
                                                            <div class="col-md-9">
                                                                <input name="nombre" type="text" class="form-control" value="${cliente.nombre}" placeholder="Nombre corto de la Empresa o Entidad pública" required>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-md-3 control-label">Nombre extendido</label>
                                                            <div class="col-md-9">
                                                                <input name="extendido" type="text" class="form-control" value="${cliente.extendido}" placeholder="Nombre largo de la Empresa o Entidad pública">
                                                            </div>
                                                        </div>    
                                                    </c:if>

                                                    <c:if test="${cliente.tipo_cliente == 'PERSONA'}">
                                                        <div class="form-group row">
                                                            <label class="col-md-3 control-label">Nombre</label>
                                                            <div class="col-md-9">
                                                                <input name="nombre" type="text" class="form-control" value="${cliente.nombre}" placeholder="Nombre Persona, Empresa o Entidad pública" required>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-md-3 control-label">Apellido</label>
                                                            <div class="col-md-9">
                                                                <input name="apellido" type="text" class="form-control" value="${cliente.apellido}" placeholder="" required>
                                                            </div>
                                                        </div>            
                                                    </c:if>    

                                                    <div class="form-group row">
                                                        <label class="col-md-3 control-label" for="example-email">Tipo cliente</label>
                                                        <div class="col-md-9">
                                                            <select name="tipo_cliente" class="form-control">                                                                
                                                                <option value="PERSONA"<c:if test="${cliente.tipo_cliente == 'PERSONA'}"> selected</c:if>>PERSONA</option>
                                                                <option value="EMPRESA"<c:if test="${cliente.tipo_cliente == 'EMPRESA'}"> selected</c:if>>EMPRESA</option>
                                                                <option value="ENTIDAD"<c:if test="${cliente.tipo_cliente == 'ENTIDAD'}"> selected</c:if>>ENTIDAD PÚBLICA</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <hr/> 
                                                        <div class="form-group row">
                                                            <label class="col-md-3 control-label">Razón social</label>
                                                            <div class="col-md-9">
                                                                <input name="razon_social" type="text" class="form-control" value="${cliente.razon_social}" placeholder="">
                                                        </div>
                                                    </div>

                                                    <div class="form-group row">
                                                        <label class="col-md-3 control-label">NIT</label>
                                                        <div class="col-md-9">
                                                            <input name="nit" type="number" class="form-control" value="${cliente.nit}" placeholder="">
                                                        </div>
                                                    </div>    
                                                </div>

                                                <div class="col-lg-6">

                                                    <div class="form-group row">
                                                        <label class="col-md-3 control-label">Correo electrónico</label>
                                                        <div class="col-md-9">
                                                            <input name="email" type="email" class="form-control" value="${cliente.email}">
                                                        </div>
                                                    </div>

                                                    <div class="form-group row">
                                                        <label class="col-md-3 control-label">Teléfono</label>
                                                        <div class="col-md-9">
                                                            <input name="telefono" type="text" class="form-control" value="${cliente.telefono}">
                                                        </div>
                                                    </div>

                                                    <div class="form-group row">
                                                        <label class="col-md-3 control-label">Celular</label>
                                                        <div class="col-md-9">
                                                            <input name="celular" type="text" class="form-control" value="${cliente.celular}">
                                                        </div>
                                                    </div>    

                                                    <div class="form-group row">
                                                        <label class="col-md-3 control-label">Ciudad</label>
                                                        <div class="col-md-9">
                                                            <input name="ciudad" type="text" class="form-control" value="${cliente.ciudad}">
                                                        </div>
                                                    </div>     
                                                </div> <!-- end col -->
                                            </div>
                                            <!-- end row -->

                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <div class="form-group row">
                                                        <label class="col-md-12 control-label">Dirección</label>
                                                        <div class="col-md-12">
                                                            <textarea name="direccion" class="form-control" placeholder="Ingrese la dirección del cliente">${cliente.direccion}</textarea>
                                                        </div>
                                                    </div>
                                                </div> <!-- end col -->

                                            </div> <!-- end row -->
                                            <input type="hidden" name="cliente" value="${cliente.cliente_id}">
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

                                        </form>
                                    </div>
                                    <div class="card-footer">
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="m-b-5">                                                        
                                                    <button data-id="${cliente.cliente_id}" class="btn btn-danger waves-effect waves-light c-delete">Eliminar <i class="fa fa-trash-o"></i></button>                                                    
                                                </div>
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
                    2005 - 2019 © ICG SRL. - icg.com.bo
                </footer>

            </div>


            <!-- ============================================================== -->
            <!-- End Right content here -->
            <!-- ============================================================== -->


        </div>
        <!-- END wrapper -->

        <!-- MODAL -->

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

        <!-- App js -->
        <script src="assets/js/jquery.core.js"></script>
        <script src="assets/js/jquery.app.js"></script>

        <script type="text/javascript">
            !function ($) {
                "use strict";
                var SweetAlert = function () {};

                //examples
                SweetAlert.prototype.init = function () {
                    // Delete rec
                    $('.c-delete').click(function () {
                        var id = $(this).data("id");
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
                                    showOkButton: false,
                                });
                                var url = 'eliminarcliente?id=' + id;
                                window.location = url;
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
        </script>
        <script>
            $(document).ready(function () {

                jQuery(document).ready(function () {
                    // Select2
                    $(".select2").select2();

                    $(".select2-limiting").select2({
                        maximumSelectionLength: 2
                    });

                    //$('.selectpicker').selectpicker();
                    //$(":file").filestyle({input: false});
                    // Date Picker
                    //jQuery('#datepicker').datepicker();
                    jQuery('#datepicker-autoclose').datepicker({
                        format: 'dd/mm/yyyy',
                        startDate: '-5d',
                        autoclose: true,
                        todayHighlight: true
                    });

                });

                $('#datatable-responsive').DataTable();

                $('#addproducto').on('show.bs.modal', function (event) {
                    //$('#selectproduct').select2({ dropdownParent: "#addproducto" });
                });

//                $('select:not(.normal)').each(function () {
//                    $(this).select2({
//                        dropdownParent: $(this).parent()
//                    });
//                });

                //Parameter
                $('.sa-delete').click(function () {
                    var id = $(this).data("id");

                    swal({
                        title: '¿Estas seguro?',
                        text: "Esta acción no podrá deshacerse!",
                        type: 'warning',
                        showCancelButton: true,
                        confirmButtonText: 'Si, eliminar!',
                        cancelButtonText: 'No, cancelar!',
                        confirmButtonClass: 'btn btn-success',
                        cancelButtonClass: 'btn btn-danger m-l-10',
                        buttonsStyling: false
                    }).then(function () {
                        swal(
                                'Deleted!',
                                'Your file has been deleted.',
                                'success'
                                );

                        var url = 'eliminaritem?id=' + id;
                        window.location = url;

                    }, function (dismiss) {
                        // dismiss can be 'cancel', 'overlay',
                        // 'close', and 'timer'
                        if (dismiss === 'cancel') {
                            swal(
                                    'Cancelado',
                                    'Todo sigue igual que antes :)',
                                    'error'
                                    );
                        }
                    });

                });

            });
            //TableManageButtons.init();

        </script>
    </body>
</html>