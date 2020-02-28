<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Random"%>
<%@page import="rippleshop.bean.db.MemberVO"%>
<%@page import="rippleshop.bean.db.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- top.jsp 파일 Include -->
<jsp:include page="top.jsp" flush="false" />

<link rel="stylesheet" type="text/css" href="css/product_detail_page.css">
<link rel="stylesheet" type="text/css" href="css/w3.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">

<script src="js/bootstrap.min.js"></script>
<script src="js/jquery-3.3.1.min.js"></script>
    
<style>
h1,h2,h3,h4,h5,h6,.w3-wide {font-family: "Montserrat", sans-serif;}
body,a {font-family: 'Nanum Gothic', sans-serif;}

.menuFont {font-family: 'Nanum Gothic', sans-serif; font-size: 13px;}
.dynamicFont {font-family: 'Permanent Marker', cursive;}
.priceFont {font-family: 'Archivo Black', sans-serif; font-size: 35px;}
.optionFont {background-color: darkgrey; color: white; font-size: 11px; font-family: "돋움", sans-serif; padding: 2px;}

.btn-minus{cursor:pointer;font-size:7px;display:flex;align-items:center;padding:5px;padding-left:10px;padding-right:10px;border:1px solid gray;border-radius:2px;border-right:0;}
.btn-plus{cursor:pointer;font-size:7px;display:flex;align-items:center;padding:5px;padding-left:10px;padding-right:10px;border:1px solid gray;border-radius:2px;border-left:0;}

.section{width:100%;margin-left:-15px;padding:2px;padding-left:15px;padding-right:15px;}

.nav-container {position: fixed; top: 0;}

div.section > div {width:100%;display:inline-flex;}
div.section > div > input {margin:0;padding-left:5px;font-size:10px;padding-right:5px;max-width:18%;text-align:center;}

.fontStyle{font-size: 13px; color: black; margin-left: 10px;}

.top_bar_fix{position:fixed; top:11px; width:75%;}

.productNameHidden {width:200px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;}

.btn-submit {
	width: 100%;
	border-radius: 5px;
	padding: 17px 20px;
	box-sizing: border-box;
	font-size: 14px;
	font-weight: 700;
	color: #fff;
	text-transform: uppercase;
	border: none;
	background-image: linear-gradient(to left, #74ebd5, #9face6);
}

.tbl-option {
    width: 100%;
    border-top: 1px solid #F6F6F6;
    border-collapse: collapse;
    font-size: 13px;
}
    
.td-option {
    border-bottom: 1px solid #F6F6F6;
    padding: 10px;
}
    
.my-hr {
	padding-top: 0;
	margin-top: 0;
    border: 0;
    height: 3px;
    background: black;
}

.nav-tbl {
	border-collapse: separate;
	border-spacing: 0;
	min-width: 100%;
  
	font-size: 13px;
	color: #333;
	font-weight: 600;
}

.nav-tbl-td {
	border-right: 1px solid #bbb;
	border-bottom: 3px solid #ff9f1a;
	border-top: 1px solid #bbb;
  
	text-align: center;
	padding: 15px;
	cursor:pointer;
	max-width: 30px;
}

.nav-tbl-left {
  border-left: 1px solid #bbb;
}

.nav-tbl-td-on {
	border-left: 3px solid #ff9f1a;
	border-right: 3px solid #ff9f1a;
	border-top: 3px solid #ff9f1a;
	
	background: #fff;
	color: #000;
	border-bottom: 0px solid #bbb;
}

.nav-tbl-td-off {background: #F3F5F7;}

table tr th {
	border-top: 3px solid #F6F6F6;
	border-bottom: 1px solid #F6F6F6;
	padding: 5px;
	background: #FAFAFA;
	text-align: center;
	font-size: 13px;
}

table tr:last-child {
	border-bottom: 3px solid #F6F6F6;
	font-size: 13px;
}

.page-check {
	background: #ff9f1a;
	color: #fff;
}

.btn-font {
	font-family: 'Nanum Gothic', sans-serif; 
	font-size: 11px;
	font-weight: bold;
}
</style>

<title>RippleShop</title>
</head>

<jsp:useBean id="api" class="rippleshop.bean.api.ApiBean" />
<jsp:useBean id="dao" class="rippleshop.bean.db.RippleShopDAO" />
<%
	int xrp_price = api.getCurrentPriceXRP();

	int product_num = Integer.parseInt(request.getParameter("product_num"));
	ProductVO pvo = dao.readProduct(product_num);
		
	double product_xrp_price = (double)pvo.getProduct_price() / xrp_price;
	product_xrp_price = Math.round(product_xrp_price * 1000000) / 1000000.0;
	
	double discount_price = Math.floor(product_xrp_price) - 2;
	
	String product_price = NumberFormat.getInstance().format(pvo.getProduct_price());
	
    double discount_percent = Math.round(((product_xrp_price - discount_price) / product_xrp_price) * 100);
    
    Random rand = new Random();
    double fee = (rand.nextInt(9000) + 1000) * 0.00001;
    double last_price = discount_price + fee;
    
    String email = null;
	String name = null;
	String phone = null;
	String strPhone = null;
	String zip = null;
	String address = null;
%>
<body>
<!-- 상품 상세페이지 -->
<div class="container" style="margin-top:80px">
    <div class="container-fliud" style="margin-left:-15px">
        <div class="wrapper">
            <div class="preview col-md-5">
                <div class="preview-pic tab-content">
                  <div class="tab-pane active"><img src="imgs/products/<%= pvo.getIntro_img() %>"></div>
                </div>
            </div>
            <div class="details col-md-7" style="margin-left:15px; margin-top:-15px">
                <h3 class="pd-product-title"><%= pvo.getProduct_name() %></h3>
                <div class="pd-rating">
                    <div>
                    <%
			   			int star_rest = 5 - dao.readReviewAvg(product_num);
			   			
			   			for(int j=0; j<dao.readReviewAvg(product_num); j++) {
			   				out.print("<span class='fa fa-star checked'></span>&nbsp");
			   			}
			   			
			   			for(int j=0; j<star_rest; j++) {
			   				out.print("<span class='fa fa-star'></span>&nbsp");
			   			}
			   		%>
                    </div>
                    <span><%= dao.readReviewNum(product_num)-1 %> reviews</span>
                </div>
                <br>
                <h4 class="price" style="margin-bottom:-5px;">
                    <a style="font-weight:nomal;">원화 판매가&nbsp;</a>
                    <%= product_price %> KRW
                </h4>
                <h4 class="price">
                    <a>리플 할인가&nbsp;</a>
                    <del style="color:darkgrey;"><%= product_xrp_price %> XRP</del>&nbsp;
                    <span class="priceFont"><%= (int)discount_price %> XRP</span>
                    <strong>(<%= (int)discount_percent %>% ↓)</strong>
                </h4>
                <h5 class="sizes">
                    <%
                    if(pvo.getDelivery_if().equals("무료배송")){
                  	  out.print("<a>" + pvo.getDelivery_if() + "</a>");
                    }
                    else{
                  	  out.print("<a>배송비 &nbsp" + NumberFormat.getInstance().format(pvo.getDelivery_price()) + "원 (" + NumberFormat.getInstance().format(pvo.getDelivery_price_max()) + "원 이상 무료배송)</a>");
                    }
                    %>
                </h5>
                <div class="section" style="padding-bottom:20px;">
                    <div style="height:30px;">
                        <div class="btn-minus" id="btn-minus" style="font-size:13px"><span class="fa fa-minus"></span></div>
                        <input style="width:50px; font-size:15px; font-weight:bold;" value="1" />
                        <div class="btn-plus" style="font-size:13px"><span class="fa fa-plus"></span></div>
						<!--<a>&nbsp; 남은 수량 : 30 개</a>-->
                    </div>
                </div>
                <h4 class="price">
                    <a>최종 구매가&nbsp;</a>
                    <a name="lastPrice"><%= last_price %></a> XRP
                </h4>
                <font size = "2" color = "red">
				※입금 금액은 '최종 구매가'에 기재된 금액만큼 정확하게 입금하셔야 합니다.<br>
				※익명성 거래에서의 고객 구별을 위해 0.1 XRP 미만의 수수료가 난수로 발생합니다.
                </font>
                <div class="action"><br>
                    <%
                    if(session.getAttribute("loginSession") != null) {
                    	MemberVO mvo = dao.readMember(session.getAttribute("loginSession").toString());
                    	
                    	email = mvo.getEmail();
                    	name = mvo.getName();
                    	
                    	phone = mvo.getPhone();
                    	strPhone = phone.substring(0, 3) + "-" + phone.substring(3, 7) + "-" + phone.substring(7);
                    	
                    	zip = mvo.getZip();
                    	address = mvo.getAddress();
                    %>
                    <button class="add-to-cart btn btn-default" type="button" onclick="document.getElementById('purchase_modal').style.display='block'">구매하기</button>
                    
                    <%
                    }
                    else {
                    %>
                    <button class="add-to-cart btn btn-default" type="button" onclick="document.getElementById('login_modal').style.display='block'">구매하기</button>
                    <%
                    }
                    %>
                    <button class="like btn btn-default" type="button" onclick="ready()"><span class="fa fa-shopping-cart"></span></button>
                </div>
            </div>
        </div>
    </div>
    
    <div id="topBar" style="margin-top:30px; margin-bottom:30px;">
	    <table class="nav-tbl tab_floatable" style="margin-bottom:0px">
		    <tr>
			    <td class="nav-tbl-td nav-tbl-left nav-tbl-td-on" id="nav-detail"><a>상세정보</a></td>
			    <td class="nav-tbl-td nav-tbl-td-off" id="nav-review"><a>상품후기</a></td>
			    <td class="nav-tbl-td nav-tbl-td-off" id="nav-ask"><a>상품문의</a></td>
			    <td class="nav-tbl-td nav-tbl-td-off" id="nav-claim"><a>반품/교환정보</a></td>
		    </tr>
	    </table>
    </div>

    <div class="w3-center" id="detail">
    <!-- <h2 align="left"><b>상세정보</b></h2> -->
    <!-- <hr class="my-hr"> -->
        <img src="imgs/products/<%= pvo.getMain_img() %>" />
    </div>
    
    <div class="w3-center" id="review">
		<h2 align="left"><b>상품후기</b></h2>
		<hr class="my-hr">
	    <div align="left" style="margin-bottom:10px">
	    	<font size="2"><b>상품을 구매하신 분들이 작성하신 후기입니다. 상품후기 작성 시 다양한 혜택을 받으실 수 있습니다.</b></font><br>
	    	<font size="1" color="grey">상품후기는 배송완료 후 회원정보 > 주문/배송 조회에서 작성하실 수 있습니다.</font>
	    </div>
	    
	    <% 
		int review_page = 1;
		if(request.getParameter("review_page") != null) review_page = Integer.parseInt(request.getParameter("review_page"));
		%>
    	<jsp:include page='review.jsp' flush='true'>
		    <jsp:param name="product_num" value="<%=product_num%>"/>
		    <jsp:param name="review_page" value="<%=review_page%>"/>
		</jsp:include>    	
    </div>
    	
	<div class="w3-center" id="ask">
		<h2 align="left"><b>상품문의</b></h2>
	   	<hr class="my-hr">
		<div align="left" style="margin-bottom:10px">
			<font size="2"><b>구매하시려는 상품에 대해 궁금하신 점이 있으신 경우 문의해주세요.</b></font>
			<button class='btn btn-orange w3-hover-light-grey w3-right w3-margin-right' onclick="document.getElementById('ask_modal').style.display='block'">
			문의하기
			</button>
			<br>
			<font size="1" color="grey">본 상품과 관련되지 않은 내용이나 비방, 홍보글, 도배글, 개인정보가 포함된 글은 예고없이 삭제될 수 있습니다.</font>
		</div>
		
		<% 
		int ask_page = 1;
		if(request.getParameter("ask_page") != null) ask_page = Integer.parseInt(request.getParameter("ask_page"));
		%>
   		<jsp:include page='ask.jsp' flush='true'>
   			<jsp:param name="product_num" value="<%=product_num%>"/>
		    <jsp:param name="ask_page" value="<%=ask_page%>"/>
		</jsp:include>
	</div>
    
    <div class="w3-center" id="claim">
    	<h2 align="left"><b>반품/교환정보</b></h2>
    	<hr class="my-hr">
		<div align="left" style="margin-bottom:10px">
			<font size="2"><b><%= pvo.getProduct_name()+" " %>반품/교환 안내</b></font><br>
			<font size="1" color="grey">반품/교환에 관한 일반적인 사항은 판매자 제시사항보다 관계법령이 우선합니다.</font>
		</div>
		
		<jsp:include page='claim.jsp' flush='true'/>
	</div>
	<br>
<!-- 내용 끝 -->
</div>

<!-- 문의하기 모달 -->
<div id="ask_modal" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-left" style="max-width:600px">
        <div align="right" class="w3-black">
            <span onclick="document.getElementById('ask_modal').style.display='none'" class="w3-button w3-large w3-black w3-display-top">×</span>
        </div>
        
        <div class="w3-left">
            <a class="fontStyle" style="font-size:20px; padding-left: 5px;">
                <b>문의하기</b>
            </a>
        </div>
        <br/><br/>

        <form class="w3-container" action="askRegist.jsp" method="post" autocomplete="off">
        <div class="w3-section">
            <input class="w3-input w3-margin-bottom" type="text" placeholder="제목을 입력해주세요." name="askTitle" required>
            <textarea class="w3-input w3-border" placeholder="문의하실 내용을 적어주세요." rows="10" name="askContent" required></textarea>
            
        	<input type="checkbox" id="secret"> 비밀 글
                        
            <input type="submit" class="w3-button w3-block w3-section w3-padding btn-submit" value="등록">
            
            <input type="hidden" name="askWriter" value="<%= name %>" />
            <input type="hidden" name="product_num" value="<%= product_num %>" />
        </div>
        </form>

        <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
            <button onclick="document.getElementById('ask_modal').style.display='none'" type="button" class="w3-button w3-red btn-radius">취소</button>
            <span class="w3-right w3-padding w3-hide-small">
            </span>
        </div>
    </div>
</div>

<!-- 구매하기 모달 -->
<div id="purchase_modal" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-top" style="max-width:700px">
    	<div align="right" class="w3-black">
            <span onclick="document.getElementById('purchase_modal').style.display='none'" class="w3-button w3-large w3-black w3-display-top">×</span>
        </div>
        
        <div class="w3-left">
            <a class="fontStyle" style="font-size:20px;">
                <b> 주문/결제</b>
            </a>
        </div>
        <br/><br/><br/>

        <form class="w3-container" action="purchase.jsp" method="post" autocomplete="off">
        <table width="100%">
        <tr>
        <td valign="top" width="30%">
            <div class="form-group">
                <label>수령인</label><br>
                <span class="fontStyle">
                    <%= name + "(" + name + ")" %> <br>
                </span>
            </div>
        </td>
        <td valign="top" width="20%">
        	<div class="form-group">
                <label>전화번호</label><br>
                <span class="fontStyle">
                    <%= strPhone %>
                </span>
            </div>
        </td>
        <td width="40%">
        	<div class="form-group">
                <label>주소</label><br>
                <span class="fontStyle">
                    <%= "(" + zip + ") " + address %>
                </span>
                <br/><br/>
            </div>
        </td>
        </tr>
        <tr>
        <td>
         	<!-- 상품 정보 -->
            <div class="form-group productNameHidden">
                <label>상품명</label><br>
                <span class="fontStyle">
                    <%= pvo.getProduct_name() %>
                </span>
            </div>
        </td>
        <td>
        	<div class="form-group">
                <label>상품수량</label><br>
                <span class="fontStyle">
                    <a name="purchase_amount">1개</a>
                </span>
            </div>
        </td>
        <td>
        	<div class="form-group">
                <label>입금할 코인</label><br>
                <span class="fontStyle">
                    <a name="purchase_modal_last_price"><%= last_price %></a> XRP
                </span>
                <br>
            </div>
        </td>
        </tr>
        <tr style="border: 0px;">
        <td colspan="3">
        	<div class="form-group"><br/>
                <label>배송 요청사항</label>
                <select name="memo" id="memo" class="w3-select">
                    <option value="">요청사항을 선택해주세요.</option>
                    <option value="배송 전에 미리 연락 바랍니다.">배송 전에 미리 연락 바랍니다.</option>
                    <option value="부재시 경비실에 맡겨 주세요.">부재시 경비실에 맡겨 주세요.</option>
                    <option value="부재시 전화 주시거나 문자 남겨 주세요.">부재시 전화 주시거나 문자 남겨 주세요.</option>
                </select>
            </div>
            <div class="form-group">
                <span style="color: green; font-size: 10px;">
					도서산간 지역의 경우 추후 수령 시 추가 배송비가 과금될 수 있습니다.
                    <br>
                </span>
            </div>
        </td>
        </tr>
        </table>
        
        <!-- 지갑정보 -->
        <table>
        <tr>
        <td rowspan="2" width="150px">
            <div class="form-group">
                 <img src="imgs/QRcode.jpg" width="130" height="130"><br>
            </div>
        </td>
        <td>
        	<div class="form-group">
                <label>지갑주소</label><br>
                <span class="fontStyle">
                rDxfhNRgCDNDckm45zT5ayhKDC4Ljm7UoP
                </span>
            </div>
        </td>
        </tr>
        <tr style="border: 0px;">
        <td>
        	<div class="form-group">
                <label>데스티네이션 태그(Destination Tag)</label><br>
                <span class="fontStyle">
                1004588726
                </span>
            </div>
        </td>
        </tr>
        </table>
        
        <div class="form-group">
            <span style="color: red; font-size: 13px; font-weight:bold;">
			금액을 정확히 입력해주세요. 금액이 다를 경우 상품 출고가 늦어질 수 있습니다!<br>
            </span>
        </div>
        
        <!-- ID -->
        <input type="hidden" name="email" value="<%= email %>" />
        <!-- Product_num -->
        <input type="hidden" name="product_num" value="<%= pvo.getProduct_num() %>" />
        <!-- Amount -->
        <input type="hidden" name="amount" id="amount" value="1" />
        <!-- Price -->
        <input type="hidden" name="price" id="price" value="<%= last_price %>" />
        
        <button class="btn-submit w3-block w3-blue w3-section w3-padding" type="submit">입금완료</button>
        </form>
    </div>
</div>
      
<!-- 하단 -->
<footer class="w3-center w3-black w3-padding-16 w3-margin-top">
    <p>Contacted by
        <a href="index.jsp" title="www.rippleshop.com" target="_blank" class="w3-hover-text-green" style="text-decoration:none">
            www.RippleShop.com
        </a>
    </p>
</footer>

<script>
$("#nav-detail").click(function() {
	location.href="#detail";
	
	$("#nav-review").addClass('nav-tbl-td-off');
	$("#nav-review").removeClass('nav-tbl-td-on');
	
	$("#nav-ask").addClass('nav-tbl-td-off');
	$("#nav-ask").removeClass('nav-tbl-td-on');
	
	$("#nav-claim").addClass('nav-tbl-td-off');
	$("#nav-claim").removeClass('nav-tbl-td-on');
	
	$("#nav-detail").addClass('nav-tbl-td-on');
	$("#nav-detail").removeClass('nav-tbl-td-off');
});

$("#nav-review").click(function() {
	location.href="#review";
	
	$("#nav-ask").addClass('nav-tbl-td-off');
	$("#nav-ask").removeClass('nav-tbl-td-on');
	
	$("#nav-claim").addClass('nav-tbl-td-off');
	$("#nav-claim").removeClass('nav-tbl-td-on');
	
	$("#nav-detail").addClass('nav-tbl-td-off');
	$("#nav-detail").removeClass('nav-tbl-td-on');
	
	$("#nav-review").addClass('nav-tbl-td-on');
	$("#nav-review").removeClass('nav-tbl-td-off');
});

$("#nav-ask").click(function() {
	location.href="#ask";
	
	$("#nav-detail").addClass('nav-tbl-td-off');
	$("#nav-detail").removeClass('nav-tbl-td-on');
	
	$("#nav-review").addClass('nav-tbl-td-off');
	$("#nav-review").removeClass('nav-tbl-td-on');
	
	$("#nav-claim").addClass('nav-tbl-td-off'); 
	$("#nav-claim").removeClass('nav-tbl-td-on');
	
	$("#nav-ask").addClass('nav-tbl-td-on');
	$("#nav-ask").removeClass('nav-tbl-td-off');
});

$("#nav-claim").click(function() {
	location.href="#claim";
	
	$("#nav-detail").addClass('nav-tbl-td-off');
	$("#nav-detail").removeClass('nav-tbl-td-on');
	
	$("#nav-review").addClass('nav-tbl-td-off');
	$("#nav-review").removeClass('nav-tbl-td-on');
	
	$("#nav-ask").addClass('nav-tbl-td-off');
	$("#nav-ask").removeClass('nav-tbl-td-on');
	
	$("#nav-claim").addClass('nav-tbl-td-on');
	$("#nav-claim").removeClass('nav-tbl-td-off');
});

// 수량
$("#btn-minus").click(function() {
    var now = $(".section > div > input").val();
    var price = "<%= discount_price %>";
    var fee = "<%= fee %>";
    var amount;
    if ($.isNumeric(now)){
        if (parseInt(now) -1 > 0){ now--;}
        $(".section > div > input").val(now);
        amount = parseInt(now)-1;
        
        document.getElementById("amount").value = amount;
    }else{
        $(".section > div > input").val("1");
    }
    var after = $(".section > div > input").val();
    var modify_price = (price*after)+parseFloat(fee);
    
    document.getElementById("price").value = modify_price;
    
    $("a[name=lastPrice]").text(modify_price);
    $("a[name=purchase_modal_last_price]").text(modify_price);
    $("a[name=purchase_amount]").text(amount + "개");
});

$(".btn-plus").on("click",function(){
    var now = $(".section > div > input").val();
    var price = "<%= discount_price %>";
    var fee = "<%= fee %>";
    var amount;
    if ($.isNumeric(now)){
        if (parseInt(now) +1 < 1000) {
            $(".section > div > input").val(parseInt(now)+1);
            amount = parseInt(now)+1;
            
            document.getElementById("amount").value = amount;
        }
        else {
            $(".section > div > input").val("1");
        }
    }else{
        $(".section > div > input").val("1");
    }
    var after = $(".section > div > input").val();
    var modify_price = (price*after)+parseFloat(fee);
    
    document.getElementById("price").value = modify_price;
    
    $("a[name=lastPrice]").text(modify_price);
    $("a[name=purchase_modal_last_price]").text(modify_price);
    $("a[name=purchase_amount]").text(amount + "개");
});

$(document).ready(function(){
    var topBar = $("#topBar").offset();
    $(window).scroll(function(){
        var docScrollY = $(document).scrollTop();
        var barThis = $("#topBar");
        if( docScrollY > topBar.top ) {
            barThis.addClass("top_bar_fix");
        }else{
            barThis.removeClass("top_bar_fix");
        }
    });
});

$(window).scroll(function() {
	if($(this).scrollTop() >= $("#claim").offset().top - 150) {
		$("#nav-detail").addClass('nav-tbl-td-off');
		$("#nav-detail").removeClass('nav-tbl-td-on');
		
		$("#nav-review").addClass('nav-tbl-td-off');
		$("#nav-review").removeClass('nav-tbl-td-on');
		
		$("#nav-ask").addClass('nav-tbl-td-off');
		$("#nav-ask").removeClass('nav-tbl-td-on');
		
		$("#nav-claim").addClass('nav-tbl-td-on');
		$("#nav-claim").removeClass('nav-tbl-td-off');
	}
	else if($(this).scrollTop() >= $("#ask").offset().top - 200){
		$("#nav-detail").addClass('nav-tbl-td-off');
		$("#nav-detail").removeClass('nav-tbl-td-on');
		
		$("#nav-review").addClass('nav-tbl-td-off');
		$("#nav-review").removeClass('nav-tbl-td-on');
		
		$("#nav-claim").addClass('nav-tbl-td-off'); 
		$("#nav-claim").removeClass('nav-tbl-td-on');
		
		$("#nav-ask").addClass('nav-tbl-td-on');
		$("#nav-ask").removeClass('nav-tbl-td-off');
	}
	else if($(this).scrollTop() >= $("#review").offset().top - 150){
		$("#nav-ask").addClass('nav-tbl-td-off');
		$("#nav-ask").removeClass('nav-tbl-td-on');
		
		$("#nav-claim").addClass('nav-tbl-td-off');
		$("#nav-claim").removeClass('nav-tbl-td-on');
		
		$("#nav-detail").addClass('nav-tbl-td-off');
		$("#nav-detail").removeClass('nav-tbl-td-on');
		
		$("#nav-review").addClass('nav-tbl-td-on');
		$("#nav-review").removeClass('nav-tbl-td-off');
	}
	else if($(this).scrollTop() >= $("#detail").offset().top){
		$("#nav-review").addClass('nav-tbl-td-off');
		$("#nav-review").removeClass('nav-tbl-td-on');
		
		$("#nav-ask").addClass('nav-tbl-td-off');
		$("#nav-ask").removeClass('nav-tbl-td-on');
		
		$("#nav-claim").addClass('nav-tbl-td-off');
		$("#nav-claim").removeClass('nav-tbl-td-on');
		
		$("#nav-detail").addClass('nav-tbl-td-on');
		$("#nav-detail").removeClass('nav-tbl-td-off');
	}
});

$("#secret").click(function() {
	var $passwd = $("<input type='password' class='w3-input w3-margin-top w3-margin-bottom' id='passwd' name='askPassword' placeholder='패스워드를 입력해주세요.' required>");
	
	if($("#secret").is(":checked")) {
		$('#secret').before($passwd);
	}
	else {
		$('#passwd').remove();
	}
});

</script>
</body>
</html>