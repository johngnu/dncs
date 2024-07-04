<%-- 
    Document   : guia
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
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <link href="/metronic/theme/assets/global/plugins/jcrop/css/jquery.Jcrop.min.css" rel="stylesheet" type="text/css" />        
        <!-- END PAGE LEVEL PLUGINS -->
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
                                            <a href="#">Bacheo</a>
                                        </li>
                                        <li>
                                            <a href="#">GDS</a>
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
                                        

                                        <div class="row">
                                            <div class="col-lg-9">
                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <div class="card">
                                                            <div class="card-heading bg-danger">
                                                                <h3 class="card-title text-white">Guía Física</h3>
                                                                <p class="card-sub-title">Edición de la imagen de la guía.</p>
                                                            </div>
                                                            <div class="card-body">                                                                
                                                                <div class="row">
                                                                    <div class="col-md-7 responsive-1024">
                                                                        <img src="<c:url value="/erp/sales/openfile"/>?id=${guia.filedata}" id="demo6"  alt="Image Croping" class="img-fluid" > 
                                                                    </div>
                                                                    <div class="col-md-5 responsive-1024">
                                                                        <h4>Acciones de edicíón de imagen</h4>
                                                                        <form action="<c:url value="/empresa/crop"/>" method="post" id="cordsform">
                                                                            <input type="hidden" name="cords">
                                                                            <button class="btn btn-success">Guardar</button>
                                                                            <a class="btn btn-custom" href="<c:url value="/empresa/guia?id=${guia.guia_id}"/>">Cancelar</a>
                                                                        </form> 
                                                                        <p>
                                                                            <br>
                                                                            <b>Seleccione área de la imagen.</b> Click en Guardar tras completar la selección. 
                                                                        </p>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div> <!-- end col -->
                                        </div>
                                        <!-- end row -->



                                    </div>
                                </div>
                            </div><!-- end col -->
                        </div>
                        <!-- end row -->


                        <c:if test="${edit}">

                            <div class="row">
                                <div class="col-sm-4">
                                    <a href="<c:url value="/empresa/cotizacion?id=${cotizacion.cotizacion_id}"/>" class="btn btn-success waves-effect waves-light m-b-20"><i class="md md-add"></i> Finalizar </a>
                                </div><!-- end col -->
                            </div>
                            <!-- end row -->

                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <h4 class="m-t-0 header-title"><b>Cotización ${cotizacion.codigo}</b></h4>
                                            <p class="text-muted m-b-30">

                                            </p>
                                            <form class="form-horizontal" action="guardarcotizacion" method="post">
                                                <div class="row">
                                                    <div class="col-lg-6">

                                                        <div class="form-group row">
                                                            <label class="col-md-3 control-label">Remite </label>
                                                            <div class="col-md-9">
                                                                <input name="remitente" type="text" class="form-control" value="${cotizacion.remitente}" placeholder="empresa o persona quien remite">
                                                            </div>
                                                        </div>

                                                        <div class="form-group row">
                                                            <label class="col-md-3 control-label">Cliente</label>
                                                            <div class="col-md-9">
                                                                <select name="cliente" class="form-control select2" required>
                                                                    <optgroup label="Personas">
                                                                        <c:forEach var="c" items="${clientes}">
                                                                            <c:if test="${c.tipo_cliente == 'PERSONA'}">
                                                                                <option value="${c.cliente_id}"<c:if test="${c.cliente_id == cotizacion.cliente}"> selected</c:if>>${c.nombre} ${c.apellido}</option>
                                                                            </c:if>
                                                                        </c:forEach>
                                                                    </optgroup>
                                                                    <optgroup label="Empresas">
                                                                        <c:forEach var="c" items="${clientes}">
                                                                            <c:if test="${c.tipo_cliente == 'EMPRESA'}">
                                                                                <option value="${c.cliente_id}"<c:if test="${c.cliente_id == cotizacion.cliente}"> selected</c:if>>${c.nombre}</option>
                                                                            </c:if>
                                                                        </c:forEach>
                                                                    </optgroup>
                                                                    <optgroup label="Entidades públicas">
                                                                        <c:forEach var="c" items="${clientes}">
                                                                            <c:if test="${c.tipo_cliente == 'ENTIDAD'}">
                                                                                <option value="${c.cliente_id}"<c:if test="${c.cliente_id == cotizacion.cliente}"> selected</c:if>>${c.nombre}</option>
                                                                            </c:if>
                                                                        </c:forEach>
                                                                    </optgroup>
                                                                </select>
                                                            </div>
                                                        </div>

                                                    </div>

                                                    <div class="col-lg-6">

                                                        <div class="form-group row">
                                                            <label class="col-md-3 control-label">Emisión</label>
                                                            <div class="col-md-9">
                                                                <div class="input-group">
                                                                    <input value="<fmt:formatDate value="${cotizacion.emision}" pattern="dd/MM/yyyy"/>" name="emision" type="text" class="form-control" placeholder="dd/mm/yyyy" id="datepicker-autoclose">
                                                                    <div class="input-group-append">
                                                                        <span class="input-group-text bg-custom text-white b-0"><i class="mdi mdi-calendar"></i></span>
                                                                    </div>
                                                                </div><!-- input-group -->
                                                            </div>
                                                        </div>

                                                        <div class="form-group row">
                                                            <label class="col-md-3 control-label">Expiración</label>
                                                            <div class="col-md-9">
                                                                <input name="validez" type="number" class="form-control" required value="${cotizacion.validez}">
                                                            </div>
                                                        </div>

                                                        <div class="form-group row">
                                                            <label class="col-md-3 control-label">Referencia</label>
                                                            <div class="col-md-9">
                                                                <input name="referencia" type="text" class="form-control" value="${cotizacion.referencia}">
                                                            </div>
                                                        </div>

                                                        <div class="form-group row">
                                                            <label class="col-md-3 control-label">Plazo entrega</label>
                                                            <div class="col-md-9">
                                                                <input name="plazo_entrega" type="text" class="form-control" value="${cotizacion.plazo_entrega}">
                                                            </div>
                                                        </div>

                                                        <div class="form-group row">
                                                            <label class="col-md-3 control-label">Lugar entrega</label>
                                                            <div class="col-md-9">
                                                                <input name="lugar_entrega" type="text" class="form-control" value="${cotizacion.lugar_entrega}">
                                                            </div>
                                                        </div>

                                                    </div> <!-- end col -->
                                                </div>
                                                <!-- end row -->

                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <div class="form-group row">
                                                            <label class="col-md-12 control-label">Nota</label>
                                                            <div class="col-md-12">
                                                                <textarea name="nota" class="form-control" placeholder="Ingrese una nota o aclaración para esta cotización.">${cotizacion.nota}</textarea>
                                                            </div>
                                                        </div>
                                                    </div> <!-- end col -->

                                                </div> <!-- end row -->
                                                <input type="hidden" name="id" value="${cotizacion.cotizacion_id}">
                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <div class="form-group text-right m-b-0">
                                                            <button class="btn btn-primary waves-effect waves-light" type="submit">
                                                                Guardar
                                                            </button>
                                                            <button type="reset" class="btn btn-secondary waves-effect m-l-5">
                                                                Cancelar
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div> <!-- end row -->
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
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <div class="m-b-30">                                                        
                                                        <button data-target="#addproducto" data-toggle="modal" class="btn btn-primary waves-effect waves-light">Producto <i class="mdi mdi-plus-circle-outline"></i></button>
                                                        <button data-target="#addservicio" data-toggle="modal" class="btn btn-custom waves-effect waves-light">Servicio <i class="mdi mdi-plus-circle-outline"></i></button>
                                                    </div>
                                                </div>
                                            </div>

                                            <table id="datatable-responsive" class="table table-striped add-edit-table table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                                <thead>
                                                    <tr>
                                                        <th data-priority="0"> Producto / Servicio </th>
                                                        <th> Precio Bs.</th>
                                                        <th> Cantidad / Unidad </th>
                                                        <th> Total Bs.</th>
                                                        <th data-priority="1"> Acción </th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="d" items="${quotedetail}" varStatus="i">
                                                        <tr>
                                                            <td> ${d.descripcion} | <small>${d.codigo}</small> </td>
                                                            <td> <fmt:formatNumber value="${d.precio_final}" pattern="#,##0.00"/> </td>
                                                            <td> ${d.cantidad} <small>${d.unidad}(s)</small> </td>
                                                            <td> <fmt:formatNumber value="${d.precio_final * d.cantidad}" pattern="#,##0.00"/>  </td> 
                                                            <td class="actions">
                                                                <!--<button class="btn waves-effect waves-light btn-custom btn-xs"> <i class="fa fa-pencil"></i> </button>-->
                                                                <button data-id="${d.cotizacion_detalle_id}" class="btn waves-effect waves-light btn-danger btn-xs sa-delete"> <i class="fa fa-trash-o"></i> </button>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                    <c:forEach var="d" items="${quoteservicedetail}" varStatus="i">
                                                        <tr>
                                                            <td> ${d.detalle}</td>
                                                            <td> <fmt:formatNumber value="${d.precio_final}" pattern="#,##0.00"/> </td>
                                                            <td> ${d.cantidad} <br> <small>${d.unidad}</small> </td>
                                                            <td> <fmt:formatNumber value="${d.precio_final * d.cantidad}" pattern="#,##0.00"/>  </td> 
                                                            <td class="actions">
                                                                <!--<button class="btn waves-effect waves-light btn-custom btn-xs"> <i class="fa fa-pencil"></i> </button>-->
                                                                <button data-id="${d.cotizacion_detalle_id}" class="btn waves-effect waves-light btn-danger btn-xs sa-delete"> <i class="fa fa-trash-o"></i> </button>
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
                        </c:if> 

                        <c:if test="${!empty cotizacion && !edit}"> 

                            <div class="row">
                                <div class="col-sm-4">
                                    <a href="<c:url value="/empresa/cotizacion?id=${cotizacion.cotizacion_id}&edit=true"/>" class="btn btn-success waves-effect waves-light m-b-20"><i class="md md-add"></i> Editar </a>
                                </div><!-- end col -->
                            </div>
                            <!-- end row -->

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="clearfix">
                                                <div class="float-left">
                                                    <img src="assets/images/logo_dark.png" alt="" height="30">
                                                </div>
                                                <div class="float-right">
                                                    <h3 class="m-0">Proforma</h3>
                                                </div>
                                            </div>


                                            <div class="row">
                                                <div class="col-6">
                                                    <div class="float-left m-t-30">
                                                        <p><b>Hola, ${cliente.nombre}</b></p>
                                                        <p class="text-muted">Gracias por preferir nuestros productos. Nuestra empresa te ofrece la mejor calidad, soporte,
                                                            celeridad y puntualidad en las operaciones. </p>
                                                    </div>

                                                </div><!-- end col -->
                                                <div class="col-sm-3 offset-sm-3 col-4 offset-2">
                                                    <div class="m-t-30 float-right">
                                                        <p><small><strong>Emisión: </strong></small> <fmt:formatDate value="${cotizacion.emision}" pattern="E dd, MMM yyyy"/></p>
                                                        <p><small><strong>Estado: </strong></small> <span class="badge badge-success">Activo</span></p>
                                                        <p><small><strong>Código: </strong></small> #${cotizacion.codigo} </p>
                                                    </div>
                                                </div><!-- end col -->
                                            </div>
                                            <!-- end row -->

                                            <div class="row m-t-30">
                                                <div class="col-6">
                                                    <h5>Facturación</h5>

                                                    <address class="line-h-24">
                                                        RS: ${cliente.razon_social}<br>
                                                        NIT: ${cliente.nit}<br>
                                                        ${cliente.direccion}<br>
                                                        <abbr title="Celular">Cel:</abbr> (591) ${cliente.celular} 
                                                    </address>

                                                </div>

                                                <div class="col-6">
                                                    <h5>Dirección de entrega</h5>

                                                    <address class="line-h-24">
                                                        ${cliente.nombre} ${cliente.apellido}<br>
                                                        ${cliente.direccion}<br>
                                                        <br>
                                                        <abbr title="Celular">Cel:</abbr> (591) ${cliente.celular} 
                                                    </address>

                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="table-responsive">
                                                        <table class="table m-t-30">
                                                            <thead>
                                                                <tr>
                                                                    <th>#</th>
                                                                    <th>Item</th>
                                                                    <th>Cantidad</th>
                                                                    <th>P. Unitario</th>
                                                                    <th class="text-right">Total Bs.</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <c:set var="evenCount" value="1" /> 
                                                                <c:forEach var="d" items="${quotedetail}" varStatus="i">
                                                                    <tr>
                                                                        <td> ${evenCount} </td>
                                                                        <td> ${d.descripcion} <br/> 
                                                                            <small>${d.codigo} | ${d.unidad}</small> 
                                                                        </td>
                                                                        <td> <fmt:formatNumber value="${d.cantidad}" pattern="#,0"/> </td>
                                                                        <td> <fmt:formatNumber value="${d.precio_final}" pattern="#,##0.00"/> </td>
                                                                        <td class="text-right"> <fmt:formatNumber value="${d.precio_final * d.cantidad}" pattern="#,##0.00"/>  </td> 
                                                                    </tr>
                                                                    <c:set var="evenCount" value="${evenCount+1}" />
                                                                </c:forEach>
                                                                <c:forEach var="d" items="${quoteservicedetail}">
                                                                    <tr>
                                                                        <td> ${evenCount} </td>
                                                                        <td> ${d.detalle} </td>
                                                                        <td> <fmt:formatNumber value="${d.cantidad}" pattern="#,0"/>  </td>
                                                                        <td> <fmt:formatNumber value="${d.precio_final}" pattern="#,##0.00"/> </td>
                                                                        <td class="text-right"> <fmt:formatNumber value="${d.precio_final * d.cantidad}" pattern="#,##0.00"/>  </td> 
                                                                    </tr>
                                                                    <c:set var="evenCount" value="${evenCount+1}" />
                                                                </c:forEach>    
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-6">
                                                    <div class="clearfix p-t-50">
                                                        <h5 class="text-muted">Notas:</h5>
                                                        <small>
                                                            ${cotizacion.nota}
                                                        </small>
                                                    </div>

                                                </div>
                                                <div class="col-md-3 col-6 offset-md-3">
                                                    <div class="float-right">
                                                        <p><b>Productos:</b> <fmt:formatNumber value="${cotizacion.total}" pattern="#,##0.00"/></p>
                                                        <p><b>Servicios:</b> <fmt:formatNumber value="${cotizacion.total_servicios}" pattern="#,##0.00"/> </p>
                                                        <h3> Bs. <fmt:formatNumber value="${cotizacion.total + cotizacion.total_servicios}" pattern="#,##0.00"/> </h3>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>

                                            <div class="d-print-none m-t-30 m-b-30">
                                                <div class="text-right">
                                                    <a href="javascript:window.print()" class="btn btn-primary waves-effect waves-light"><i class="fa fa-print m-r-5"></i> Imprimir </a>
                                                    <a href="<c:url value="/empresa/cotizacion?id=${cotizacion.cotizacion_id}&pdf=true"/>" class="btn btn-info waves-effect waves-light"><i class="fa fa-file-pdf-o m-r-5"></i> PDF </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                            </div>
                            <!-- end row -->

                        </c:if>    

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
        <div id="addservicio" class="modal fade" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="addproductoLabel" aria-hidden="true" style="display: none;">    
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title mt-0">Agregar</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="addservice" method="post">
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="control-label">Detalle</label>
                                        <input type="text" name="detalle" class="form-control" required>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="control-label">Cantidad</label>
                                        <input type="number" name="cantidad" class="form-control" step="0.10" required>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="control-label">Precio unitario</label>
                                        <input type="number" name="precio_final" class="form-control" step="0.10" required>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="control-label">Moneda</label>
                                        <input type="text" class="form-control" value="Bolivianos" disabled>
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
                            <input type="hidden" name="qid" value="${cotizacion.cotizacion_id}"> 
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
                    <form action="additem" method="post">
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-8">
                                    <div class="form-group">
                                        <label for="field-3" class="control-label">Producto</label>
                                        <select name="pid" class="form-control">
                                            <c:forEach var="c" items="${productos}">
                                                <option value="${c.producto_id}">${c.descripcion} (${c.unidad})</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="field-1" class="control-label">Cantidad</label>
                                        <input type="number" class="form-control" id="field-1" name="cantidad" required>
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
                            <input type="hidden" name="qid" value="${cotizacion.cotizacion_id}">
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
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <script src="/metronic/theme/assets/global/plugins/jcrop/js/jquery.color.js" type="text/javascript"></script>
        <script src="/metronic/theme/assets/global/plugins/jcrop/js/jquery.Jcrop.min.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL PLUGINS -->

        <script type="text/javascript">
            var FormImageCrop = function () {
                var demo6 = function () {
                    var api;

                    $('#demo6').Jcrop({
                        // start off with jcrop-light class
                        bgOpacity: 0.5,
                        bgColor: 'white',
                        addClass: 'jcrop-light'
                    }, function () {
                        api = this;
                        api.setSelect([0, 0, 250, 250]);
                        api.setOptions({aspectRatio: 0, bgFade: true, allowResize: true, bgColor: 'black', bgOpacity: 0.4});
                        api.ui.selection.addClass('jcrop-selection');
                    });

                    $('#buttonbar').on('click', 'button', function (e) {
                        var $t = $(this), $g = $t.closest('.btn-group');
                        $g.find('button.active').removeClass('active');
                        $t.addClass('active');
                        $g.find('[data-setclass]').each(function () {
                            var $th = $(this), c = $th.data('setclass'),
                                    a = $th.hasClass('active');
                            if (a) {
                                api.ui.holder.addClass(c);
                                switch (c) {
                                    case 'jcrop-light':
                                        api.setOptions({bgColor: 'white', bgOpacity: 0.5});
                                        break;

                                    case 'jcrop-dark':
                                        api.setOptions({bgColor: 'black', bgOpacity: 0.4});
                                        break;

                                    case 'jcrop-normal':
                                        api.setOptions({
                                            bgColor: $.Jcrop.defaults.bgColor,
                                            bgOpacity: $.Jcrop.defaults.bgOpacity
                                        });
                                        break;
                                }
                            } else
                                api.ui.holder.removeClass(c);
                        });
                    });

                    $("#cordsform").submit(function (form) {
                        //alert("Submitted");
                        //console.log(api.tellSelect());
                        //console.log(api.getBounds());
                        var cords = api.tellSelect();
                        cords.bx = Math.trunc(api.getBounds()[0]);
                        cords.by = Math.trunc(api.getBounds()[1]);

                        $.post("<c:url value="/empresa/selectimage"/>", cords,
                                function (data, status) {
                                    //alert("Data: " + data + "\nStatus: " + status);
                                    var d = new Date();
                                    $('#selected-img').modal('toggle');
                                    $("#sel_image").attr("src", "<c:url value="/account/getselected"/>?t=" + d.getTime());
                                });

                        return false;
                    });
                }

                var handleResponsive = function () {
                    if ($(window).width() <= 1024 && $(window).width() >= 678) {
                        $('.responsive-1024').each(function () {
                            $(this).attr("data-class", $(this).attr("class"));
                            $(this).attr("class", 'responsive-1024 col-md-12');
                        });
                    } else {
                        $('.responsive-1024').each(function () {
                            if ($(this).attr("data-class")) {
                                $(this).attr("class", $(this).attr("data-class"));
                                $(this).removeAttr("data-class");
                            }
                        });
                    }
                }

                return {
                    //main function to initiate the module
                    init: function () {
                        if (!jQuery().Jcrop) {
                            return;
                        }

                        //handleResponsive();
                        demo6();
                    }
                };
            }();

            jQuery(document).ready(function () {
                FormImageCrop.init();
            });
        </script>
    </body>
</html>