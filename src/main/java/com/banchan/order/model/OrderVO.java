package com.banchan.order.model;

import java.sql.Date;
import java.util.List;

public class OrderVO {
	private int num;
	private int memberNum;
	private Date orderDate;
	private String orderStatus;
	private int orderAmount;
	private int orderDel;
	private int orderTotal;

	private List<OrderDetailVO> details;
}
