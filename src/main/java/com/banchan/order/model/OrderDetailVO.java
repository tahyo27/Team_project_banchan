package com.banchan.order.model;

import lombok.Data;

@Data
public class OrderDetailVO {
	private int num;
	private int order_num;

	private int product_num;
	private String product_name;
	private String product_img;

	private int amount;
	private int price;
}
