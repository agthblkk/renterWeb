<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Roboto Mono' rel='stylesheet'>
</head>
<body>
<div id = "welcomeDiv">
    <h1 id = "welcome">Вас вітає сайт по пошуку і здачі житла!</h1>
    <h2 id = "choose">Оберіть Ваш шлях</h2>
</div>
<div id = "buttonsDiv">
    <button class = "buttons" onclick="location.href = 'renter.jsp';">Я хочу орендувати житло</button>
</div>
<div id = buttons1Div>
    <button class = "buttons" onclick="location.href = 'owner.jsp';">Я можу здати житло</button>
</div>
</body>
</html>