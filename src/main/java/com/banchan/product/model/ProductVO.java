package com.banchan.product.model;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Data
public class ProductVO {
	
	private int num;
	private int category_num;
	private String product_name;
	private String product_img;
	private int product_price;
	private int product_stock;
	private String product_content;
	private MultipartFile file;
	
	
}
