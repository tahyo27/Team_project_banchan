package com.banchan.order.model;

import lombok.Data;

@Data
public class OrderDetailVO {
	private int num;
	private int productNum;
	private int orderNum;
	private int amount;
	private int price;
}
