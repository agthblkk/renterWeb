<%@ page import="com.example.rentingwebsite.DataBase" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: agath
  Date: 24.12.2022
  Time: 19:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<html>
<head>
  <title>Title</title>
  <link href="${pageContext.request.contextPath}/css/ownlog.css" rel="stylesheet" type="text/css">
  <link href='https://fonts.googleapis.com/css?family=Roboto Mono' rel='stylesheet'>
</head>
<body>
<sql:setDataSource
        var="renting"
        driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/renting"
        user="root" password="1356"
/>
<sql:query var="apartments" dataSource="${renting}">
  SELECT * FROM Flats;
</sql:query>
<div id = "mainDiv">
<h1>Додавання квартири!</h1>
<form action="/addflat" method="GET">
  <h2>Спочатку, додайте район, в якому знаходиться Ваша квартира:</h2>
  Введіть назву району: <input class = "input" type="text" name="districtName"/><br/><br/>
  Введіть 'так', якщо район підходить для сім'ї, і 'ні', якщо не підходить<input class = "input" type="text" name="familyFriendly"/><br/><br/>
  Введіть 'так', якщо район безпечний, і 'ні', якщо небезпечний<input class = "input" type="text" name="secure"/><br/><br/>

  <h2>Додамо квартиру:</h2>
  Введіть адресу:<input class = "input" type="text" name="address"/><br/><br/>
  Введіть площу(кв. м):<input class = "input" type="text" name="square"/><br/><br/>
  Введіть кількість кімнат:<input class = "input" type="text" name="rooms"/><br/><br/>
  Введіть ціну:<input class = "input" type="text" name="price"/><br/><br/>
  Введіть пароль знову:<input class = "input" type="password" name="passwordOwner"/><br/><br/>
  <input class = "submit" type="submit" value="Далі"/>
</form>
</div>
</body>
</html>
