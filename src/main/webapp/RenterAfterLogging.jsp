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
    <link href="${pageContext.request.contextPath}/css/raf.css" rel="stylesheet" type="text/css">
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
<%String name = (String)session.getAttribute("name");%>
<%String flat = (String)session.getAttribute("flat");%>
<div id = "mainDiv">
<form action = "/renter" method = "POST">
    <h3>Вітаємо, <%= name%>! Обери квартиру, яка більше сподобається</h3>
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
    <div id = selection>
        <select id = "it" name = "flat">
            <c:forEach var="user" items="${apartments.rows}">
                <option><c:out value="${user.idFlats}"/></option>
            </c:forEach>
        </select>
    </div>
    <input class = "submit" type="submit" value="Далі"/>
</form>
</div>
</body>
</html>
