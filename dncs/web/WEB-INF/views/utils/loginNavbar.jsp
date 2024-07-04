<%-- 
    Document   : loginNavbar
    Created on : jan 7, 2019, 3:27:56 PM
    Author     : John Castillo V. john.gnu@gmail.com
--%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
            <nav class="navbar navbar-top navbar-horizontal navbar-expand-md navbar-dark">
                <div class="container px-4">
                    <a class="navbar-brand" href="<c:url value="/"/>">
                        <img src="<c:url value="/img/white.png"/>" />
                    </a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-collapse-main" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbar-collapse-main">
                        <!-- Collapse header -->
                        <div class="navbar-collapse-header d-md-none">
                            <div class="row">
                                <div class="col-6 collapse-brand">
                                    <a href="<c:url value="/"/>">
                                        <img src="<c:url value="/img/blue.png"/>" />
                                    </a>
                                </div>
                                <div class="col-6 collapse-close">
                                    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbar-collapse-main" aria-controls="sidenav-main" aria-expanded="false" aria-label="Toggle sidenav">
                                        <span></span>
                                        <span></span>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <!-- Navbar items -->
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item">
                                <a class="nav-link nav-link-icon" href="<c:url value="/register"/>">
                                    <i class="ni ni-circle-08"></i>
                                    <span class="nav-link-inner--text">Regístrate</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link nav-link-icon" href="<c:url value="/inscripcion/verdatos"/>">
                                    <i class="ni ni-key-25"></i>
                                    <span class="nav-link-inner--text">Mis Datos</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link nav-link-icon" href="<c:url value="/admin"/>">
                                    <i class="ni ni-lock-circle-open"></i>
                                    <span class="nav-link-inner--text">Iniciar Sesión</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>  