package com.banchan.review.model;

import java.sql.Date;

import lombok.Data;

@Data
public class ReviewVO {

	private int num;
	private int product_num;
	private String member_id;
	private Date wdate;
	private String review_content;
	private double review_rating;
	
	private String product_name;
	
	
}
