<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RippleShop</title>
</head>

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

.file_input label {
    position:relative;
    cursor:pointer;
    display:inline-block;
    vertical-align:middle;
    overflow:hidden;
    width:100px;
    height:30px;
    background:#777;
    color:#fff;
    text-align:center;
    line-height:30px;
}
.file_input label input {
    position:absolute;
    width:0;
    height:0;
    overflow:hidden;
}
.file_input input[type=text] {
    vertical-align:top;
    display:inline-block;
    width:463px;
    height:30px;
    line-height:28px;
    font-size:11px;
    padding:0;
    border:0;
    border:1px solid #777;
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
</style>

<body>
	<!-- 문의하기 모달 -->
	<div class="w3-left">
		<a style="font-size:20px; padding-left: 15px;">
			<b>상품후기</b>
		</a>
	</div>
	<br/><br/>

	<form class="w3-container" action="reviewRegist.jsp" method="post" autocomplete="off">
	<div class="w3-section">
        
		<select class="w3-select w3-margin-bottom" name="reviewScore">
			<option value="0">평점을 선택해주세요.</option>
			<option value="1">★☆☆☆☆</option>
			<option value="2">★★☆☆☆</option>
			<option value="3">★★★☆☆</option>
			<option value="4">★★★★☆</option>
			<option value="5">★★★★★</option>
		</select>
                
		<textarea class="w3-input w3-border" placeholder="상품후기 내용을 적어주세요." rows="10" name="reviewContent" required></textarea>
            
		<div class="file_input w3-margin-bottom w3-left" style="margin-top: 10px;">
			<label>
				이미지 업로드
				<input type="file" onchange="javascript:document.getElementById('file_route').value=this.value">
			</label>
			<input type="text" readonly="readonly" title="File Route" id="file_route">
		</div>
        
		<input type="hidden" name="purchase_num" value="<%= request.getParameter("purchase_num") %>" />
		
		<input type="submit" class="w3-button w3-block w3-section w3-padding btn-submit" style="color: #fff;" value="등록">
	</div>
	</form>

	<div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
		<button onclick="window.close()" type="button" class="w3-button w3-red btn-radius w3-left">취소</button>
		<span class="w3-right w3-padding w3-hide-small">
		</span>
	</div>
</body>
</html>