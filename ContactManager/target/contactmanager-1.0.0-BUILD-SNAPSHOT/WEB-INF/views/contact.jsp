<%@ page language="java" contentType="text/html; charset=utf8"
	pageEncoding="utf8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@page session="true"%>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf8">
	<title><spring:message code="label.title" /></title>
</head>
<body>


<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<p class="navbar-text">   Менеджер контактов</p>
		</div>
		<ul class="nav navbar-nav">
			<li class="active"><a href="/home">Домой</a></li>
			<li><a href="/index">Все контакты</a></li>
		</ul>


		<c:if test="${pageContext.request.userPrincipal.name != null}">

			<ul class="nav navbar-nav navbar-right">
				<p class="navbar-text">   Вы вошли как: ${pageContext.request.userPrincipal.name} </p>
				<a class="btn btn-danger navbar-btn" href="<c:url value="/logout" />">Выйти</a>
			</ul>
		</c:if>

	</div>
</nav>




<h3><spring:message code="label.contacts" /></h3>
<c:if test="${!empty contactList}">

	<table style="width:1000px " class="data table table-bordered table-hover table-striped table-condensed">
		<tr>

			<th class="success"><spring:message code="label.user" /></th>
			<th><spring:message code="label.firstname" /></th>
			<th><spring:message code="label.email" /></th>
			<th><spring:message code="label.telephone" /></th>
			<th>&nbsp;</th>
		</tr>
		<c:forEach items="${contactList}" var="contact">
			<tr>


				<td class="active">${contact.user}</td>
				<td>${contact.lastname}, ${contact.firstname}</td>
				<td>${contact.email}</td>
				<td>${contact.telephone}</td>
				<td><a href="deleteAdmin/${contact.id}"><spring:message code="label.delete" /></a></td>
			</tr>
		</c:forEach>
	</table>

</c:if>

</body>
</html>