<%@ page import="java.util.List"%>
<%@ page import="rippleshop.bean.db.PurchaseVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>RippleShop</title>
</head>

<!-- top.jsp 파일 Include -->
<jsp:include page="top.jsp" flush="false" />

<link rel="stylesheet" type="text/css" href="css/product_detail_page.css">
<link rel="stylesheet" type="text/css" href="css/w3.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">

<script src="js/bootstrap.min.js"></script>
<script src="js/jquery-3.3.1.min.js"></script>

<style>
.my-hr {
	padding-top: 0;
	margin-top: 0;
    border: 0;
    height: 3px;
    background: black;
}

table {
  border-collapse: separate;
  border-spacing: 0;
}

table tr th,
table tr td {
  border-bottom: 1px solid #bbb;
  padding: 10px;
}
 
.titleFont {font-family: 'Nanum Gothic', sans-serif; font-size: 18px;}
.xrpFont {font-family: 'Nanum Gothic', sans-serif; font-size: 15px; font-weight: bold;}
.dateFont {font-family: 'Nanum Gothic', sans-serif; font-size: 13px; color: #747474; font-weight: bold;}
.statusFont {font-family: 'Nanum Gothic', sans-serif; font-size: 15px; color: #BDBDBD; font-weight: bold;}
.commentFont {font-family: 'Nanum Gothic', sans-serif; font-size: 12px;}

body,a {font-family: 'Nanum Gothic', sans-serif;}
</style>

<jsp:useBean id="dao" class="rippleshop.bean.db.RippleShopDAO" />

<body style="margin-top:80px">
<div>
    <h2 align="left"><b>주문/배송조회</b></h2>
    <hr class="my-hr">
</div>

<div class="container w3-center">
<table width="100%">
	<tr>
		<th colspan="4"></th>
	</tr>
	<%
	List<PurchaseVO> list = dao.readPurchaseList(session.getAttribute("loginSession").toString());
	if(list.size() == 0) {
		out.print("<tr><td colspan='6'>구매하신 상품이 없습니다.</td></tr>");
	}
	else {
		for(int i=0; i<list.size(); i++) {
	%>
		<tr>
			<td>
			<a href="productDetail.jsp?product_num=<%= list.get(i).getProduct_num() %>" style="text-decoration:none">
			<img src='imgs/products/<%= list.get(i).getIntro_img() %>' width="155" height="155">
			</a>
			</td>
			
			<td align="left">
			<a class="titleFont" href="productDetail.jsp?product_num=<%= list.get(i).getProduct_num() %>" style="text-decoration:none">
			<b><%= list.get(i).getProduct_name() %></b>
			</a>
			<p/><p/>
			<a class="xrpFont"><%= list.get(i).getPrice()+" XRP" %></a>&nbsp&nbsp<font color="#eee">|
			</font>&nbsp&nbsp<a class="dateFont"><%= list.get(i).getPurchase_date() %></a><p/>
			<a class="statusFont">
			<% 
				if(list.get(i).getDeposit_chk().equals("N")) out.print("결제확인 중");
				else if(list.get(i).getDeposit_chk().equals("Y")) out.print("<font color=#747474>결제완료</font>");
				else if(list.get(i).getDeposit_chk().equals("D")) out.print("<font color=#000>배송 중</font>");
				else if(list.get(i).getDeposit_chk().equals("P")) out.print("<font color=#ff9f1a>배송완료</font>");
				else if(list.get(i).getDeposit_chk().equals("C")) out.print("<font class='w3-text-red'>구매취소</font>"); 
			%>
			</a><p/>
			<a class="commentFont">
			상품의 이용방법, 교환/반품 등에 대한 문의는 <font color=#ff9f1a>상품문의</font>를 이용해주세요.<br/>
			배송완료 이후 <font color=#ff9f1a>상품후기</font>를 통해 다양한 혜택을 받으세요!
			</a>
			</td>
			<td>
			<button class="btn btn-default" onclick="move_product_ask('<%= list.get(i).getProduct_num() %>')">상품문의</button>
			</td>
			<td>
			<% 
			if(list.get(i).getDeposit_chk().equals("P")) {
				if(dao.readCheckReview(list.get(i).getPurchase_num())) {
					out.print("<button class='btn' disabled>상품후기</button>");
				}
				else {
					out.print("<button class='btn btn-orange w3-hover-light-grey' onclick=\"JavaScript:open_review_popup('reviewPopup.jsp?purchase_num="+list.get(i).getPurchase_num()+"')\">상품후기</button>");
				}
			}				
			else if(list.get(i).getDeposit_chk().equals("D") || list.get(i).getDeposit_chk().equals("C"))
				out.print("<button class='btn' disabled>구매취소</button>");
			else 
				out.print("<button class='btn w3-red w3-hover-light-grey' onclick='purchase_cancel("+list.get(i).getPurchase_num()+")'>구매취소</button>");
			%>
			</td>
		</tr>
	<%
		}
	}
	%>
</table>
</div>
<script>
function open_review_popup(ref) {
	window.open(ref, "review", "scrollbars=Yes, width=600, height=510, left=100, top=50");
}

function purchase_cancel(purchse_num) {
	var cancel = confirm("해당 상품의 구매를 정말 취소하시겠습니까?");
	if(cancel) {
		location.href="purchaseCancel.jsp?purchase_num="+purchse_num;
	}
}

function move_product_ask(product_num) {
	location.href="productDetail.jsp?product_num="+product_num+"#ask";
}
</script>
</body>
</html>