<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.NumberFormat"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RippleShop</title>
</head>

<jsp:useBean id="api" class="rippleshop.bean.api.ApiBean" />
<jsp:useBean id="dao" class="rippleshop.bean.db.RippleShopDAO" />

<body>
<!-- top.jsp 파일 Include -->
<jsp:include page="top.jsp" flush="false" />

<!-- 배너 -->
<header class="w3-display-container" style="max-width:2000px;">
    <br><br>
    <div class="mySlides w3-display-container w3-center">
        <img class="w3-image" src="imgs/banners/banner_first.jpg" style="width:100%;">
        <div class="w3-display-bottomleft w3-margin-bottom w3-center">
            <h1 class="w3-xxlarge w3-text-white">
                <span class="w3-padding w3-yellow w3-opacity-min w3-hide-small">
                    <b>Welcome to RippleShop!</b>
                </span>
            </h1>
        </div>
    </div>
        
    <div class="mySlides w3-display-container w3-center">
        <img class="w3-image" src="imgs/banners/banner_second.jpg" style="width:100%;">
    </div>
        
    <div class="mySlides w3-display-container w3-center">
        <img class="w3-image" src="imgs/banners/banner_third.jpg" style="width:100%;">
    </div>
</header>

<!-- 내용 시작 -->
<%
	int xrp_price = api.getCurrentPriceXRP();
%>
<div class="w3-content" style="max-width:1500px;">
        
    <!-- 인기상품 항목 -->
    <div class="w3-container" style="padding-top:0px; padding-bottom:8px">
        <div class="w3-hide-small" style="padding-top:48px;">
        </div>
        <h3 class="w3-border-bottom w3-border-light-grey w3-padding-8" style="padding-top:0;">
            인기상품
        </h3>
    </div>
        
    <div class="w3-row-padding">
    
    <%
    for(int i=0; i<dao.readAllProduct().size(); i++) {
    	double product_xrp_price = (double)dao.readAllProduct().get(i).getProduct_price() / xrp_price;
    	product_xrp_price = Math.round(product_xrp_price * 1000000) / 1000000.0;
    	
    	double discount_price = Math.floor(product_xrp_price) - 2;
    	
    	int product_num = dao.readAllProduct().get(i).getProduct_num();
    	String product_name = dao.readAllProduct().get(i).getProduct_name();
    	String intro_img = dao.readAllProduct().get(i).getIntro_img();
    	String delivery_if = dao.readAllProduct().get(i).getDelivery_if();
    	
    	String product_price = NumberFormat.getInstance().format(dao.readAllProduct().get(i).getProduct_price());
    	
    	out.print("<div class='w3-col l2 s6 w3-container' style='margin-bottom:15px;'>");
    	out.print("<div class='w3-display-container w3-border w3-hover-border-red' style='padding-right:0; padding-left:0; padding-top:0; background-color:#F9F9F9;'>");
    	out.print("<a href='productDetail.jsp?product_num=" + product_num + "' style='text-decoration:none'>");
    	        
    	out.print("<div class='w3-display-topleft w3-red w3-text-white w3-padding'>BEST</div>");
    	
    	out.print("<img src='imgs/products/" + intro_img + "' style='width:100%'><br><br>");
    	out.print("<p class='stringHidden' style='padding-left:10px; padding-right:10px; margin-bottom:0px; font-size:15px;'><b>" + product_name + "</b><br><br>");
    	out.print("<b class='w3-text-grey' style='font-size:12px;'>판매가 &nbsp" + product_price + " KRW</b><br>");
    	out.print("<b style='font-size:15px;'>시세가 &nbsp" + product_xrp_price + " XRP</b><br>");
    	out.print("<b class='w3-text-red' style='font-size:15px;'>할인가</b> &nbsp");
    	out.print("<b class='w3-text-red' style='font-size:25px;'>" + (int)discount_price + "</b><b class='w3-text-red' style='font-size:15px;'> XRP ~</b></p>");
    	out.print("<hr style='margin:0;'>");
    	out.print("<p style='margin-top:3px; margin-bottom:7px; padding-left:10px;'><a class='optionFont'>" + delivery_if + "</a></p>");
    	        
    	out.print("</a>");
    	out.print("</div>");
    	out.print("</div>");
    }
    %>
    </div>
</div>
<!-- 내용 끝 -->

<!-- 하단 -->
<footer class="w3-center w3-black w3-padding-16 w3-margin-top">
    <p>Contacted by
        <a href="index.jsp" title="www.rippleshop.com" target="_blank" class="w3-hover-text-green" style="text-decoration:none">
            www.RippleShop.com
        </a>
    </p>
</footer>

<script>
    //document.getElementById("myBtn").click(); 
    // 안씀, 그러나 필요할 수도 있음
    
    // 배너 슬라이드 효과 - 3.5초 간격
    var myIndex = 0;
    carousel();

    function carousel() {
        var i;
        var x = document.getElementsByClassName("mySlides");
            
        for (i = 0; i < x.length; i++) 
        {
            x[i].style.display = "none";
        }
        myIndex++;
            
        if (myIndex > x.length)
        {
            myIndex = 1
        }
            
        x[myIndex-1].style.display = "block";
        setTimeout(carousel, 3500);
    }
</script>

</body>
</html>