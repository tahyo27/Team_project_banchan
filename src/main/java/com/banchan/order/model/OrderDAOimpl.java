package com.banchan.order.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class OrderDAOimpl implements OrderDAO {

	@Autowired
	SqlSession sqlSession;

	@Override
	public int insert(OrderVO vo) {
		log.info("insert()...{}", vo);
		int flag = 0;

		try {
			flag = sqlSession.insert(NAMESPACE + "insertOrder", vo)
					+ sqlSession.insert(NAMESPACE + "insertOrderDetail", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;
	}

	@Override
	public int update(OrderVO vo) {
		log.info("update()...{}", vo);
		int flag = 0;

		try {
			flag = sqlSession.update(NAMESPACE + "update", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;
	}

	@Override
	public int delete(OrderVO vo) {
		log.info("delete()...{}", vo);
		int flag = 0;

		try {
			flag = sqlSession.delete(NAMESPACE + "delete", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;
	}

	@Override
	public OrderVO selectOne(OrderVO vo) {
		log.info("selectOne()...{}", vo);

		OrderVO result = sqlSession.selectOne(NAMESPACE + "selectOne", vo);
		List<OrderDetailVO> details = sqlSession.selectList(NAMESPACE + "selectOrderDetail", vo);
		result.setDetails(details);

		return result;
	}

	@Override
	public List<OrderVO> selectAll() {
		log.info("selectAll()...");
		return sqlSession.selectList(NAMESPACE + "selectAll");
	}

	@Override
	public List<OrderVO> selectOrderList(SearchOrderVO vo) {
		log.info("selectOrderList()...{}", vo);
		return sqlSession.selectList(NAMESPACE + "selectOrderList", vo);
	}

	@Override
	public int updateStatus(OrderVO vo) {
		log.info("updateStatus()...{}", vo);
		int flag = 0;

		try {
			flag = sqlSession.update(NAMESPACE + "updateStatus", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;
	}

}
