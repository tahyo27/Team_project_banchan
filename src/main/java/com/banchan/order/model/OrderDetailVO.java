package com.banchan.order.model;

import lombok.Data;

@Data
public class OrderDetailVO {
	private int num;
	private int product_num;
	private int order_num;
	private int amount;
	private int price;
}
