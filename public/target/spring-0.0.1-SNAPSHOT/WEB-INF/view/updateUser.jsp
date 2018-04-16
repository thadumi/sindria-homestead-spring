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
		
		<h3 class="text-center">Aggiorna Utente</h3>
		<form:form class="form-horizontal" action="updateUser" method="POST" modelAttribute="user">
			<fieldset>
					<div class="form-group required">
                		<label class="col-md-4 control-label">Codice</label>
                		<div class="col-md-4">
                    		<form:input id="codice" path="id" name="codice" type="text" placeholder="Inserisci codice" class="form-control input-md" value="${user.id}" required="required"></form:input>
                		</div>
            		</div>
  					<div class="form-group required">
                		<label class="col-md-4 control-label">Nome</label>
                		<div class="col-md-4">
                    		<form:input id="nome" path="nome" name="nome" type="text" placeholder="Inserisci nome" class="form-control input-md" value="${user.nome}" required="required"></form:input>
                		</div>
            		</div>
            		<div class="form-group required">
                		<label class="col-md-4 control-label">Cognome</label>
                		<div class="col-md-4">
                    		<form:input id="cognome" path="cognome" name="cognome" type="text" placeholder="Inserisci cognome" class="form-control input-md" value="${user.cognome}" required="required"></form:input>
                		</div>
            		</div>
            		<div class="form-group required">
                		<label class="col-md-4 control-label">Email</label>
                		<div class="col-md-4">
                    		<form:input id="email" path="email" name="email" type="text" placeholder="Inserisci email" class="form-control input-md" value="${user.email}" required="required"></form:input>
                		</div>
            		</div>
            		<div class="form-group required">
                		<label class="col-md-4 control-label">Telefono</label>
                		<div class="col-md-4">
                    		<form:input id="telefono" path="telefono" name="telefono" type="text" placeholder="Inserisci telefono" class="form-control input-md" value="${user.telefono}" required="required"></form:input><br>
                		</div>
            		</div>
            		
            		<div class="form-group">
        				<label class="col-md-4 control-label" for="singlebutton"></label>
        				<div class="col-md-4">
            				<button id="submitInsertBook" name="saveBookButton" class="btn btn-primary">Aggiorna Utente</button>
        				</div>
    				</div>
            </fieldset>
		</form:form>
		
	</body>
</html>