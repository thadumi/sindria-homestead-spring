<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE>
	<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Utenti</title>
	</head>
	<body>
		<jsp:include page="../fragments/header.jsp"></jsp:include>
		
		<h3 class="text-center">Cerca Utente</h3>
		<form class="form-horizontal" action="findUserByID" method="POST">
			<fieldset>
				<div class="form-group required">
               		<label class="col-md-4 control-label">Codice</label>
               		<div class="col-md-4">
                   		<input id="codice" name="id" type="number" placeholder="Inserisci codice" class="form-control input-md" required="required"></input>
               		</div>
           		</div>
           		<div class="form-group">
       				<label class="col-md-4 control-label" for="singlebutton"></label>
       				<div class="col-md-4">
           				<button id="submitInsertBook" name="saveBookButton" class="btn btn-primary">Cerca Utente</button>
       				</div>
    			</div>
            </fieldset>
		</form>
	</body>
</html>