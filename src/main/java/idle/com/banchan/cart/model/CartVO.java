package idle.com.banchan.cart.model;

import lombok.Data;

@Data
public class CartVO {
	
	private int num;
	private int product_num;
	private String product_name;
	private String product_img;
	private int product_price;
	private String member_id;
	private int amount;
	

}
