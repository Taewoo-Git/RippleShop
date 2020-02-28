<%@page import="rippleshop.bean.db.AskVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RippleShop</title>
</head>
<script src="js/jquery-3.3.1.min.js"></script>

<jsp:useBean id="dao" class="rippleshop.bean.db.RippleShopDAO" />
<body>
	<%
	int product_num = Integer.parseInt(request.getParameter("product_num"));

	int ask_page = Integer.parseInt(request.getParameter("ask_page"));
	
	int ask_num = dao.readAskNum(product_num); 
    
    int num_per_page = 5;
    int page_per_block = 3;
    
    int first = num_per_page*(ask_page-1);
    
    int total_page = (int)Math.ceil((double)(ask_num-1)/num_per_page);
    
    int block = (int)Math.ceil((double)ask_page/page_per_block);
    
    int total_block = (int)Math.ceil((double)total_page/page_per_block);
    
    int first_page = (block-1)*page_per_block;
    
    int last_page = block*page_per_block;
    
    if(block >= total_block) last_page = total_page;
    
	List<AskVO> list = dao.readAskList(product_num, first, num_per_page);
	%>
	<table width="100%">
   		<tr>
    		<th width="15%" bgcolor="#FAFAFA" style="text-align: center; padding: 5px">
    		답변상태
    		</th>
    		<th width="50%" bgcolor="#FAFAFA" style="text-align: center;">
    		제목
    		</th>
    		<th bgcolor="#FAFAFA" style="text-align: center;">
    		작성자
    		</th>
    		<th bgcolor="#FAFAFA" style="text-align: center;">
    		작성일
    		</th>
   		</tr>
   		<%
   		if(list.size() == 0) {
   			out.print("<tr><td colspan='4' style='padding: 8px;''>상품문의가 없습니다.</td></tr>");
   		}
   		else {
   			for(int i=0; i<list.size(); i++) {
   		%>
   		<tr class="last-border" id="ask_<%= list.get(i).getAsk_num() %>">
   			<td style="font-size: 13px;">
   			<% 
   			if(list.get(i).getReply() == null) out.print("답변대기");
   			else out.print("<b>답변완료</b>");
   			%>
   			</td>
   			<td style="font-size: 13px; text-align: left; padding: 8px;">
   			<%
   			if(list.get(i).getPassword() == null) {
   				if(list.get(i).getReply() == null) {
   					out.print(list.get(i).getTitle());
   				}
   				else {
   					out.print("<a style=\"text-decoration:none\" href=\"JavaScript:open_reply('"+list.get(i).getAsk_num()+"')\">" + list.get(i).getTitle() + "</a>");
   				}
   			}
   			else {
   				if(list.get(i).getReply() == null) {
   					out.print("<font color='#BDBDBD'>비밀 글입니다. <i class='fa fa-lock'></i></font>");
   				}
   				else {
   					out.print("<a style=\"text-decoration:none\" href=\"JavaScript:open_reply_secret('" +list.get(i).getAsk_num()+"')\">"
   			   				+"<font color='#BDBDBD'>비밀 글입니다. <i class='fa fa-lock'></i></font></a>");
   				}
   			}
   			%>
   			</td>
   			<td style="font-size: 13px;">
   			<%= list.get(i).getWriter() %>
   			</td>
   			<td style="font-size: 13px;">
   			<%= list.get(i).getDate() %>
   			</td>
   		</tr>
   		<%
   			}
   		}
   		%>
    </table>
    
    <%
    if(list.size() != 0) {
    %>
	   	<div class="w3-center">
	   	<%
	   	if(block > 1) {
			int beforPage = first_page;
			out.print("<a href='?product_num="+product_num+"&ask_page="+beforPage+"#ask' class='btn-font w3-button w3-margin-top'>< 이전</a>");
	   	}
	   	
	   	for(int direct_page = first_page+1; direct_page <= last_page; direct_page++) {
	   		if(ask_page == direct_page) {
	   			out.print("<a class='btn-font w3-button w3-margin-top page-check'>"+direct_page+"</a>");
	   		}
	   		else {
	   			out.print("<a href='?product_num="+product_num+"&ask_page="+direct_page+"#ask' class='btn-font w3-button w3-margin-top'>"+direct_page+"</a>");
	   		}
	   	}
	   	
	   	if(block < total_block) {
			int nextPage = last_page+1;
	   		out.print("<a href='?product_num="+product_num+"&ask_page="+nextPage+"#ask' class='btn-font w3-button w3-margin-top'>다음 ></a>");
	   	}
	   	%>
	   	</div>
	<%
	}
	%>
	
	<script>
	function open_reply(ask_num) {
		var ask_id = "#ask_" + ask_num;
		
		if($(ask_id).hasClass('reply_click') === true) {
			$('#ask_content').remove();
			$('#ask_reply').remove();

			$(ask_id).removeClass('reply_click');
		}
		else {			
			$.ajax({
	            type : "GET",
	            url : "askData.jsp",
	            dataType : "text",
	            data: {
		        	num : ask_num
		        },
	            error : function(request, error){
	            	alert("AJAX ERROR");
	            	//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error)
	            },
	            success : function(response){
					var data = response.split("//");
	            	
	            	var $reply = $("<tr id='ask_content'><td style='background: #FAFAFA;'></td><td colspan='2' style='font-size: 13px; text-align: left; padding: 8px; background: #FAFAFA;'>"
	        				+data[0]+"</td><td style='background: #FAFAFA;'></td></tr><tr id='ask_reply'><td style='background: #FAFAFA;'></td><td style='font-size: 13px; text-align: left; padding: 8px; background: #FAFAFA;'>┗　"
	        				+data[1]+"</td><td style='background: #FAFAFA;'>판매자</td><td style='background: #FAFAFA;'></td></tr>");
	            	
	            	$(ask_id).after($reply);
	    			
	    			$(ask_id).addClass('reply_click');
	            }
	        });
		}
	}
	
	function open_reply_secret(ask_num) {
		var ask_id = "#ask_" + ask_num;
		
		if($(ask_id).hasClass('reply_click') === true) {
			$('#ask_content').remove();
			$('#ask_reply').remove();

			$(ask_id).removeClass('reply_click');
		}
		else {
			var passwd = prompt("패스워드를 입력해주세요.");
			
			$.ajax({
	            type : "POST",
	            url : "askSecret.jsp",
	            dataType : "text",
	            data: {
		        	num : ask_num,
	       			pwd : passwd
		        },
	            error : function(request, error){
	            	alert("AJAX ERROR");
	            	//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error)
	            },
	            success : function(response){
	            	if(response.trim().includes("fail")) {
	            		alert("패스워드가 일치하지 않습니다.");
					} 
					else {
						var data = response.split("//");
		            	
		            	var $reply = $("<tr id='ask_content'><td style='background: #FAFAFA;'></td><td colspan='2' style='font-size: 13px; text-align: left; padding: 8px; background: #FAFAFA;'>"
		        				+data[0]+"</td><td style='background: #FAFAFA;'></td></tr><tr id='ask_reply'><td style='background: #FAFAFA;'></td><td style='font-size: 13px; text-align: left; padding: 8px; background: #FAFAFA;'>┗　"
		        				+data[1]+"</td><td style='background: #FAFAFA;'>판매자</td><td style='background: #FAFAFA;'></td></tr>");
		            	
		            	$(ask_id).after($reply);
		    			
		    			$(ask_id).addClass('reply_click');
					}
	            }
	        });
		}
	}
	</script>
</body>
</html>