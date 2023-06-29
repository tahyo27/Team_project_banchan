package idle.com.banchan.cart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import idle.com.banchan.cart.model.CartDAO;
import idle.com.banchan.cart.model.CartVO;
import idle.com.banchan.member.model.MemberVO;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Service
public class CartService {
	
	@Autowired
	CartDAO dao;
	
	public CartService() {
		log.info("CartService()...");
	}
	
	public List<CartVO> selectAll(CartVO vo) {
		return dao.selectAll(vo);
	}
	
	public int insert(CartVO vo) { 
		return dao.insert(vo);
	}

	public int delete(CartVO vo) {
		return dao.delete(vo);
	}



}
