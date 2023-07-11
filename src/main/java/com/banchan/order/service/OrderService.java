package com.banchan.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import idle.com.banchan.order.model.OrderDAO;
import idle.com.banchan.order.model.OrderVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class OrderService {

	@Autowired
	OrderDAO dao;

	public int insert(OrderVO vo) {
		return dao.insert(vo);
	}

	public int update(OrderVO vo) {
		return dao.update(vo);
	}

	public int delete(OrderVO vo) {
		return dao.delete(vo);
	}

	public OrderVO selectOne(OrderVO vo) {
		return dao.selectOne(vo);
	}

	public List<OrderVO> selectAll() {
		return dao.selectAll();
	}
}
