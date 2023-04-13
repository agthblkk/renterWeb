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
  <link href="${pageContext.request.contextPath}/css/oal.css" rel="stylesheet" type="text/css">
  <link href='https://fonts.googleapis.com/css?family=Roboto Mono' rel='stylesheet'>
</head>
<body>
<%String id = (String)session.getAttribute("id");%>
<sql:setDataSource
        var="renting"
        driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/renting"
        user="root" password="1356"
/>
<sql:query var="apartments" dataSource="${renting}">
  SELECT * FROM Flats WHERE owner = ?;
  <sql:param value="${id}" />
</sql:query>
<%String nameOwner = (String)session.getAttribute("nameOwner");%>
<div id = mainDiv>
<form action="/login" method="GET">
  <h3>Твої квартири, <%= nameOwner%></h3>
  <table id = "table">
    <tr>
      <th>Номер</th>
      <th>Район</th>
      <th>Адреса</th>
      <th>Площа</th>
      <th>Кімнат</th>
      <th>Ціна</th>
    </tr>
    <c:forEach var="user" items="${apartments.rows}">
      <tr>
        <th><c:out value="${user.idFlats}" /></th>
        <sql:query var="districts" dataSource="${renting}">
          SELECT * FROM Districts WHERE DistrictID = ?;
          <sql:param value="${user.district}" />
        </sql:query>
      <c:forEach var="distr" items="${districts.rows}">
        <th><c:out value="${distr.districtName}" /></th>
      </c:forEach>
        <th><c:out value="${user.address}" /></th>
        <th><c:out value="${user.square}" /></th>
        <th><c:out value="${user.rooms}" /></th>
        <th><c:out value="${user.price}" /></th>
      </tr>

    </c:forEach>
  </table>
</form>
<button class = "submit" onclick="location.href = 'addFlat.jsp';">Додати квартиру</button>
<button class = "submit"onclick="location.href = 'delFlat.jsp';">Видалити квартиру</button>
<button class = "submit" onclick="location.href = 'index.jsp';">Вихід</button>
</div>
</body>
</html>
