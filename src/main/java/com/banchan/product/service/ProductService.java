package com.banchan.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.banchan.product.model.ProductDAO;
import com.banchan.product.model.ProductVO;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Service
public class ProductService {
	
	@Autowired
	ProductDAO dao;
	
	public ProductService() {
		log.info("ProductService()...");
	}
	public List<ProductVO> selectAll() {
		return dao.selectAll();
	}

	public List<ProductVO> searchList(String searchKey, String searchWord) {
		return dao.searchList(searchKey, searchWord);
	}
	
	public ProductVO selectOne(ProductVO vo) {
		return dao.selectOne(vo);
	}

	public int insert(ProductVO vo) {
		return dao.insert(vo);
	}

	public int update(ProductVO vo) {
		return dao.update(vo);
	}

	public int delete(ProductVO vo) {
		return dao.delete(vo);
	}
	public List<ProductVO> selectCategory(ProductVO vo) {
		return dao.selectCategory(vo);
	}


}
