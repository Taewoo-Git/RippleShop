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
String email = request.getParameter("loginEmail");
String password = request.getParameter("loginPassword");
String loginResponse = "fail";

if(dao.readLoginCheck(email, password)) {
	session.setAttribute("loginSession", email);
	loginResponse = "success";
}
%>
<%= loginResponse %>
</body>
</html>