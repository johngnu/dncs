<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <!-- Top Bar Start -->
            <div class="topbar">

                <!-- LOGO -->
                <div class="topbar-left">
                    <!--<a href="<c:url value="/"/>" class="logo"><span>Even<span>tos</span></span><i class="mdi mdi-layers"></i></a>-->
                    <!-- Image logo -->
                    <a href="<c:url value="/"/>" class="logo">
                        <span>
                            <img src="<c:url value="/empresa/assets/images/logo.png"/>" alt="Eventos" height="20">
                        </span>
                        <i>
                            <img src="<c:url value="/empresa/assets/images/logo.png"/>" alt="Eventos" height="20">
                        </i>
                    </a>
                </div>

                <!-- Button mobile view to collapse sidebar menu -->
                <div class="navbar navbar-default" role="navigation">
                    <div class="container-fluid">

                        <!-- Navbar-left -->
                        <ul class="nav navbar-left nav">
                            <li>
                                <button type="button" class="button-menu-mobile open-left waves-effect">
                                    <i class="dripicons-menu"></i>
                                </button>
                            </li>
                        </ul>

                        <!-- Right(Notification) -->
                        <ul class="nav navbar-right list-inline">
                            <li class="d-none d-sm-block list-inline-item">
                                <form role="search" class="app-search">
                                    <input type="text" placeholder="Buscar..."
                                           class="form-control">
                                    <a href=""><i class="fa fa-search"></i></a>
                                </form>
                            </li>
                            <li class="list-inline-item">
                                <div class="dropdown">
                                    <a href="#" class="right-menu-item dropdown-toggle" data-toggle="dropdown">
                                        <i class="dripicons-bell"></i>
                                        <span class="badge badge-pill badge-pink">4</span>
                                    </a>

                                    <ul class="dropdown-menu dropdown-menu-right dropdown-lg user-list notify-list">
                                        <li class="list-group notification-list m-b-0">
                                            <div class="slimscroll">
                                                <!-- list item-->
                                                <a href="javascript:void(0);" class="list-group-item">
                                                    <div class="media">
                                                        <div class="media-left p-r-10">
                                                            <em class="fa fa-diamond bg-primary"></em>
                                                        </div>
                                                        <div class="media-body">
                                                            <h5 class="media-heading">A new order has been placed A new order has been placed</h5>
                                                            <p class="m-0">
                                                                There are new settings available
                                                            </p>
                                                        </div>
                                                    </div>
                                                </a>

                                                <!-- list item-->
                                                <a href="javascript:void(0);" class="list-group-item">
                                                    <div class="media">
                                                        <div class="media-left p-r-10">
                                                            <em class="fa fa-cog bg-warning"></em>
                                                        </div>
                                                        <div class="media-body">
                                                            <h5 class="media-heading">New settings</h5>
                                                            <p class="m-0">
                                                                There are new settings available
                                                            </p>
                                                        </div>
                                                    </div>
                                                </a>

                                                <!-- list item-->
                                                <a href="javascript:void(0);" class="list-group-item">
                                                    <div class="media">
                                                        <div class="media-left p-r-10">
                                                            <em class="fa fa-bell-o bg-custom"></em>
                                                        </div>
                                                        <div class="media-body">
                                                            <h5 class="media-heading">Updates</h5>
                                                            <p class="m-0">
                                                                There are <span class="text-primary font-600">2</span> new updates available
                                                            </p>
                                                        </div>
                                                    </div>
                                                </a>

                                                <!-- list item-->
                                                <a href="javascript:void(0);" class="list-group-item">
                                                    <div class="media">
                                                        <div class="media-left p-r-10">
                                                            <em class="fa fa-user-plus bg-danger"></em>
                                                        </div>
                                                        <div class="media-body">
                                                            <h5 class="media-heading">New user registered</h5>
                                                            <p class="m-0">
                                                                You have 10 unread messages
                                                            </p>
                                                        </div>
                                                    </div>
                                                </a>

                                                <!-- list item-->
                                                <a href="javascript:void(0);" class="list-group-item">
                                                    <div class="media">
                                                        <div class="media-left p-r-10">
                                                            <em class="fa fa-diamond bg-primary"></em>
                                                        </div>
                                                        <div class="media-body">
                                                            <h5 class="media-heading">A new order has been placed A new order has been placed</h5>
                                                            <p class="m-0">
                                                                There are new settings available
                                                            </p>
                                                        </div>
                                                    </div>
                                                </a>

                                                <!-- list item-->
                                                <a href="javascript:void(0);" class="list-group-item">
                                                    <div class="media">
                                                        <div class="media-left p-r-10">
                                                            <em class="fa fa-cog bg-warning"></em>
                                                        </div>
                                                        <div class="media-body">
                                                            <h5 class="media-heading">New settings</h5>
                                                            <p class="m-0">
                                                                There are new settings available
                                                            </p>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </li>
                                        <!-- end notification list -->
                                    </ul>
                                </div>
                            </li>

                            <li class="dropdown user-box list-inline-item">
                                <a href="" class="dropdown-toggle waves-effect user-link" data-toggle="dropdown" aria-expanded="true">
                                    <img src="assets/images/users/avatar-1.jpg" alt="user-img" class="rounded-circle user-img">
                                </a>

                                <ul class="dropdown-menu dropdown-menu-right arrow-dropdown-menu arrow-menu-right user-list notify-list">
                                    <li><a href="javascript:void(0)" class="dropdown-item">Perfil</a></li>
                                    <li><a href="javascript:void(0)" class="dropdown-item"><span class="badge badge-pill badge-info float-right">4</span>Opciones</a></li>
                                    <li><a href="javascript:void(0)" class="dropdown-item">Bloquear</a></li>
                                    <li class="dropdown-divider"></li>
                                    <li><a href="<c:url value="/logout"/>" class="dropdown-item">Salir</a></li>
                                </ul>
                            </li>

                        </ul> <!-- end navbar-right -->

                    </div><!-- end container-fluid -->
                </div><!-- end navbar -->
            </div>
            <!-- Top Bar End -->