<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    

<!DOCTYPE>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	</head>
	<body>
		<jsp:include page="../fragments/header.jsp"></jsp:include>
		<h3 class="text-center">Utenti</h3>
		<table class="table">
			<thead>
				<tr>
					<th>Codice</th>
					<th>Nome</th>
					<th>Cognome</th>
					<th>Email</th>
					<th>Telefono</th>
				</tr>
			</thead>
			<tbody>
				
				<c:forEach var="user" items="${users}">
					<tr>
      					<th scope="row">${user.id}</th>
      					<td>${user.nome}</td>
      					<td>${user.cognome}</td>
      					<td>${user.email}</td>
						<td>${user.telefono}</td>
						<td><a href="deleteUser?id=${user.id}" class="btn btn-primary">Delete</a> <a href="pageUpdateUser?id=${user.id}" class="btn btn-primary">Update</a></td>
     				</tr>
				</c:forEach>
			</tbody>
		</table>
	</body>
</html>