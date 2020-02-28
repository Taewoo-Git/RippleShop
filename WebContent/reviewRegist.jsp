<%@page import="rippleshop.bean.db.ReviewVO"%>
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
ReviewVO vo = new ReviewVO();

int purchase_num = Integer.parseInt(request.getParameter("purchase_num"));
vo.setPurchase_num(purchase_num);

vo.setStar_score(Integer.parseInt(request.getParameter("reviewScore")));

vo.setContent(request.getParameter("reviewContent"));

dao.createReview(vo);
%>
<script>
setTimeout("window.close()", 500);
</script>
</body>
</html>