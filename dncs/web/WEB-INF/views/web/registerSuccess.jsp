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

                <div class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-8">
                                <div class="card">
                                    <div class="header">
                                        <h4 class="title">Activación de registro</h4>
                                    </div>
                                    <div class="content">
                                        <p class="category">
                                            Estimado(a) ${client.nombre} <br>
                                            Su registro ya se encuentra activado. Ahora puede ingresar a nuestra plataforma<br> con su correo:
                                            <strong>${client.email}</strong> y el código PIN: <strong>${client.pin}</strong>.
                                        </p>
                                        <hr>
                                        <button id="_next" class="btn btn-primary btn-fill center-block">Aceptar e ingresar</button>
                                        <div class="clearfix"></div>
                                    </div>        
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

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
            $("#_register_form").validate({
                rules: {
                    pin: {
                        required: true
                    }
                }
            });

            $('#_next').on('click', function (e) {
                location.href = "<c:url value="/account"/>";
            });
        });
    </script> 
</html>
