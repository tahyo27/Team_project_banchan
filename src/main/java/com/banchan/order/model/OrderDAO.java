package com.banchan.order.model;

import java.util.List;

import com.banchan.question.model.PagingVO;

public interface OrderDAO {
	String NAMESPACE = "com.banchan.order.";

	public int insert(OrderVO vo);

	public int update(OrderVO vo);

	public int delete(OrderVO vo);

	public OrderVO selectOne(OrderVO vo);

	public List<OrderVO> selectAll();

	public List<OrderVO> selectOrderList(SearchOrderVO vo, PagingVO pagingVO);

	public int getOrderCount(SearchOrderVO vo);

	public int updateStatus(OrderVO vo);
}
