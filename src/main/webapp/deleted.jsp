<%--
  Created by IntelliJ IDEA.
  User: agath
  Date: 25.12.2022
  Time: 14:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/css/ownlog.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Roboto Mono' rel='stylesheet'>
</head>
<body>
<div id = "mainDiv">
<form action = "/deleteflat" method = "GET">
    <h1>Видалено</h1>
</form>
<button class = "submit" onclick="location.href = 'OwnerAfterLogging.jsp';">Повернутися до акаунту</button>
</div>
</body>
</html>
