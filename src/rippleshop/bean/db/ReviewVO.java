package rippleshop.bean.db;

import java.sql.Date;

public class ReviewVO {
	private String email;
	private int product_num;
	private int purchase_num;
	private int star_score;
	private String content;
	private String review_img;
	private Date review_date;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}
	public int getPurchase_num() {
		return purchase_num;
	}
	public void setPurchase_num(int purchase_num) {
		this.purchase_num = purchase_num;
	}
	public int getStar_score() {
		return star_score;
	}
	public void setStar_score(int star_score) {
		this.star_score = star_score;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReview_img() {
		return review_img;
	}
	public void setReview_img(String review_img) {
		this.review_img = review_img;
	}
	public Date getReview_date() {
		return review_date;
	}
	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}

}
