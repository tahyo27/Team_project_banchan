package com.banchan.order.model;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class OrderVO {
	private int num;
	private int member_num;
	private Date order_date;
	private String order_status;
	private int order_amount;
	private int order_del;
	private int order_total;

	private List<OrderDetailVO> details;
}
