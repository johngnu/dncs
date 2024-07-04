<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        <link rel="shortcut icon" type="image/png" href="<c:url value="/img/cloud-logo.png"/>"/>
        <title>Ingresar</title>

        <!-- Bootstrap core CSS     -->
        <link href="<c:url value="/css/sitmax/bootstrap.min.css"/>" media="all" rel="stylesheet" type="text/css" />
        <!-- Main Style CSS         -->
        <link href="<c:url value="/css/sitmax/style.css"/>" media="all" rel="stylesheet" type="text/css" />
        <!-- Fonts and icons        -->
        <link href="<c:url value="/css/font-awesome/css/font-awesome.min.css"/>" rel="stylesheet" type="text/css" />
    </head>
    <body class="login2">
        <div class="login-wrapper">
            <a href="<c:url value="/index"/>"><img width="350" src="<c:url value="/img/password.jpg"/>" /></a>
            <form action="<c:url value="/j_spring_security_check"/>" method="post" id="__login_fomr"> 
                <div class="form-group">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="icon-user"></i></span><input value="admin@dncs.com" class="form-control"  autocomplete="off" name="j_username" placeholder="Nombre de usuario o email" type="text" value="${client.email}">
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="icon-lock"></i></span><input value="2648" class="form-control" name="j_password" placeholder="Contraseña" type="password">
                    </div>
                </div>
                <input class="btn btn-lg btn-primary btn-block" type="submit" value="Iniciar sesión">
            </form>

            <c:if test="${!empty key}">
                <div class="alert alert-danger">
                    <button class="close" data-dismiss="alert" type="button">&times;</button>Usuario o clave incorrectos.  Intente nuevamente o comuníquese con el administrador del sistema.
                </div>
            </c:if>

            <c:if test="${empty key}">
                <div class="alert alert-warning">
                    <button class="close" data-dismiss="alert" type="button">&times;</button>Uso exclusivo de usuarios registrados.
                </div>
            </c:if>
            <div class="text-center">
                <a href="<c:url value="/index"/>">
                    Inicio
                </a> |
                <a href="<c:url value="/index"/>">
                    ¿Olvido como ingresar?
                </a>
            </div>
        </div>

    </body>
    <!--   Core JS Files   -->
    <script src="<c:url value="/assets/js/jquery-3.2.1.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/assets/js/bootstrap.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/assets/js/material.min.js"/>" type="text/javascript"></script>
    <!--  Charts Plugin -->
    <script src="<c:url value="/assets/js/chartist.min.js"/>"></script>
    <!--  Dynamic Elements plugin -->
    <script src="<c:url value="/assets/js/arrive.min.js"/>"></script>
    <!--  PerfectScrollbar Library -->
    <script src="<c:url value="/assets/js/perfect-scrollbar.jquery.min.js"/>"></script>
    <!--  Notifications Plugin    -->
    <script src="<c:url value="/assets/js/bootstrap-notify.js"/>"></script>
    <!-- Material Dashboard javascript methods -->
    <script src="<c:url value="/assets/js/material-dashboard.js?v=1.2.0"/>"></script>
    <!-- Material Dashboard DEMO methods, don't include it in your project! -->
    <script src="<c:url value="/assets/js/demo.js"/>"></script>
    
    <script src="<c:url value="/assets/js/jquery.validate.js"/>"></script>
    <!-- Local scripts code --> 
    <script type="text/javascript">
        $(document).ready(function () {
            $("#__login_fomr").validate({
                rules: {
                    j_username: {
                        required: true
                    },
                    j_password: {
                        required: true
                    }
                }
            });
        });
    </script>  
</html>