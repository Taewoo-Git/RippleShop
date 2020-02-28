<%@page import="java.util.Random"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="rippleshop.bean.db.ProductVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RippleShop</title>
</head>

<link rel="stylesheet" type="text/css" href="css/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
    
<script src="js/jquery-3.3.1.min.js"></script>

<style>
    a,.w3-sidebar {font-family: "Roboto", sans-serif}
    body,h1,h2,h3,h4,h5,h6,.w3-wide {font-family: "Montserrat", sans-serif;}
    .stringHidden {white-space: nowrap; overflow: hidden; text-overflow: ellipsis;}
    .freeDelivery {background-color: darkgrey; color: white; font-size: 11px; font-family: "돋움", sans-serif; padding: 2px;}
</style>

<jsp:useBean id="api" class="rippleshop.bean.api.ApiBean" />
<jsp:useBean id="dao" class="rippleshop.bean.db.RippleShopDAO" />

<body class="w3-content" style="max-width:1500px">
<%
int xrp_price = api.getCurrentPriceXRP();
	
String pCode = request.getParameter("pCode");
List<ProductVO> list = dao.readCategoryProduct(pCode);
%>
<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-bar-block w3-white w3-collapse w3-top" style="z-index:3;width:250px" id="mySidebar">
    
  <div class="w3-container w3-display-container w3-padding-16">
    <i onclick="w3_close()" class="fa fa-remove w3-hide-large w3-button w3-display-topright"></i>
    <h3 class="w3-wide"><a href="index.jsp" style="text-decoration:none"><b>RIPPLE SHOP</b></a></h3>
  </div>
    
  <div class="w3-padding-64 w3-large w3-text-grey" style="font-weight:bold">
      
    <a href="#" class="w3-bar-item w3-button">패션의류/잡화</a>
      
    <a href="#" class="w3-bar-item w3-button">문구/오피스</a>
      
    <a onclick="myAccFunc()" href="javascript:void(0)" class="w3-button w3-block w3-white w3-left-align" id="myBtn">식품</a>
      
    <div id="demoAcc" class="w3-bar-block w3-hide w3-padding-large w3-medium">
      <a onclick="menuClick(this.id)" href="productList.jsp?pCode=C01" class="w3-bar-item w3-button" id="C01">과일</a>
      <a onclick="menuClick(this.id)" href="productList.jsp?pCode=C02" class="w3-bar-item w3-button" id="C02">생수/음료</a>
      <a onclick="menuClick(this.id)" href="productList.jsp?pCode=C03" class="w3-bar-item w3-button" id="C03">커피/원두/차</a>
      <a onclick="menuClick(this.id)" href="productList.jsp?pCode=C04" class="w3-bar-item w3-button" id="C04">과자/간식</a>
      <a onclick="menuClick(this.id)" href="productList.jsp?pCode=C05" class="w3-bar-item w3-button" id="C05">면/통조림/가공식품</a>
    </div>
      
    <a href="#" class="w3-bar-item w3-button">주방용품</a>
      
    <a href="#" class="w3-bar-item w3-button">생활용품</a>
      
  </div>
</nav>

<!-- Top menu on small screens -->
<header class="w3-bar w3-top w3-hide-large w3-black w3-large" style='padding-left:15px; padding-right:15px;'>
  <a href="javascript:void(0)" class="w3-bar-item w3-button w3-left" onclick="w3_open()"><i class="fa fa-bars"></i></a>
  <div class="w3-bar-item w3-wide"><a href="index.jsp" style="text-decoration:none">RIPPLE SHOP</a></div>
</header>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:250px">

  <!-- Push down content on small screens -->
  <div class="w3-hide-large" style="margin-top:83px"></div>
  
  <!-- Top header -->
  <header class="w3-container w3-xlarge">
    <p class="w3-left" id="content_title"></p>
    <p class="w3-right">
      <i class="fa fa-shopping-cart w3-margin-right"></i>
      <i class="fa fa-search"></i>
    </p>
  </header>

  <!-- Product grid -->
  <div class="w3-row-padding">
          <%
          for(int i=0; i<list.size(); i++) {
        	  double product_xrp_price = (double)list.get(i).getProduct_price() / xrp_price;
        	  product_xrp_price = Math.round(product_xrp_price * 1000000) / 1000000.0;

        	  double discount_price = Math.floor(product_xrp_price) - 2;

        	  String product_price = NumberFormat.getInstance().format(list.get(i).getProduct_price());

        	  double discount_percent = Math.round(((product_xrp_price - discount_price) / product_xrp_price) * 100);

        	  Random rand = new Random();
        	  double fee = (rand.nextInt(9000) + 1000) * 0.00001;
        	  double last_price = discount_price + fee;
        	  
        	  out.print("<div class='w3-col l3 s6 w3-container' style='margin-bottom:15px;'>");
        	  out.print("<div class='w3-container w3-border w3-hover-border-red' style='padding-right:0; padding-left:0; padding-top:0; background-color:#F9F9F9;'>");
        	  out.print("<a href='productDetail.jsp?product_num=" + list.get(i).getProduct_num() + "' style='text-decoration:none'>");
        	  out.print("<img src='imgs/products/"+list.get(i).getIntro_img()+"' style='width:100%'>");
        	  out.print("<p class='stringHidden' style='padding-left:10px; padding-right:10px; margin-bottom:0px;'>"+list.get(i).getProduct_name()+"<br><br>");
        	  out.print("<b class='w3-text-grey' style='font-size:11px;'>판매가 &nbsp"+product_price+" KRW</b><br>");
        	  out.print("<b style='font-size:15px;'>시세가 &nbsp"+product_xrp_price+" XRP</b><br>");
        	  out.print("<b class='w3-text-red' style='font-size:15px;'>할인가</b> &nbsp<b class='w3-text-red' style='font-size:25px;'>"+(int)discount_price+"</b><b class='w3-text-red' style='font-size:15px;'> XRP ~</b></p>");
        	  out.print("<hr style='margin:0;'>");
        	  out.print("<p style='margin-top:3px; margin-bottom:3px; padding-left:10px;'><a class='freeDelivery'>"+list.get(i).getDelivery_if()+"</a></p>");
        	  out.print("</a>");
        	  out.print("</div>");
        	  out.print("</div>");
          }
          %>
  </div>
</div>

<script>
document.getElementById("myBtn").click();
    
// 상세 메뉴 및 타이틀
var x = document.getElementById("<%=pCode%>");
var title =x.innerHTML;
var menu_select_icon = document.createElement("i");
menu_select_icon.className = "fa fa-caret-right w3-margin-right";    
    
if(x.className.indexOf("w3-light-grey") == -1){
    for(i=1; i<6; i++){
        var rm = document.getElementById("C0"+i);
        rm.className = x.className.replace(" w3-light-grey", "");
        $('i.fa-caret-right').remove();
    }
        
    x.className += " w3-light-grey";
    x.prepend(menu_select_icon);
    document.getElementById('content_title').innerHTML = title;
}

function myAccFunc() {
    var menu_select_icon = document.createElement("i");
    menu_select_icon.className = "w3-margin-left fa fa-caret-down";
    
    var x = document.getElementById("demoAcc");
    var y = document.getElementById("myBtn");
    
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
        y.append(menu_select_icon);
    } else {
        x.className = x.className.replace(" w3-show", "");
        $('i.fa-caret-down').remove();
    }
}

// Open and close sidebar
function w3_open() {
  document.getElementById("mySidebar").style.display = "block";
  document.getElementById("myOverlay").style.display = "block";
}
 
function w3_close() {
  document.getElementById("mySidebar").style.display = "none";
  document.getElementById("myOverlay").style.display = "none";
}
</script>

</body>
</html>
</body>
</html>