<%@page import="java.util.List"%>
<%@page import="rippleshop.bean.db.ReviewVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RippleShop</title>
</head>
<jsp:useBean id="dao" class="rippleshop.bean.db.RippleShopDAO" />
<body>
	<%
	int product_num = Integer.parseInt(request.getParameter("product_num"));

	int review_page = Integer.parseInt(request.getParameter("review_page"));
	
	int review_num = dao.readReviewNum(product_num); 
    
    int num_per_page = 5;
    int page_per_block = 3;
    
    int first = num_per_page*(review_page-1);
    
    int total_page = (int)Math.ceil((double)(review_num-1)/num_per_page);
    
    int block = (int)Math.ceil((double)review_page/page_per_block);
    
    int total_block = (int)Math.ceil((double)total_page/page_per_block);
    
    int first_page = (block-1)*page_per_block;
    
    int last_page = block*page_per_block;
    
    if(block >= total_block) last_page = total_page;
    
    List<ReviewVO> list = dao.readReviewList(product_num, first, num_per_page);
	%>
	<table width="100%">
		<tr>
    		<th width="15%" bgcolor="#FAFAFA" style="text-align: center; padding: 5px">
    		평점
    		</th>
    		<th width="50%" bgcolor="#FAFAFA" style="text-align: center;">
    		내용
    		</th>
    		<th width="13%" bgcolor="#FAFAFA" style="text-align: center;">
    		작성자
    		</th>
    		<th bgcolor="#FAFAFA" style="text-align: center;">
    		작성일
    		</th>
   		</tr>
   		<%
   		if(list.size() == 0) {
   			out.print("<tr><td colspan='4' style='padding: 8px;''>상품후기가 없습니다.</td></tr>");
   		}
   		else {
   			for(int i=0; i<list.size(); i++) {
   		%>
		   		<tr class="last-border">
		   			<td style="font-size: 13px;">
			   			<div>
			   			<%
			   			int star_rest = 5 - list.get(i).getStar_score();
			   			
			   			for(int j=0; j<list.get(i).getStar_score(); j++) {
			   				out.print("<span class='fa fa-star checked'></span>");
			   			}
			   			
			   			for(int j=0; j<star_rest; j++) {
			   				out.print("<span class='fa fa-star'></span>");
			   			}
			   			%>
			   			</div>
		   			</td>
		   			
		   			<td style="font-size: 13px; text-align: left; padding: 8px;">
		   				<table>
			   				<tr style="border: 0px;">
			   					<% if(list.get(i).getReview_img() != null) { %>
				   				<td>
				   					<img src='imgs/review/<%= list.get(i).getReview_img() %>' width="100" height="100">
				   				</td>
				   				<% } %>
				   				
				   				<td style="padding-left: 10px;">
				   					<%= list.get(i).getContent() %>
				   				</td>
			   				</tr>
		   				</table>
		   				
		   				
		   			</td>
		   			
		   			<td style="font-size: 13px;">
		   				<%= list.get(i).getEmail().substring(0, 4) %>****
		   			</td>
		   			
		   			<td style="font-size: 13px;">
		   				<%= list.get(i).getReview_date() %>
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
			out.print("<a href='?product_num="+product_num+"&review_page="+beforPage+"#review' class='btn-font w3-button w3-margin-top'>< 이전</a>");
	   	}
	   	
	   	for(int direct_page = first_page+1; direct_page <= last_page; direct_page++) {
	   		if(review_page == direct_page) {
	   			out.print("<a class='btn-font w3-button w3-margin-top page-check'>"+direct_page+"</a>");
	   		}
	   		else {
	   			out.print("<a href='?product_num="+product_num+"&review_page="+direct_page+"#review' class='btn-font w3-button w3-margin-top'>"+direct_page+"</a>");
	   		}
	   	}
	   	
	   	if(block < total_block) {
			int nextPage = last_page+1;
	   		out.print("<a href='?product_num="+product_num+"&review_page="+nextPage+"#review' class='btn-font w3-button w3-margin-top'>다음 ></a>");
	   	}
	   	%>
	   	</div>
	<%
	}
	%>
</body>
</html>