<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <%@include file="../cmp/titlemeta.jsp"%>

        <!-- App favicon -->
        <!--<link rel="shortcut icon" href="assets/images/favicon.ico">-->

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
                                    <h4 class="page-title">Solicitud</h4>
                                    <ol class="breadcrumb p-0 m-0">
                                        <li>
                                            <a href="#">DNCS</a>
                                        </li>
                                        <li>
                                            <a href="#">Solicitudes</a>
                                        </li>
                                        <li class="active">
                                            Solicitud
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
                                    <div class="card-header">
                                        <h4 class="header-title"><b>Solicitud ID: ${donation.solicitud_id}</b></h4>
                                        <p class="text-muted">Registro: ${donation.registro}</p>
                                    </div>
                                    <div class="card-body">                                        
                                        <form class="form-horizontal">
                                            <div class="row">
                                                <div class="col-lg-6">
                                                    <div class="form-group row">
                                                        <label class="col-md-3 control-label">Receptor </label>
                                                        <div class="col-md-9">
                                                            <input readonly type="text" class="form-control" value="${donation.donante.nombre} ${donation.donante.apellido}" placeholder="Organización o persona">
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-md-3 control-label">Fecha<span class="text-danger">*</span> </label>
                                                        <div class="col-md-9">
                                                            <div class="input-group">
                                                                <input value="<fmt:formatDate value="${donation.fecha}" pattern="dd/MM/yyyy"/>" name="fecha" type="text" class="form-control" placeholder="dd/mm/yyyy" id="datepicker-autoclose" required>
                                                                <div class="input-group-append">
                                                                    <span class="input-group-text bg-custom text-white b-0"><i class="mdi mdi-calendar"></i></span>
                                                                </div>
                                                            </div><!-- input-group -->
                                                        </div>
                                                    </div> 
                                                    <div class="form-group row">
                                                        <label class="col-md-3 control-label">Contacto</label>
                                                        <div class="col-md-9">
                                                            <input name="responsable" type="text" class="form-control" required value="${donation.responsable}" placeholder="Persona de contacto">
                                                        </div>
                                                    </div>            
                                                </div>

                                                <div class="col-lg-6">
                                                    <div class="form-group row">
                                                        <label class="col-md-3 control-label">Ubicación</label>
                                                        <div class="col-md-9">
                                                            <input name="ubicacion" type="text" class="form-control" required value="${donation.ubicacion}" placeholder="Nro. días">
                                                        </div>
                                                    </div>

                                                    <div class="form-group row">
                                                        <label class="col-md-3 control-label">Ciudad</label>
                                                        <div class="col-md-9">
                                                            <input name="ciudad" type="text" class="form-control" value="${donation.ciudad}">
                                                        </div>
                                                    </div>

                                                    <div class="form-group row">
                                                        <label class="col-md-3 control-label">Estado</label>
                                                        <div class="col-md-9">
                                                            <input readonly type="text" class="form-control" value="${donation.estado}" placeholder="">
                                                        </div>
                                                    </div>

                                                </div> <!-- end col -->
                                            </div>
                                            <!-- end row -->                                            
                                        </form>
                                    </div>
                                </div>
                            </div><!-- end col -->
                        </div>
                        <!-- end row -->

                        <div class="row" id="products">
                            <div class="col-sm-12">
                                <div class="card">
                                    <div class="card-body">
                                        <table class="table table-striped add-edit-table table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                            <thead>
                                                <tr>
                                                    <th data-priority="0">#</th>
                                                    <th> Categoría </th>
                                                    <th> Detalles</th>
                                                    <th> Cantidad / Unidad </th>
                                                    <th data-priority="1"> Acción </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="d" items="${donationdetail}" varStatus="i">
                                                    <tr>
                                                        <td> ${i.count} </td>
                                                        <td> ${d.descripcion} </td>
                                                        <td> ${d.detalle} </td>
                                                        <td class="text-right"> ${d.cantidad} </td>
                                                        <td class="actions" style="width: 0px">
                                                            <!--<button data-id="${d.cotizacion_detalle_id}" class="btn waves-effect waves-light btn-custom btn-xs" data-toggle="modal" data-target="#editproducto"> <i class="fa fa-pencil"></i> </button>-->
                                                            <!--<button data-id="${d.donacion_detalle_id}" class="btn waves-effect waves-light btn-danger btn-xs sa-params"> <i class="fa fa-trash-o"></i> </button>-->
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

                        <div class="row" id="voluntarios">
                            <div class="col-lg-12">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="m-t-0 header-title">Voluntarios asignados</h4>
                                        <p class="text-muted m-b-30">
                                            Seleccione los voluntarios para coordinar y atender la entrega.
                                        </p>

                                        <form class="form-horizontal">
                                            <c:forEach var="var" items="${items}" varStatus="i">
                                                <div class="custom-control custom-checkbox">
                                                    <input<c:if test="${!empty var.solicitud_voluntario_id}"> checked</c:if> type="checkbox" class="custom-control-input" id="nota_${i.count}" name="notaid" value="${var.voluntario_id}">
                                                    <label class="custom-control-label" for="nota_${i.count}">${var.nombre} ${var.apellido}</label>&nbsp; 
                                                    <c:if test="${!empty var.responsable}">
                                                        <c:if test="${resp == 0}">
                                                            <c:if test="${!var.responsable}"><a class="text-primary" href="setresponsablesol?id=${var.solicitud_voluntario_id}"><small>No responsable</small></a></c:if>
                                                            <c:if test="${var.responsable}"><a class="text-white bg-success" href="setresponsablesol?id=${var.solicitud_voluntario_id}"><strong>&nbsp;&nbsp;Responsable&nbsp;&nbsp;</strong></a></c:if>
                                                        </c:if>
                                                        <c:if test="${resp > 0}">
                                                            <c:if test="${var.responsable}"><span class="text-white bg-success"><strong>&nbsp;&nbsp;Responsable&nbsp;&nbsp;</strong></span></c:if>
                                                        </c:if>
                                                    </c:if>
                                                </div>
                                            </c:forEach>
                                            <!--<input type="hidden" name="id" value="${donation.solicitud_id}">
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
                                            </div>--> <!-- end row -->
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-4">
                                <a href="<c:url value="/empresa/entregarsolicitud?id=${donation.solicitud_id}"/>" class="btn btn-success waves-effect waves-light m-b-20"><i class="md md-add"></i> Entregado </a>
                                <a data-target="#proforma" data-toggle="modal" class="btn btn-info waves-effect waves-light m-b-20"><i class="fa fa-file-pdf-o m-r-5"></i> PDF </a>
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
        <div id="addproducto" class="modal fade" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="addproductoLabel" aria-hidden="true" style="display: none;">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title mt-0">Agregar</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="adddonationproduct" method="post">
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="control-label">Producto</label>
                                        <select name="producto" class="form-control">
                                            <c:forEach var="c" items="${productos}">
                                                <option value="${c.producto_id}">${c.descripcion}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="cantidad" class="control-label">Cantidad</label>
                                        <input type="number" class="form-control" id="cantidad" name="cantidad" step="any" required>
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <div class="form-group">
                                        <label for="detalle" class="control-label">Detalle</label>
                                        <input type="text" class="form-control" id="detalle" name="detalle">
                                    </div>
                                </div>
                            </div>
                            <!--<div class="row">
                                <div class="col-md-12">
                                    <div class="form-group no-margin">
                                        <label for="glosa" class="control-label">Nota</label>
                                        <textarea name="glosa" class="form-control autogrow" id="glosa" placeholder="Ingrese alguna nota o aclaración si corresponde." style="overflow: hidden; word-wrap: break-word; resize: horizontal; height: 104px;"></textarea>
                                    </div>
                                </div>
                            </div>-->
                            <input type="hidden" name="id" value="${donation.donacion_id}">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary waves-effect" data-dismiss="modal">Cancelar</button>
                            <button type="submit" class="btn btn-info waves-effect waves-light">Agregar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div><!-- /.modal -->

        <div id="proforma" class="modal fade" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="proformaLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title mt-0">PDF</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!--<embed src="<c:url value="/erp/quotes/pdfproforma?id=${cotizacion.cotizacion_id}"/>" frameborder="0" width="100%" height="400px">-->
                        <object data="<c:url value="/erp/quotes/pdfproforma?id=${cotizacion.cotizacion_id}"/>" type="application/pdf" width="100%" height="500px">
                            <embed src="<c:url value="/erp/quotes/pdfproforma?id=${cotizacion.cotizacion_id}"/>" type="application/pdf">
                            <p>This browser does not support PDFs. Please download the PDF to view it: <a href="<c:url value="/erp/quotes/pdfproforma?id=${cotizacion.cotizacion_id}"/>">Download PDF</a>.</p>
                            </embed>
                        </object>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary waves-effect" data-dismiss="modal">Cancelar</button>
                        <a class="btn btn-info waves-effect waves-light" href="<c:url value="/erp/quotes/pdfproforma?id=${cotizacion.cotizacion_id}&download=true"/>">Guardar</a>
                    </div>
                </div>
            </div>
        </div><!-- /.modal -->

        <!-- modal -->
        <div id="editproducto" class="modal fade" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="editproductoLabel" aria-hidden="true" style="display: none;">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title mt-0">Editar Item</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form id="editproductoForm" action="updateitem" method="post">
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="control-label">Producto</label>
                                        <input name="descripcion" type="text" class="form-control" id="e_producto" readonly="">
                                    </div>    
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="e_detalle" class="control-label">Detalle</label>
                                        <input type="text" class="form-control" id="e_detalle" name="detalle">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="e_cantidad" class="control-label">Cantidad</label>
                                        <input step="any" type="number" class="form-control" id="e_cantidad" name="cantidad" required>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="e_precio_final" class="control-label">Precio unitario</label>
                                        <input step="any" type="number" class="form-control" id="e_precio_final" name="precio_final" required>
                                    </div>
                                </div>
                            </div>
                            <input type="hidden" name="qid" value="${cotizacion.cotizacion_id}">
                            <input type="hidden" name="cotizacion_detalle_id">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary waves-effect" data-dismiss="modal">Cancelar</button>
                            <button type="submit" class="btn btn-info waves-effect waves-light">Guardar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div><!-- /.modal -->      

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
        <!--<script src="plugins/tiny-editable/mindmup-editabletable.js"></script>-->
        <!--<script src="plugins/tiny-editable/numeric-input-example.js"></script>-->
        <script src="plugins/parsleyjs/parsley.min.js"></script>

        <!-- init -->
        <!--<script src="assets/pages/jquery.datatables.init.js"></script>-->
        <!--<script src="assets/pages/jquery.datatables.editable.init.js"></script>-->

        <!-- Init Js file -->
        <!--<script src="assets/pages/jquery.form-advanced.init.js"></script>-->

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
                    $('.sa-params').click(function () {
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
                                var url = 'eliminardonacionproducto?id=' + id;
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
        <script type="text/javascript">
                    $(document).ready(function () {
                        $('form').parsley();
                        // Select2
                        $(".select2").select2();

                        $(".select2-limiting").select2({
                            maximumSelectionLength: 2
                        });

                        // Date Picker
                        $('#datepicker-autoclose').datepicker({
                            format: 'dd/mm/yyyy',
                            //startDate: '-5d',
                            orientation: 'bottom',
                            autoclose: true,
                            todayHighlight: true
                        });

                        $('#addproducto').on('show.bs.modal', function (event) {
                            //$('#selectproduct').select2({ dropdownParent: "#addproducto" });
                        });

                        var qdetails = ${qjsondetail};
                        $('#editproducto').on('show.bs.modal', function (e) {
                            var id = $(e.relatedTarget).data('id');
                            qdetails.forEach(function (e) {
                                if (e.cotizacion_detalle_id === id) {
                                    // get all the inputs into an array.
                                    var $inputs = $('#editproductoForm :input');
                                    $inputs.each(function () {
                                        if (e[this.name]) {
                                            $(this).val(e[this.name]);
                                        }
                                    });
                                }
                            });
                        });

                    });
        </script>
    </body>
</html>