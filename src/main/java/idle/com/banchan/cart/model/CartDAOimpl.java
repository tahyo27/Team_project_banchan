package idle.com.banchan.cart.model;

import java.util.List;

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
		log.info("delete()...");
		
		int flag = sqlSession.delete("C_DELETE",vo);
		
		return flag;
	}

	@Override
	public List<CartVO> selectAll(CartVO vo) {
		log.info("selectAll()...{}",vo);
		
		List<CartVO> vos = sqlSession.selectList("C_SELECT_ALL",vo);
		
		return vos;
	}



	
	
	
}
