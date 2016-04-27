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

<br/>

<form:form method="post" action="add" commandName="contact">

    <table class="table table-bordered table-condensed table-hover">
        <tr >
            <td ><form:label path="firstname">
                <spring:message code="label.firstname" />
            </form:label></td>
            <td col-md-2><form:input path="firstname" /></td>
        </tr>
        <tr >
            <td class=><form:label path="lastname">
                <spring:message code="label.lastname" />
            </form:label></td>
            <td col-md-2><form:input path="lastname" /></td>
        </tr>
        <tr >
            <td class=><form:label path="email">
                <spring:message code="label.email" />
            </form:label></td>
            <td col-md-2><form:input path="email" /></td>
        </tr>

        <tr >
            <td ><form:label path="telephone">
                <spring:message code="label.telephone" />
            </form:label></td>
            <td ><form:input path="telephone" /></td>
        </tr>

        <tr>
            <td colspan="2"><input class="btn btn-success" type="submit"
                                   value="<spring:message code="label.addcontact"/>" /></td>
        </tr>


    </table>

</form:form>

<h3><spring:message code="label.contacts" /></h3>
<c:if test="${!empty list}">
    <table class="data table table-bordered table-hover table-striped table-condensed">
        <tr>
            <th><spring:message code="label.firstname" /></th>
            <th><spring:message code="label.email" /></th>
            <th><spring:message code="label.telephone" /></th>
            <th>&nbsp;</th>
        </tr>
        <c:forEach items="${list}" var="contact">
            <tr>
                <td>${contact.lastname}, ${contact.firstname}</td>
                <td>${contact.email}</td>
                <td>${contact.telephone}</td>
                <td><a href="deleteUser/${contact.id}"><spring:message code="label.delete" /></a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>

</body>
</html>
