<%@page import="rippleshop.bean.db.PurchaseVO"%>
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
int product_num = Integer.parseInt(request.getParameter("product_num"));
int amount = Integer.parseInt(request.getParameter("amount"));
double price = Double.parseDouble(request.getParameter("price"));
String memo = request.getParameter("memo");

PurchaseVO vo = new PurchaseVO();

vo.setEmail(email);
vo.setProduct_num(product_num);
vo.setAmount(amount);
vo.setPrice(price);
vo.setMemo(memo);

dao.createPurchase(vo);
%>
<jsp:forward page="productDetail.jsp">
	<jsp:param name="product_num" value="<%= product_num %>"/>
</jsp:forward>
</body>
</html>