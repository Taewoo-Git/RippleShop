<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nanum+Gothic">

<link rel="stylesheet" type="text/css" href="css/w3.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<meta charset="UTF-8">
<title>RippleShop</title>
</head>

<script src="js/jquery-3.3.1.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>

<style>
body
{
background-image:url('imgs/signup_bg.jpg');
background-repeat:no-repeat;
background-size: 100%;
}

.font-mont {font-family: "Montserrat", sans-serif;}
.font-nanum {font-family: 'Nanum Gothic', sans-serif;}

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
  background-image: linear-gradient(to left, #74ebd5, #9face6); }
  
.post-input{padding:8px;border:none;border-bottom:1px solid #ccc;width:30%}
.post-btn{border-radius:5px; padding:8px;border:none;border-bottom:1px solid #ccc;width:10%}
</style>

<body>

	<div style="min-height:100vh;">
		<div class="w3-container w3-content w3-card w3-white w3-margin-top w3-round-large" style="max-width:600px;">
		  <form method="post" action="signup.jsp" id="signupForm" onsubmit="return signup_check()">
		      <h2 class="font-mont">SIGN UP</h2><br>
		      
		      <div class="w3-section">
		          <input type="email" class="w3-input w3-border" name="email" placeholder="이메일 주소 입력" required/>
		      </div>
		      
		      <div class="w3-section">
		          <input type="password" class="w3-input w3-border" name="password" id="password" placeholder="비밀번호(8~32자리)" required/>
		      </div>
		      
		      <div class="w3-section">
		          <input type="password" class="w3-input w3-border" name="re_password" id="re_password" placeholder="비밀번호 재입력" required/>
		      </div>
		      
		      <div class="w3-section">
		          <input type="text" class="w3-input w3-border" name="name" placeholder="이름을 입력해주세요." required/>
		      </div>
		      
		      <div class="w3-section">
		          <input type="text" class="w3-input w3-border" name="phone" placeholder="전화번호를 입력해주세요." required/>
		      </div>
		      
		      <div class="w3-section">
			      <input type="text" id="postcodify_search_input" name="zip" class="post-input w3-border postcodify_postcode5" placeholder="우편번호" readonly required/>
			      <input id="postcodify_search_button" class="w3-button w3-dark-grey post-btn" value="검색">
			      <input type="text" id="postcodify_search_addr" name="address" class="w3-input w3-border postcodify_address w3-margin-top" placeholder="도로명 주소" readonly required/>
			      <input type="text" name="address_details" class="w3-input w3-border postcodify_details w3-margin-top" placeholder="상세 주소" required/>
		      </div>
				      
		      <div class="w3-section">
		          <input type="checkbox" name="agree-term" id="agree-term" class="w3-check"/>
		          <label for="agree-term" class="font-nanum"><a href="#" class="font-nanum">이용약관</a>에 동의합니다.</label>
		      </div>
		      
		      <div class="w3-section">
		          <input type="submit" class="w3-button w3-block w3-section w3-padding btn-submit" value="등록"/>
		      </div>
		  </form>
		  
		  <p class="w3-section font-nanum">
		      계정이 이미 있으신가요 ? <a href="index.jsp" class="font-nanum">돌아가기</a>
		  </p>
		</div>
	</div>
	
	<footer class="w3-center w3-black w3-padding-16 w3-margin-top">
	    <p>Contacted by
	        <a href="index.jsp" title="www.rippleshop.com" target="_blank" class="w3-hover-text-green" style="text-decoration:none">
	            www.RippleShop.com
	        </a>
	    </p>
	</footer>
	
	<script> $(function() { $("#postcodify_search_input").postcodifyPopUp(); }); </script>
	<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
	<script> $(function() { $("#postcodify_search_addr").postcodifyPopUp(); }); </script>
	
	<script>
	function signup_check() {
		
		if($("#password").val() != ($("#re_password").val())){ 
		      alert("비밀번호가 일치하지 않습니다.");
		      $("#password").val("");
		      $("#re_password").val("");
		      $("#password").focus();
		      return false;
		}
		
		if($("#password").val().length < 8 || $("#password").val().length > 32){ 
		      alert("비밀번호를 8~32자까지 입력해주세요.");
		      $("#password").val("");
		      $("#re_password").val("");
		      $("#password").focus();
		      return false;
		}
	}
	</script>
</body>
</html>