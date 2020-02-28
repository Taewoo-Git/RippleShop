$(document).ready(function() {
	$('#btnLogin').click(function() {
		var currentPage = window.location.href;
		var action = $('#loginForm').attr("action");
		var loginData = {loginEmail: $('#loginEmail').val(), loginPassword: $('#loginPassword').val()};
		
		$.ajax({
			type: "POST",
			url: action,
			data: loginData,
			success: function(response) {
				if(response.trim().includes("success")) {
					window.location.href = "index.jsp";
				} 
				else {
					$('#msg').html("<p style='color:red'>아이디 또는 비밀번호가 틀렸습니다.</p>");
				}
			},
			error: function() {
				$('#msg').html("AJAX ERROR");
			}
		});
	});
});
