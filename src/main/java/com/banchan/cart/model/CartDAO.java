package com.banchan.cart.model;

import java.util.List;

public interface CartDAO {
	
	public int insert(CartVO vo); // 장바구니에 넣기

	public int delete(CartVO vo); // 장바구니 목록 삭제

	public int update(CartVO vo); // 상품 수량 변경
	
	public List<CartVO> selectAll(CartVO vo); // 장바구니 목록 리스트

	public int sumMoney(CartVO vo); // 장바구니 합계 금액

	public int countCheck(CartVO vo); // 장바구니 상품 확인

	public int updateCart(CartVO vo); // 장바구니 상품 겹칠시 하나로 업데이트

	public int updateAll(CartVO vo); // 장바구니 전체 비우기



}
