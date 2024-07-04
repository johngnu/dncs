<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        <link rel="shortcut icon" type="image/png" href="<c:url value="/img/logo.png"/>"/>
        <title>Registro</title>

        <!-- Bootstrap core CSS     -->
        <link href="<c:url value="/web/css/bootstrap.min.css"/>" rel="stylesheet"/>
        <link href="<c:url value="/web/css/fileinput.min.css"/>" rel="stylesheet"/>

        <!-- Animation library for notifications   -->
        <link href="<c:url value="/web/css/animate.min.css"/>" rel="stylesheet"/>

        <!--  Light Bootstrap Table core CSS    -->
        <link href="<c:url value="/web/css/light-bootstrap-dashboard.css"/>" rel="stylesheet"/>

        <!--  CSS for Demo Purpose, don't include it in your project     -->
        <link href="<c:url value="/web/css/demo.css"/>" rel="stylesheet" />

        <!--     Fonts and icons     -->
        <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
        <link href="<c:url value="/web/css/pe-icon-7-stroke.css"/>" rel="stylesheet" />
        <style type="text/css">
            .main-panel {
                background: rgba(203, 203, 210, 0.15);
                position: relative;
                z-index: 2;
                float: right;
                width: 100%;
                min-height: 100%;
            }
        </style>
    </head>

    <body>
        <div class="wrapper">
            <div class="main-panel">
                <nav class="navbar navbar-default navbar-fixed">
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation-example-2">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a class="navbar-brand" href="#">Registro</a>
                        </div>
                        <div class="collapse navbar-collapse">
                            <ul class="nav navbar-nav navbar-left">
                                <li>
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                        <i class="pe-7s-note2"></i>
                                    </a>
                                </li>
                            </ul>

                            <ul class="nav navbar-nav navbar-right">
                                <li>
                                    <a href="<c:url value="/index"/>">
                                        Salir
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <c:if test="${empty usr}">

                    <div class="content">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-8">
                                    <div class="card">
                                        <div class="header">
                                            <h4 class="title">Formulario único de registro</h4>
                                            <p class="text-muted">Formulario de registro para personas o organizaciones Donantes o Receptores</p>
                                            <a href="<c:url value="/register?usr=don"/>" class="btn btn-success btn-fill">Donante</a>
                                            <a href="<c:url value="/register?usr=rep"/>" class="btn btn-primary btn-fill">Receptor</a>
                                        </div>
                                        <div class="content">

                                        </div>       
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </c:if>       
                <c:if test="${!empty usr}">

                    <div class="content">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-8">
                                    <div class="card">
                                        <div class="header">
                                            <h4 class="title">Registro de <c:if test="${usr == 'don'}">Donantes</c:if><c:if test="${usr == 'rep'}">Receptores</c:if></h4>                                                
                                            <a href="<c:url value="/register"/>" class="btn btn-default btn-fill"><i class="pe-7s-back"></i> Cambiar</a>
                                            <a href="<c:url value="/register?usr=${usr}&tipo=per"/>" class="btn btn-success btn-fill">Persona natural</a>
                                            <a href="<c:url value="/register?usr=${usr}&tipo=org"/>" class="btn btn-primary btn-fill">Persona juridica</a>
                                        </div>
                                        <div class="content">
                                            <c:if test="${!empty tipo}">
                                                <c:if test="${tipo == 'per'}">
                                                    <form action="<c:url value="/register/saveform"/>" method="post" id="_register_form">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label>Nombre</label>
                                                                    <input name="nombre" type="text" class="form-control" placeholder="Nombres">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label>Apellido</label>
                                                                    <input name="apellido" type="text" class="form-control" placeholder="Apellidos">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label>CI</label>
                                                                    <input name="ci" type="text" class="form-control" placeholder="Cédula de identidad">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label>Fec. nacimiento</label>
                                                                    <input name="fec_nacimiento" type="text" class="form-control" placeholder="dd/mm/yyyy">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label>Email / Correo</label>
                                                                    <input name="email" type="email" class="form-control" placeholder="ej: sunombre@dominio.com">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label>Celular</label>
                                                                    <input name="celular" type="number" class="form-control" placeholder="">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label>Sexo</label>
                                                                    <select name="sexo" class="form-control">
                                                                        <option value="M">Masculino</option>
                                                                        <option value="F">Femenino</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label>Dirección</label>
                                                                    <input name="direccion" type="text" class="form-control" placeholder="">
                                                                </div>
                                                            </div>
                                                        </div>                                                        
                                                        <input type="hidden" name="tipo" value="per">
                                                        <input type="hidden" name="usr" value="${usr}">
                                                        <a href="<c:url value="/index"/>" class="btn btn-default btn-fill pull-left">Cancelar</a>
                                                        <button type="submit" class="btn btn-success btn-fill pull-right">Guardar</button>
                                                        <div class="clearfix"></div>
                                                    </form>
                                                </c:if>
                                                <c:if test="${tipo == 'org'}">
                                                    <form action="<c:url value="/register/saveform"/>" method="post" id="_register_form">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <div class="form-group">
                                                                    <label>Nombre o razón social</label>
                                                                    <input name="nombre" type="text" class="form-control" placeholder="Nombre de la organización">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label>NIT</label>
                                                                    <input name="nit" type="text" class="form-control" placeholder="">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label>Dirección</label>
                                                                    <input name="direccion" type="text" class="form-control" placeholder="">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label>Email / Correo</label>
                                                                    <input name="email" type="email" class="form-control" placeholder="ej: sunombre@dominio.com">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label>Celular</label>
                                                                    <input name="celular" type="number" class="form-control" placeholder="">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <div class="form-group">
                                                                    <label>Nombre del responsable</label>
                                                                    <input name="responsable" type="text" class="form-control" placeholder="Nombre completo de la persona responsable">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <input type="hidden" name="tipo" value="org">
                                                        <input type="hidden" name="usr" value="${usr}">
                                                        <a href="<c:url value="/index"/>" class="btn btn-default btn-fill pull-left">Cancelar</a>                                                        
                                                        <button type="submit" class="btn btn-success btn-fill pull-right">Guardar</button>
                                                        <div class="clearfix"></div>
                                                    </form>
                                                </c:if>

                                                <hr>    
                                            </c:if>
                                        </div>       
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </c:if>
                <footer class="footer">
                    <div class="container-fluid">
                        <p class="copyright pull-right">
                            Copyright &copy;
                            <script>
                                document.write(new Date().getFullYear())
                            </script>
                            DNCS. All Rights Reserved
                        </p>
                    </div>
                </footer>
            </div>
        </div>

    </body>
    <!-- Core JS Files   -->
    <script src="<c:url value="/web/js/jquery-1.10.2.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/web/js/bootstrap.min.js"/>" type="text/javascript"></script>

    <!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->
    <script src="<c:url value="/web/js/demo.js"/>"></script>
    <script src="<c:url value="/js/jquery.validate.js"/>" type="text/javascript">
    </script>
    <!-- Local scripts code --> 
    <script type="text/javascript">
        $(document).ready(function () {
        <c:if test="${tipo == 'per'}">
            $("#_register_form").validate({
                rules: {
                    nombre: {
                        required: true
                    },
                    apellido: {
                        required: true
                    },
                    email: {
                        required: true
                    },
                    ci: {
                        required: true
                    },
                    celular: {
                        required: true
                    }
                }
            });
        </c:if>
            <c:if test="${tipo == 'org'}">
            $("#_register_form").validate({
                rules: {
                    nombre: {
                        required: true
                    },
                    nit: {
                        required: true
                    },
                    email: {
                        required: true
                    },
                    celular: {
                        required: true
                    },
                    responsable: {
                        required: true
                    }
                }
            });
        </c:if>
        });
    </script> 
</html>
