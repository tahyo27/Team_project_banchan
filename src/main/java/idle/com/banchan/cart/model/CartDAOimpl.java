package idle.com.banchan.cart.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class CartDAOimpl implements CartDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	
	public CartDAOimpl() {
		log.info("CartDAOimpl()...");
	}
	
	
	@Override
	public int insert(CartVO vo) {
		log.info("insert()...{}",vo);
		
		int flag = sqlSession.insert("C_INSERT",vo);
		
		return flag;
	}


	@Override
	public int delete(CartVO vo) {
		log.info("delete()...{}",vo);
		
		int flag = sqlSession.delete("C_DELETE",vo);
		
		return flag;
	}

	@Override
	public List<CartVO> selectAll(CartVO vo) {
		log.info("selectAll()...{}",vo);
		
		List<CartVO> vos = sqlSession.selectList("C_SELECT_ALL",vo);
		
		return vos;
	}


	@Override
	public int update(CartVO vo) {
		log.info("update()...{}",vo);
		
		int flag = sqlSession.update("C_UPDATE", vo);
		
		return flag;
	}


	@Override
	public int sumMoney(CartVO vo) {
		log.info("sumMoney()...{}",vo);
		
		int flag = sqlSession.selectOne("C_SUM_MONEY", vo);
		
		return flag;
	}


	@Override
	public int countCheck(CartVO vo) {
		log.info("countCheck()...{}",vo);
		
		return sqlSession.selectOne("C_COUNT_CHECK", vo);
	}


	@Override
	public int updateCart(CartVO vo) {
		log.info("updateCart()...{}",vo);
		
		return sqlSession.update("C_COUNT_UPDATE",vo);
	}



	
	
	
}
