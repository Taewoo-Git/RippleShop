<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RippleShop</title>
</head>
<body>
<jsp:useBean id="dao" class="rippleshop.bean.db.RippleShopDAO" />
<%
String num = request.getParameter("num");

String content = dao.readSecretAsk(Integer.parseInt(num)).get(0);
String reply = dao.readSecretAsk(Integer.parseInt(num)).get(2);
	
String askResponse = content + "//" + reply;
%>
<%= askResponse %>
</body>
</html>