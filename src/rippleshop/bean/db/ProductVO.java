package rippleshop.bean.db;

public class ProductVO {
	private int product_num;
	private String category_code;
	private String delivery_code;
	private String product_name;
	private int product_amount;
	private int product_price;
	private int delivery_price;
	private int delivery_price_max;
	private String delivery_if;
	private String intro_img;
	private String main_img;
	
	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}
	public String getCategory_code() {
		return category_code;
	}
	public void setCategory_code(String category_code) {
		this.category_code = category_code;
	}
	public String getDelivery_code() {
		return delivery_code;
	}
	public void setDelivery_code(String delivery_code) {
		this.delivery_code = delivery_code;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getProduct_amount() {
		return product_amount;
	}
	public void setProduct_amount(int product_amount) {
		this.product_amount = product_amount;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public int getDelivery_price() {
		return delivery_price;
	}
	public void setDelivery_price(int delivery_price) {
		this.delivery_price = delivery_price;
	}
	public int getDelivery_price_max() {
		return delivery_price_max;
	}
	public void setDelivery_price_max(int delivery_price_max) {
		this.delivery_price_max = delivery_price_max;
	}
	public String getDelivery_if() {
		return delivery_if;
	}
	public void setDelivery_if(String delivery_if) {
		this.delivery_if = delivery_if;
	}
	public String getIntro_img() {
		return intro_img;
	}
	public void setIntro_img(String intro_img) {
		this.intro_img = intro_img;
	}
	public String getMain_img() {
		return main_img;
	}
	public void setMain_img(String main_img) {
		this.main_img = main_img;
	}

}
