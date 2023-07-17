package com.banchan.order.model;

import lombok.Data;

@Data
public class SearchOrderVO {
	private Integer member_num;
	private String start_date;
	private String end_date;
}
