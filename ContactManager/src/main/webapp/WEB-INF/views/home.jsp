<%--
  Created by IntelliJ IDEA.
  User: Алина
  Date: 22.04.2016
  Time: 16:25
  To change this template use File | Settings | File Templates.
--%>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>



<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@page session="true"%>

<html>
<head>

    <center>


        <c:if test="${pageContext.request.userPrincipal.name != null}">

            <h2>Добро пожаловать, ${pageContext.request.userPrincipal.name} </h2>

        </c:if>




        <c:if test="${pageContext.request.userPrincipal.name == null}">

            <h2>Добро пожаловать!</h2>

                <a  class="btn btn-primary btn-lg"   href="/login"> Вход </a>

        </c:if>

<c:if test="${pageContext.request.userPrincipal.name != null}">

    <a class="btn btn-info btn-lg"  href="/mypage"> Моя страница
    </a>
</c:if>

    <a class="btn btn-success btn-lg"  href="/index"> Все контакты
    </a>


    </center>

</head>
<body>

</body>
</html>
