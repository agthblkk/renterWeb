<%--
  Created by IntelliJ IDEA.
  User: agath
  Date: 25.12.2022
  Time: 16:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/css/oal.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Roboto Mono' rel='stylesheet'>
</head>
<body>
<div id = "mainDiv">
    <h1>Не правильний пароль! Вийдіть і спробуйте знову</h1>
    <button class = "submit" onclick="location.href = 'ownerLogin.jsp';">Вихід</button>
</div>
</body>
</html>
