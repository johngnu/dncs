<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<!doctype html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        <!-- App favicon -->
        <link rel="shortcut icon" type="image/png" href="<c:url value="/img/favicon.png"/>" />
        
        <meta property="og:type" content="website" />
        <meta property="og:title" content="Plataforma de donaciones" />
        <meta property="og:description" content="Plataforma para el rastreo de donaciones" />
        <meta property="og:image" content="https://apps.icg.com.bo/dncs/img/logo.jpg" />
        
        <title>Donaciones 281</title>

        <!-- Bootstrap Core CSS -->
        <link href="<c:url value="/css/bootstrap.min.css"/>" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="<c:url value="/css/landing-page.css"/>" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="<c:url value="/font-awesome/css/font-awesome.min.css"/>" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>

    <body>
        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-fixed-top topnav" role="navigation">
            <div class="container topnav">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand topnav" href="">Inicio</a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="#about">A cerca de</a>
                        </li>
                        <li>
                            <a href="<c:url value="/account"/>">Ingresar</a>
                        </li>
                        <li>
                            <a href="<c:url value="/register"/>">Regístrate</a>
                        </li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container -->
        </nav>

        <!-- Header -->
        <a name="init"></a>
        <div class="intro-header">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="intro-message">
                            <!--Header logo-->
                            <h1>Donaciones 281</h1>
                            <h3>Plataforma Web</h3>
                            <hr class="intro-divider">
                            <ul class="list-inline intro-social-buttons">
                                <li>
                                    <a href="<c:url value="/account"/>" class="btn btn-success btn-lg"><span class="network-name">Ingresar</span></a>
                                </li>
                                <li>
                                    <a href="<c:url value="/register"/>" class="btn btn-default btn-lg"><span class="network-name">Regístrate</span></a>
                                </li>
                            </ul>
                            <!--Header logo-->    
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.container -->
        </div>
        <!-- /.intro-header -->

        <!-- Page Content -->
        <a name="about"></a>
        <div class="content-section-a">

            <div class="container">
                <div class="row">
                    <div class="col-lg-5 col-sm-6">
                        <hr class="section-heading-spacer">
                        <div class="clearfix"></div>
                        <h2 class="section-heading">Caracteristicas<br>Esta versión contiene:</h2>
                        <p class="lead"></p>
                        <ul class="lead">
                            <li>
                                <strong>Plataforma Web</strong><br>
                                Plataforma de administración de donaciones <srong>Organizaciones Beneficas, Voluntarios, Personas, Organizaciones receptores</srong>
                            </li>
                            <li>
                                <strong>Inventario</strong><br>
                                Siatema de Almacenes, Recepcion de productos y Entrega de solicitudes.
                                Contactos: info@dncs.com
                            </li>
                            <li>
                                <strong>Aplicación Móvil (Android)</strong><br>
                                Rastreo de donaciones, Voluntarios para recojo y entrega de donaciones.
                            </li>
                        </ul>
                    </div>
                    <div class="col-lg-5 col-lg-offset-2 col-sm-6">
                        <img class="img-responsive" src="img/dog.png" alt="">
                    </div>
                </div>

            </div>
            <!-- /.container -->

        </div>
        <!-- /.content-section-a -->

        <!-- Footer -->
        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <ul class="list-inline">     
                            <li>
                                <a href="#init">Inicio</a>
                            </li>
                            <li class="footer-menu-divider">&sdot;</li>
                            <li>
                                <a href="<c:url value="/account"/>">Ingresar</a>
                            </li>
                            <li class="footer-menu-divider">&sdot;</li>
                            <li>
                                <a href="<c:url value="/register"/>">Regístrate</a>
                            </li>
                        </ul>
                        <p class="copyright text-muted small">
                            &copy; 2024 
                            <a target="_blank" href="http://www.dncs.com" title="Acerca de DNCS">DNCS</a>
                        </p>
                    </div>
                </div>
            </div>
        </footer>

        <!-- jQuery -->
        <script src="<c:url value="/js/jquery.js"/>"></script>
        <!-- Bootstrap Core JavaScript -->
        <script src="<c:url value="/js/bootstrap.min.js"/>">
        </script>
        <!-- Local scripts code --> 
        <script type="text/javascript">
            $(document).ready(function () {
                $.post("<c:url value="/accesscontrol/log"/>", function (data, status) {});
            });
        </script> 
    </body>
</html>
