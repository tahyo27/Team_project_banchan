package idle.com.banchan.cart.model;

import java.util.List;

public interface CartDAO {
	
	public int insert(CartVO vo); // 장바구니에 넣기

	public int delete(CartVO vo); // 장바구니 목록 삭제

	public int update(CartVO vo); // 상품 수량 변경
	
	public List<CartVO> selectAll(CartVO vo); // 장바구니 목록 리스트



}
