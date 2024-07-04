<%-- 
    Document   : evento
    Created on : Mar 12, 2024, 05:30:10 PM
    Author     : Helen Castillo
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
        <!-- Bootstrap fileupload css -->
        <!--<link href="plugins/bootstrap-fileupload/bootstrap-fileupload.css" rel="stylesheet" />-->

        <!-- App css -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/metismenu.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/icons.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/style.css" rel="stylesheet" type="text/css" />

        <link href="plugins/bootstrap-select/css/bootstrap-select.min.css" rel="stylesheet" />

        <script src="assets/js/modernizr.min.js"></script>
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
                                            <a href="#">Eventos</a>
                                        </li>
                                        <li>
                                            <a href="#">Eventos</a>
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
                                        <h4 class="m-t-0 header-title"><b>ID - ${evento.evento_id}</b></h4>
                                        <p class="text-muted m-b-30">
                                            Información completa del evento: <code>Descripción</code>, <code>Fecha</code>, <code>Ubicación</code>, <code>Ciudad</code>.
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
                                                    <span class="d-none d-sm-block">Organizaciones</span>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="facturas-tab-b1" data-toggle="tab" href="#facturas-b1" role="tab" aria-controls="facturas-b1" aria-selected="true">
                                                    <span class="d-block d-sm-none"><i class="fa fa-file"></i></span>
                                                    <span class="d-none d-sm-block">Voluntarios</span>
                                                </a>
                                            </li>
                                        </ul>
                                        <div class="tab-content">
                                            <div class="tab-pane show active" id="home-b1" role="tabpanel" aria-labelledby="home-tab-b1">
                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <form class="form-horizontal" action="actualizarevento" method="post">
                                                            <div class="form-group row">
                                                                <label class="col-md-3 control-label">Descripción</label>
                                                                <div class="col-md-9">
                                                                    <input name="descripcion" type="text" class="form-control" value="${evento.descripcion}" placeholder="" required>
                                                                </div>
                                                            </div>   

                                                            <div class="form-group row">
                                                                <label class="col-md-3 control-label">Fecha embarque</label>
                                                                <div class="col-md-9">
                                                                    <div class="input-group">
                                                                        <input name="fecha" type="text" class="form-control" value="<fmt:formatDate value="${evento.fecha}" pattern="dd/MM/yyyy"/>" placeholder="dd/mm/yyyy" id="datepicker-autoclose" required>
                                                                        <div class="input-group-append">
                                                                            <span class="input-group-text bg-custom text-white b-0"><i class="mdi mdi-calendar"></i></span>
                                                                        </div>
                                                                    </div><!-- input-group -->
                                                                </div>
                                                            </div>

                                                            <div class="form-group row">
                                                                <label class="col-md-3 control-label">Responsable</label>
                                                                <div class="col-md-9">
                                                                    <input name="responsable" type="text" class="form-control" value="${evento.responsable}" placeholder="Responsable asignado">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 control-label">Ubicación</label>
                                                                <div class="col-md-9">
                                                                    <input name="ubicacion" type="text" class="form-control" value="${evento.ubicacion}" placeholder="" required>
                                                                </div>
                                                            </div>    
                                                            <div class="form-group row">
                                                                <label class="col-md-3 control-label">Ciudad</label>
                                                                <div class="col-md-9">
                                                                    <input name="ciudad" type="text" class="form-control" value="${evento.ciudad}" placeholder="" required>
                                                                </div>
                                                            </div>   

                                                            <div class="form-group row">
                                                                <label class="col-md-12 control-label">Observación</label>
                                                                <div class="col-md-12">
                                                                    <textarea name="observacion" class="form-control" placeholder="Ingrese una nota u observación para este evento">${evento.observacion}</textarea>
                                                                </div>
                                                            </div>     

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
                                                            <input type="hidden" name="id" value="${evento.evento_id}">
                                                        </form>
                                                    </div> <!-- end col -->
                                                </div>
                                                <!-- end row -->
                                            </div>
                                            <div class="tab-pane" id="contenido-b1" role="tabpanel" aria-labelledby="contenido-tab-b1">
                                                <!--<p>Ingrese aquí todo el contenido en la guia.  Productos y servicios</p>-->
                                                <div class="row">
                                                    <div class="col-sm-6">
                                                        <div class="m-b-30">                                                        
                                                            <button data-target="#addproducto" data-toggle="modal" class="btn btn-primary waves-effect waves-light">Adicionar <i class="mdi mdi-plus-circle-outline"></i></button>
                                                            <!--<button data-target="#addservicio" data-toggle="modal" class="btn btn-custom waves-effect waves-light">Servicio <i class="mdi mdi-plus-circle-outline"></i></button>-->
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="table-responsive">
                                                    <table class="table m-b-0">
                                                        <thead class="bg-primary text-white">
                                                            <tr>
                                                                <th>#</th>
                                                                <th>Nombre completo</th>
                                                                <th>Celular</th>
                                                                <th data-priority="1">Acción</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach var="d" items="${orderdetail}" varStatus="i">
                                                                <tr>
                                                                    <td> ${d.descripcion} </td>
                                                                    <td> ${d.cantidad} <small>${d.unidad}(s)</small> </td>
                                                                    <td> ${d.lote} </td>
                                                                    <td class="actions">
                                                                        <!--<button class="btn waves-effect waves-light btn-custom btn-xs"> <i class="fa fa-pencil"></i> </button>-->
                                                                        <button data-href="eliminarcontenido?pid=${d.pedido_detalle_id}&gid=${guia.guia_id}" class="btn waves-effect waves-light btn-danger btn-xs sa-delete"> <i class="fa fa-trash-o"></i></button>
                                                                    </td>
                                                                </tr>
                                                            </c:forEach>   
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>                    
                                            <div class="tab-pane" id="facturas-b1" role="tabpanel" aria-labelledby="facturas-tab-b1">
                                                <!--<p>Registre aquí todoss las facturas emitidas para esta guía.</p>-->
                                                <div class="row">
                                                    <div class="col-sm-6">
                                                        <div class="m-b-30">
                                                            <button data-target="#addfactura" data-toggle="modal" class="btn btn-success waves-effect waves-light">Adicionar <i class="mdi mdi-plus-circle-outline"></i></button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="table-responsive">
                                                    <table class="table m-b-0">
                                                        <thead class="bg-success text-white">
                                                            <tr>
                                                                <th>#</th>
                                                                <th>Nombre completo</th>
                                                                <th>Celular</th>                                                                
                                                                <th data-priority="1">Acción</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach var="c" items="${facturas}" varStatus="i">
                                                                <tr>
                                                                    <td>${i.count}</td>
                                                                    <td>${c.numero}</td>
                                                                    <td><fmt:formatDate value="${c.fecha}" pattern="dd/MM/yyyy"/></td>
                                                                    <td>${c.monto}</td>
                                                                    <td><span class="badge badge-success">Entregado</span></td>
                                                                    <td class="actions">
                                                                        <a data-href="<c:url value="/erp/sales/pdffactura?fid=${c.factura_id}"/>" data-target="#factura-file" data-toggle="modal" class="btn waves-effect waves-light btn-custom btn-xs"> 
                                                                            <i class="fa fa-pencil"></i> 
                                                                        </a>
                                                                        <button class="btn waves-effect waves-light btn-success btn-xs"> <i class="fa fa-copy"></i> </button>
                                                                    </td>
                                                                </tr>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div class="tab-pane" id="depositos-b1" role="tabpanel" aria-labelledby="depositos-tab-b1">
                                                <p>Registre aquí todoss los pagos y facturas emitidas para esta guía .</p>
                                                <div class="row">
                                                    <div class="col-sm-6">
                                                        <div class="m-b-30">
                                                            <button class="btn btn-primary waves-effect waves-light">Adjuntar <i class="mdi mdi-plus-circle-outline"></i></button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="table-responsive">
                                                    <table class="table m-b-0">
                                                        <thead class="bg-primary text-white">
                                                            <tr>
                                                                <th>#</th>
                                                                <th>Número factura</th>
                                                                <th>Fecha</th>
                                                                <th>Monto</th>
                                                                <th>Estado</th>
                                                                <th>Adjunto</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>

                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>                    
                                            <div class="tab-pane" id="message-b1" role="tabpanel" aria-labelledby="message-tab-b1">

                                            </div>
                                            <div class="tab-pane" id="setting-b1" role="tabpanel" aria-labelledby="setting-tab-b1">

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
                    2024 © Sges. Eventos - INF-281
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
        </script>
    </body>
</html>