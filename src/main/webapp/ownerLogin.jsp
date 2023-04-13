<%--
  Created by IntelliJ IDEA.
  User: agath
  Date: 25.12.2022
  Time: 12:00
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
<div id = mainDiv>
  <h1>Вхід для власника</h1>
  <form action="${pageContext.request.contextPath}/login" method="GET">
      Введіть свій номер телефону:<input class = "input" type="text" name="phoneOwner"/><br/><br/>
      Введіть пароль:<input class = "input" type="password" name="passwordOwner"/><br/><br/>
      <input class = "submit" type="submit" value="Вхід"/>
  </form>
  <button class = "submit" onclick="location.href = 'index.jsp';">Вихід</button>
</div>
</body>
</html>
