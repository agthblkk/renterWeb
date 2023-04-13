<%--
  Created by IntelliJ IDEA.
  User: agath
  Date: 24.12.2022
  Time: 17:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/css/owner.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Roboto Mono' rel='stylesheet'>
</head>
<body>
<div id = mainDiv>
<h1>Вітаємо, власнику!</h1>
<button class = "submit" onclick="location.href = 'ownerLogin.jsp';">Вхід</button>
<button class = "submit" onclick="location.href = 'SignUp.jsp';">Реєстрація</button>
<button class = "submit" onclick="location.href = 'index.jsp';">Вихід</button>
</div>
</body>
</html>
