<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <!-- ========== Left Sidebar Start ========== -->
            <div class="left side-menu">
                <div class="slimscroll-menu" id="remove-scroll">

                    <!--- Sidemenu -->
                    <div id="sidebar-menu">
                        <!-- Left Menu Start -->
                        <ul class="metismenu list-unstyled" id="side-menu">

                            <li class="menu-title">Administrador</li>

                            <li>
                                <a href="<c:url value="/empresa/index"/>"><i class="fi-air-play"></i><span class="badge badge-pill badge-success float-right">1</span><span>Dashboard</span></a>
                            </li>
                            
                            <li>
                                <a href="javascript: void(0);"><i class="fi-box"></i><span>Donaciones</span> <span class="menu-arrow"></span></a>
                                <ul class="nav-second-level nav" aria-expanded="false">
                                    <li><a href="<c:url value="/empresa/donations"/>">Consultar</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="javascript: void(0);"><i class="fi-box"></i><span>Solicitudes</span> <span class="menu-arrow"></span></a>
                                <ul class="nav-second-level nav" aria-expanded="false">
                                    <li><a href="<c:url value="/empresa/solicitudes"/>">Consultar</a></li>
                                </ul>
                            </li>
                            
                            <li>
                                <a href="javascript: void(0);"><i class="fi-tag"></i><span>Productos</span> <span class="menu-arrow"></span></a>
                                <ul class="nav-second-level nav" aria-expanded="false">                                    
                                    <li><a href="<c:url value="/empresa/productos"/>">Consultar</a></li>
                                    <li><a href="<c:url value="/empresa/producto"/>">Registro</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="javascript: void(0);"><i class="fi-tag"></i><span>Inventario</span> <span class="menu-arrow"></span></a>
                                <ul class="nav-second-level nav" aria-expanded="false">                                    
                                    <li><a href="<c:url value="/empresa/inventario"/>">Consultar</a></li>
                                </ul>
                            </li>

                            <li>
                                <a href="javascript: void(0);"><i class="fi-cog"></i><span>Usuarios</span> <span class="menu-arrow"></span></a>
                                <ul class="nav-second-level nav" aria-expanded="false">
                                    <li><a href="<c:url value="/empresa/usuarios"/>">Consultar</a></li>
                                    <li><a href="<c:url value="/empresa/usuario"/>">Registro</a></li>
                                </ul>
                            </li>
                        </ul>

                    </div>
                    <!-- Sidebar -->
                    <div class="clearfix"></div>

                </div>
                <!-- Sidebar -left -->

            </div>
            <!-- Left Sidebar End -->