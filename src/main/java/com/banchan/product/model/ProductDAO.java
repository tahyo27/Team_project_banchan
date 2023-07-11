package com.banchan.product.model;

import java.util.List;

public interface ProductDAO {

	public List<ProductVO> selectAll();

	public List<ProductVO> searchList(String searchKey, String searchWord);

	public ProductVO selectOne(ProductVO vo);

	public int insert(ProductVO vo);

	public int update(ProductVO vo);

	public int delete(ProductVO vo);

	public List<ProductVO> selectCategory(ProductVO vo); // 카테고리 선택

}
