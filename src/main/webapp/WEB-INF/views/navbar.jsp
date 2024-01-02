<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<head>
<!-- Iconos Bootstrap -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<header>

	<!-- Navbar del sitio -->
	<nav class="navbar bg-success  navbar-expand-lg bg-body-tertiary "
		data-bs-theme="dark">
		<div class="container-fluid">
			<!-- Logo y nombre del sitio -->
			<a class="navbar-brand" href="#"> <i class="bi bi-fan"></i> <span
				class="text-ligth">Prevent</span>
			</a>
			<!-- boton del menu  -->
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#menu"
				aria-controls="navbarNavAltMarkup" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<!-- elementos del menu colapsable -->
			<div class="collapse navbar-collapse" id="menu">
				<ul class="navbar-nav me-auto">
					<li class="nav-item ms-2"><a
						class="nav-link ${navItem == 'Inicio' ? 'active' : ''}"
						href="Inicio"> <i class="bi bi-house"></i> Inicio
					</a></li>
					<sec:authorize access="hasAuthority('Cliente')">
						<li class="nav-item ms-2"><a
							class="nav-link ${navItem == 'Contacto' ? 'active' : ''}"
							href="Contacto"> <i class="bi bi-envelope-at"></i> Contacto
						</a></li>
					</sec:authorize>
					 
					<sec:authorize access="hasAuthority('Administrativo')">
					    <!-- Men� para Administrativo -->
					    <li class="nav-item dropdown ms-2">
					        <a class="nav-link dropdown-toggle ${navItem == 'Crear' ? 'active' : ''}"
					           id="navbarDropdown" role="button" data-bs-toggle="dropdown" href="#">
					            <i class="bi bi-plus-circle"></i> Crear
					        </a>
					        <ul class="dropdown-menu bg-dark">
					            <li><a class="dropdown-item" href="crear-capacitacion"> <i class="bi bi-file-plus"></i> Crear Capacitaci�n</a></li>
					            <li><a class="dropdown-item" href="crear-usuario"> <i class="bi bi-file-plus"></i> Crear Usuario</a></li>
					            <li><a class="dropdown-item" href="crear-pago"> <i class="bi bi-file-plus"></i> Crear Pago</a></li>
					            <li><a class="dropdown-item" href="crear-visita"> <i class="bi bi-file-plus"></i> Crear Visita</a></li>
					            
					        </ul>
					    </li>
					</sec:authorize>
					<sec:authorize access="hasAuthority('Cliente')">
					    <!-- Men� para Cliente -->
						    <li class="nav-item ms-2">
						        <a class="nav-link" href="crear-capacitacion">
						            <i class="bi bi-file-plus"></i> Crear Capacitaci�n
						        </a>
						    </li>
						    <li class="nav-item ms-2">
						        <a class="nav-link" href="ListarCapacitaciones">
						            <i class="bi bi-files"></i> Listar Capacitaciones
						        </a>
						    </li>
					</sec:authorize>
					<sec:authorize access="hasAuthority('Profesional')">
					    <!-- Men� para Profesional -->
						    <li class="nav-link  ms-2">
						        <a class="dropdown-item" href="crear-visita"> <i class="bi bi-file-plus"></i> Crear Visita</a>
						    </li>
						    <li class="nav-link ms-2">
						        <a class="dropdown-item" href="ListadoVisitas"><i class="bi bi-list-check"></i> Listado Visitas</a>
						    </li>
					</sec:authorize>
					<!-- Menu Listar del Administrativo -->
					<sec:authorize access="hasAnyAuthority('Administrativo')">
					    <li class="nav-item dropdown ms-2">
					        <a class="nav-link dropdown-toggle ${navItem == 'Listar' ? 'active' : ''}"
					           id="navbarDropdown" role="button" data-bs-toggle="dropdown" href="#">
					           <i class="bi bi-card-list"></i> Listar
					        </a>
					        <ul class="dropdown-menu bg-dark">
					            <li>
					                <a class="dropdown-item" href="ListarCapacitaciones">
					                    <i class="bi bi-files"></i> Listar Capacitaciones
					                </a>
					            </li>
					            <li>
					                <a class="dropdown-item" href="ListadoUsuarios">
					                    <i class="bi bi-people"></i> Listar Usuarios
					                </a>
					            </li>
					            <li>
					                <a class="dropdown-item" href="lista-pagos">
					                    <i class="bi bi-credit-card"></i> Listar Pagos
					                </a>
					            </li>
					            <li>
					                <a class="dropdown-item" href="ListadoVisitas"> 
					                    <i class="bi bi-list-check"></i> Listado Visitas
					                </a>
					            </li>
					        </ul>
					    </li>
					</sec:authorize>
					<!-- Login si no ha iniciado sesi�n -->
					<sec:authorize access="!isAuthenticated()">
							<li class="nav-item flex-row flex-wrap text-light">
						    	<a class="nav-link " href="login">
							<i class="bi bi-box-arrow-in-left ms-2"></i> Login</a>
						</li>
					</sec:authorize>
				</ul>
				<sec:authorize access="isAuthenticated()">
					<ul class="navbar-nav flex-row flex-wrap text-light">
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle"
							id="navbarDropdown" role="button" data-bs-toggle="dropdown"  href="#">
								<i class="bi bi-person-circle"></i>   <sec:authentication property="principal.username" />
							</a>
						    <ul class="dropdown-menu dropdown-menu-end bg-dark">
						    	<li>
						    		<a class="dropdown-item"  role="button" data-bs-toggle="modal" data-bs-target="#logoutModal" href="#">
						    		<i class="bi bi-box-arrow-right"></i>   Cerrar Sesi�n</a>
						    	</li>
						    </ul>
						</li>
				    </ul>
			    </sec:authorize>
			</div>
		</div>
	</nav>
</header>
<!-- Modal de Cerrar Sesi�n -->
<div class="modal fade" id="logoutModal" tabindex="-1" aria-labelledby="logoutModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="logoutModalLabel">Confirmar Cierre de Sesi�n <i class="bi bi-box-arrow-right"></i></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                �Est�s seguro de que deseas cerrar sesi�n?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                <a href="logout" class="btn btn-secondary">Cerrar Sesi�n</a>
            </div>
        </div>
    </div>
</div>
