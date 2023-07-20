package com.banchan.order.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.banchan.cart.model.CartVO;
import com.banchan.cart.service.CartService;
import com.banchan.order.model.OrderVO;
import com.banchan.order.service.OrderService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/order")
public class OrderRestController {

	@Autowired
	HttpSession session;

	@Autowired
	private OrderService service;

	@Autowired
	private CartService cartService;

	@ResponseBody
	@RequestMapping(value = "/insertOk.do", method = RequestMethod.POST)
	public Map<String, Integer> insertOk(OrderVO vo) {
		log.info("/insertOk.do...{}", vo);

		vo.setMember_num((Integer) session.getAttribute("user_num"));

		int result = service.insert(vo);
		if (result > 0) {
			CartVO cartVO = new CartVO();
			cartVO.setMember_id((String) session.getAttribute("user_id"));
			cartService.deleteAll(cartVO);
		}

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("result", result);

		return map;
	}

	@ResponseBody
	@RequestMapping(value = "/updateOk.do", method = RequestMethod.PUT)
	public Map<String, Integer> updateOk(OrderVO vo) {
		log.info("/updateOk.do...{}", vo);

		int result = service.update(vo);

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("result", result);

		return map;
	}

	@ResponseBody
	@RequestMapping(value = "/deleteOk.do", method = RequestMethod.DELETE)
	public Map<String, Integer> deleteOk(OrderVO vo) {
		log.info("/deleteOk.do...{}", vo);

		int result = service.delete(vo);

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("result", result);

		return map;
	}

	@ResponseBody
	@RequestMapping(value = "/selectOne.do", method = RequestMethod.GET)
	public OrderVO selectOne(OrderVO vo) {
		log.info("/selectOne.do...{}", vo);

		OrderVO result = service.selectOne(vo);
		log.info("{}", result);

		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/selectAll.do", method = RequestMethod.GET)
	public List<OrderVO> selectAll() {
		log.info("/selectAll.do...");

		List<OrderVO> result = service.selectAll();
		log.info("{}", result);

		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/updateStatusOk.do", method = RequestMethod.POST)
	public Map<String, Integer> updateStatusOk(OrderVO vo) {
		log.info("/updateStatusOk.do...{}", vo);

		boolean isAdmin = (Boolean) session.getAttribute("isAdmin");

		Map<String, Integer> map = new HashMap<String, Integer>();

		if (!isAdmin && !"취소".equals(vo.getStatus())) {
			map.put("result", 0);
			return map;
		}

		int result = service.updateStatus(vo);

		map.put("result", result);

		return map;
	}
}
