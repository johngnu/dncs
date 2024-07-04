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
                                    <div class="card-body">
                                        <h4 class="m-t-0 header-title"><b>Solicitud: ${donation.solicitud_id}</b></h4>
                                        <p class="text-muted m-b-30">

                                        </p>
                                        <form class="form-horizontal" method="post">
                                            <div class="row">
                                                <div class="col-lg-6">
                                                    <div class="form-group row">
                                                        <label class="col-md-3 control-label">Receptor </label>
                                                        <div class="col-md-9">
                                                            <input readonly type="text" class="form-control" value="${donation.donante.nombre} ${donation.donante.apellidos}" placeholder="Organización o persona">
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-md-3 control-label">Fecha <span class="text-danger">*</span> </label>
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
                                        <h4 class="m-t-0 header-title"><b>Detalle de la donación</h4>

                                        <table class="table table-striped add-edit-table table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                            <thead>
                                                <tr>
                                                    <th data-priority="0">#</th>
                                                    <th> Categoría </th>
                                                    <th> Detalles</th>
                                                    <th> Cantidad </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="d" items="${donationdetail}" varStatus="i">
                                                    <tr>
                                                        <td> ${i.count} </td>
                                                        <td> ${d.descripcion} </td>
                                                        <td> ${d.detalle} </td>
                                                        <td> ${d.cantidad} </td>
                                                    </tr>
                                                </c:forEach>   
                                            </tbody>
                                        </table>
                                        
                                        <div class="row">
                                            <div class="col-sm-6">                                                       
                                                <c:if test="${!donation.soyvoluntario}"><a href="<c:url value="soyvoluntariosol?id=${donation.solicitud_id}"/>" class="btn btn-success waves-effect waves-light">Asignarme como voluntario <i class="mdi mdi-plus-circle-outline"></i></a></c:if>
                                                <c:if test="${donation.soyvoluntario}"><a href="<c:url value="soyvoluntariosol?id=${donation.solicitud_id}"/>" class="btn btn-danger waves-effect waves-light">Salir como voluntario <i class="mdi mdi-plus-circle-outline"></i></a></c:if>                                                
                                            </div>
                                        </div>
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
        <script src="plugins/parsleyjs/parsley.min.js"></script>

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