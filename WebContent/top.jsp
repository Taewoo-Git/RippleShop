<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/w3.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Permanent+Marker">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nanum+Gothic">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Jua">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Archivo+Black">

<meta charset="UTF-8">

<title>RippleShop</title>

</head>

<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/ajaxLogin.js"></script>

<style>
    h1,h2,h3,h4,h5,h6,.w3-wide {
        font-family: "Montserrat", sans-serif;
    }
    body,a {
        font-family: 'Nanum Gothic', sans-serif;
    }
    .menuFont {
        font-family: 'Nanum Gothic', sans-serif;
        font-size: 13px;
    }
    .categoryFont {
        font-family: 'Jua', sans-serif;
    }
    .dynamicFont {
        font-family: 'Permanent Marker', cursive;
    }
    .optionFont {
        background-color: darkgrey;
        color: white;
        font-size: 11px; 
        font-family: "돋움", sans-serif;
        padding: 2px;
    }
    .stringHidden {
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }
    
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
    
    .btn-radius {border-radius:5px;}
</style>

<body>
<!-- 상단바 -->
<div class="w3-top">
    <!-- 상단바 왼쪽 메뉴 -->
    <div class="w3-bar w3-white w3-card w3-large" style='padding-left:15px; padding-right:15px;'>
        <div class="w3-dropdown-click w3-left">
            <a onclick="show_category()" class="w3-button">
                <i class="fa fa-bars"></i>
            </a>
            <div class="w3-dropdown-content w3-bar-block w3-card-category w3-border" style="width:200px;" id="category">
                <a class="w3-bar-item w3-button menuFont">패션의류/잡화</a>
                <a class="w3-bar-item w3-button menuFont">문구/오피스</a>
                <div id="myAccFunc">
                    <a class="w3-bar-item w3-button menuFont" id="myBtn">식품 <i class='fa fa-caret-down'></i></a>
                    <div id="demoAcc" class="w3-bar-block w3-hide w3-padding-small w3-medium">
                        <a href="productList.jsp?pCode=C01" class="w3-bar-item w3-button menuFont">과일</a>
                        <a href="productList.jsp?pCode=C02" class="w3-bar-item w3-button menuFont">생수/음료</a>
                        <a href="productList.jsp?pCode=C03" class="w3-bar-item w3-button menuFont">커피/원두/차</a>
                        <a href="productList.jsp?pCode=C04" class="w3-bar-item w3-button menuFont">과자/간식</a>
                        <a href="productList.jsp?pCode=C05" class="w3-bar-item w3-button menuFont">면/통조림/가공식품</a>
                    </div>
                </div>
                <a class="w3-bar-item w3-button menuFont">주방용품</a>
                <a class="w3-bar-item w3-button menuFont">생활용품</a>
                
                <div class="w3-hide-large w3-hide-medium w3-small">
                    <p style='margin-left:10px; margin-right:10px;' class="w3-border-bottom w3-border-light-grey"></p>
                        <a onclick="document.getElementById('login_modal').style.display='block'" class="w3-bar-item w3-button menuFont">로그인</a>
                        <a href="signupForm.jsp" class="w3-bar-item w3-button menuFont">회원가입</a>
                        <a href="#" class="w3-bar-item w3-button menuFont" onclick="ready()">고객센터</a>
                        <a href="#" class="w3-bar-item w3-button menuFont" onclick="ready()">장바구니</a>
                        <a href="#" class="w3-bar-item w3-button menuFont" onclick="ready()">검색</a>
                </div>
            </div>
        </div>

        <a href="index.jsp" class="w3-wide w3-bar-item" style="text-decoration:none;">
            <b>RIPPLE SHOP</b>
        </a>

        <!-- 상단바 오른쪽 메뉴, 사이즈 작아지면 사라짐 -->
        <div class="w3-right w3-hide-small" style="margin-bottom:-1px;">
        <%
        if(session.getAttribute("loginSession") == null) {
        	out.print("<a class='w3-button w3-padding-large menuFont' href='signupForm.jsp'>회원가입</a>");
        	out.print("<a onclick=\"document.getElementById('login_modal').style.display='block'\" class='w3-button w3-padding-large menuFont'>로그인</a>");
        }
        else {
        	out.print("<a href='logout.jsp' class='w3-button w3-padding-large menuFont' style='text-decoration:none'>로그아웃</a>");
        	out.print("<div class='w3-dropdown-click'><a class='w3-button w3-padding-large menuFont' onclick='show_userInfo()'>회원정보 <i class='fa fa-caret-down'></i></a>");
       	%>
       	<!-- 회원정보 메뉴 -->
        <div class="w3-dropdown-content w3-bar-block w3-card-category w3-border-top" style="width:80px; margin-top:-1px; padding:0px;" id="userInfo">
            <a class="w3-bar-item w3-button menuFont" href="purchaseCheck.jsp">주문/배송 조회</a>
            <a class="w3-bar-item w3-button menuFont" onclick="ready()">교환/반품 조회</a>
            <a class="w3-bar-item w3-button menuFont" onclick="ready()">회원정보 수정</a>
        </div>
       	<%
       	out.print("</div>");
       	}
        %>
        <a class="w3-button w3-padding-large menuFont" onclick="ready()">고객센터</a>
        
        <a class="w3-button" style="padding-top:8px; padding-bottom:9px;" onclick="ready()"><i class="fa fa-shopping-cart"></i></a>
        
        <a class="w3-button" style="padding-top:8px; padding-bottom:9px;" onclick="ready()"><i class="fa fa-search"></i></a>
        
        </div>
    </div>
</div>
    
<!-- 로그인 모달 -->
<div id="login_modal" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:600px">
        <div align="right" class="w3-black">
            <span onclick="document.getElementById('login_modal').style.display='none'" class="w3-button w3-large w3-black w3-display-top">×</span>
        </div>
        
        <div class="w3-center">
            <h1 class="dynamicFont" style="font-size:50px;">
                <b>Ripple Shop</b>
            </h1>
        </div>

        <form class="w3-container" action="login.jsp" method="post" name="loginForm" id="loginForm" autocomplete="off">
        <div class="w3-section">
            <input class="w3-input w3-border w3-margin-bottom" type="email" placeholder="이메일을 입력해주세요." name="loginEmail" id="loginEmail" required>
            <input class="w3-input w3-border" type="password" placeholder="비밀번호를 입력해주세요" name="loginPassword" id="loginPassword" required>
                        
            <div id="msg" style="color:red"></div>
                        
            <input type="button" class="w3-button w3-block w3-section w3-padding btn-submit" id="btnLogin" value="로그인">
        </div>
        </form>

        <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
            <button onclick="document.getElementById('login_modal').style.display='none'" type="button" class="w3-button w3-red btn-radius">취소</button>
            <span class="w3-right w3-padding w3-hide-small">
            </span>
        </div>
    </div>
</div>

<script>
function ready() {
	alert("준비 중입니다.");
}

//카테고리 항목 → 하위 항목 호버효과로 펼쳐 줌
$('#myAccFunc').hover(function() {
    var menu_select_icon = document.createElement("i");
    //menu_select_icon.className = "w3-margin-left fa fa-caret-down";
        
    var x = document.getElementById("demoAcc");
    var y = document.getElementById("myBtn");
        
    if (x.className.indexOf("w3-show") == -1)
    {
        x.className += " w3-show";
        //y.append(menu_select_icon);
    } 
    else 
    {
        x.className = x.className.replace(" w3-show", "");
        //$('i.fa-caret-down').remove();
    }
});
        
// 상단바에 있는 카데고리 펼쳐주는 효과
function show_category() {
    var x = document.getElementById("category");
        
    if (x.className.indexOf("w3-show") == -1)
    {
        x.className += " w3-show";
            
    }
    else
    {
        x.className = x.className.replace(" w3-show", "");
    }
}

function show_userInfo() {
    var x = document.getElementById("userInfo");
        
    if (x.className.indexOf("w3-show") == -1)
    {
        x.className += " w3-show";
            
    }
    else
    {
        x.className = x.className.replace(" w3-show", "");
    }
}

$('#loginPassword').keypress(function(event){
    if (event.which == 13) {
        $('#btnLogin').click();
        return false;
    }
});
</script>

</body>
</html>