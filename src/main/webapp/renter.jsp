<%--
  Created by IntelliJ IDEA.
  User: agath
  Date: 24.12.2022
  Time: 17:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/css/renter.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Roboto Mono' rel='stylesheet'>
</head>
<body>
<div id = mainDiv>
  <h1 id = "welcome">Вітаємо, орендатор!</h1>
  <form action="${pageContext.request.contextPath}/renter" method="GET">
      Введіть своє ім'я:<input class = "input" type="text" name="nameRenter"/><br/><br/>
      Введіть своє прізвище:<input class = "input" type="text" name="surnameRenter"/><br/><br/>
      Введіть свій номер телефону:<input class = "input" type="text" name="phoneRenter"/><br/><br/>
      <input class = "submit" type="submit" value="Далі"/>
  </form>
  <button class = "submit" onclick="location.href = 'index.jsp';">Вихід</button>
</div>
</body>
</html>
