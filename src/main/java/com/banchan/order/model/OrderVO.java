package com.banchan.order.model;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class OrderVO {
	private int num;
	private int member_num;
	private Date order_date;
	private String status;

	private String receiver_name;
	private String tel;
	private String zipcode;
	private String address1;
	private String address2;
	private String memo;

	private int order_price;
	private int delivery_fee;
	private int discount_coupon;
	private int use_point;
	private int total_price;

	private String product_name;
	private int count;

	private List<OrderDetailVO> details;
}
