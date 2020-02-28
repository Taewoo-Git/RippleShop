<%@page import="rippleshop.bean.db.MemberVO"%>
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
String email = request.getParameter("email");
String password = request.getParameter("password");
String name = request.getParameter("name");
String phone = request.getParameter("phone");
String zip = request.getParameter("zip");
String address = request.getParameter("address") + " " + request.getParameter("address_details");

MemberVO vo = new MemberVO();

vo.setEmail(email);
vo.setPassword(password);
vo.setName(name);
vo.setPhone(phone);
vo.setZip(zip);
vo.setAddress(address);

dao.createSignup(vo);

session.setAttribute("loginSession", email); 
%>
<jsp:forward page="index.jsp" />
</body>
</html>