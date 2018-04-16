<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE>
	<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Utenti</title>
		
		<style type="text/css">
		
			#div2{
			    float:left;
			    clear: left;
			}
		
		</style>
	</head>
	<body>
		<jsp:include page="../fragments/header.jsp"></jsp:include>
		<div id="div1">
			<div id="div2">
				<a class="navbar-brand" href="registerUser">Registra Utente</a>
				<a class="navbar-brand" href="showAllUsers">Tutti gli utenti</a>
				<a class="navbar-brand" href="pageFindUser">Cerca Utente</a>
			</div>
		</div>
	</body>
</html>