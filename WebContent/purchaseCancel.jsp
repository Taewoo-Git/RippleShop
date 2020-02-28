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
int purchase_num = Integer.parseInt(request.getParameter("purchase_num"));
dao.updateCancelPurchase(purchase_num);
%>
<jsp:forward page="purchaseCheck.jsp" />
</body>
</html>