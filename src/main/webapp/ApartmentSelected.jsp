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
  <link href="${pageContext.request.contextPath}/css/as.css" rel="stylesheet" type="text/css">
  <link href='https://fonts.googleapis.com/css?family=Roboto Mono' rel='stylesheet'>
</head>
<body>
<%String flat = (String)session.getAttribute("flat");%>
<sql:setDataSource
        var="renting"
        driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/renting"
        user="root" password="1356"
/>
<sql:query var="owners" dataSource="${renting}">
  SELECT * FROM Owners WHERE idOwners = (SELECT owner FROM Flats WHERE idFlats = ?);
  <sql:param value="${flat}" />
</sql:query>
<div id = welcomeDiV>
  <h3>Дані власника цієї квартири:</h3>
<form action = "/renter" method = "POST">
  <table id = "table">
    <c:forEach var="user" items="${owners.rows}">
      <tr>
        <th><c:out value="${user.name}" /></th>

        <th><c:out value="${user.surname}" /></th>
        <th><c:out value="${user.phone}" /></th>
      </tr>

    </c:forEach>
  </table>
</form>
<button class = "buttons" onclick="location.href = 'index.jsp';">Вийти</button>
</div>
</body>
</html>
