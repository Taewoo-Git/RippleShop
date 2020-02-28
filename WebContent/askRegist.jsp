<%@page import="rippleshop.bean.db.AskVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RippleShop</title>
</head>
<jsp:useBean id="dao" class="rippleshop.bean.db.RippleShopDAO" />
<body>
<%
AskVO vo = new AskVO();

int product_num = Integer.parseInt(request.getParameter("product_num"));
vo.setProduct_num(product_num);

vo.setTitle(request.getParameter("askTitle"));

vo.setContent(request.getParameter("askContent"));

if(request.getParameter("askPassword") != null) vo.setPassword(request.getParameter("askPassword"));

if(session.getAttribute("loginSession") == null) vo.setWriter("비회원");
else vo.setWriter(request.getParameter("askWriter"));

dao.createAsk(vo);
%>
<jsp:forward page="productDetail.jsp?product_num=<%= product_num %>" />
</body>
</html>