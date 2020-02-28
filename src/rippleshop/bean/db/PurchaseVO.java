package rippleshop.bean.db;

import java.sql.Date;
import java.sql.Timestamp;

public class PurchaseVO {
	private int purchase_num;
	private String email;
	private int product_num;
	private int amount;
	private double price;
	private String memo;
	private Date purchase_date;
	private String deposit_chk;
	
	private String product_name;
	private String intro_img;
	
	public int getPurchase_num() {
		return purchase_num;
	}
	public void setPurchase_num(int purchase_num) {
		this.purchase_num = purchase_num;
	}
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
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public Date getPurchase_date() {
		return purchase_date;
	}
	public void setPurchase_date(Date purchase_date) {
		this.purchase_date = purchase_date;
	}
	public String getDeposit_chk() {
		return deposit_chk;
	}
	public void setDeposit_chk(String deposit_chk) {
		this.deposit_chk = deposit_chk;
	}
	
	
	
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getIntro_img() {
		return intro_img;
	}
	public void setIntro_img(String intro_img) {
		this.intro_img = intro_img;
	}
}
