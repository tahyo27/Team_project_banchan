package com.banchan.review.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.banchan.cart.model.CartVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class ReviewDAOimpl implements ReviewDAO {

	@Autowired
	SqlSession sqlSession;
	
	public ReviewDAOimpl() {
		log.info("ReviewDAOimpl()...");
	}

	@Override
	public int insert(ReviewVO vo) {
		log.info("insert()...{}",vo);
		
		return sqlSession.insert("RE_INSERT", vo);
	}

	@Override
	public List<ReviewVO> selectAll(ReviewVO vo) {
		log.info("selectAll()...{}",vo);
		
		return sqlSession.selectList("RE_SELECT_ALL", vo);
	}

	@Override
	public int delete(ReviewVO vo) {
		log.info("delete()...{}",vo);
		
		return sqlSession.delete("RE_DELETE", vo);
	}

	@Override
	public List<ReviewVO> selectAllTotal(ReviewVO rvo) {
		log.info("selectAll()...{}",rvo);
		
		return sqlSession.selectList("RE_SELECT_ALL_TOTAL", rvo);
		
		
	}
	
}
