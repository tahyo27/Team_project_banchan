package com.banchan.order.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.banchan.addressbook.model.AddressBookVO;
import com.banchan.addressbook.service.AddressBookService;
import com.banchan.cart.model.CartVO;
import com.banchan.cart.service.CartService;
import com.banchan.order.model.OrderVO;
import com.banchan.order.service.OrderService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/order")
public class OrderController {

	@Autowired
	HttpSession session;

	@Autowired
	private OrderService service;

	@Autowired
	private CartService cartService;

	@Autowired
	private AddressBookService addressBookService;

	@RequestMapping(value = "/insert.do", method = RequestMethod.GET)
	public String insert(Model model) {
		log.info("/insert.do...");

		// 테스트값. session 구현시 변경
		session.setAttribute("member_num", 1);
		session.setAttribute("member_id", "user001");

		CartVO cartVO = new CartVO();
		cartVO.setMember_id((String) session.getAttribute("member_id"));
		List<CartVO> carts = cartService.selectAll(cartVO);
		log.info("carts:{}", carts);

		int order_price = cartService.sumMoney(cartVO);
		int delivery_fee = order_price >= 50000 ? 0 : 2500;
		log.info("delivery_fee:{}", delivery_fee);

		AddressBookVO addressBookVO = new AddressBookVO();
		addressBookVO.setMember_num((Integer) session.getAttribute("member_num"));
		List<AddressBookVO> addressBooks = addressBookService.selectAll(addressBookVO);
		log.info("addressBooks:{}", addressBooks);

		model.addAttribute("carts", carts);
		model.addAttribute("order_price", order_price);
		model.addAttribute("delivery_fee", delivery_fee);
		model.addAttribute("addressBooks", addressBooks);
//		model.addAttribute("point", 2000); // 포인트 조회해서 수정
//		model.addAttribute("coupon", coupon); // 쿠폰 조회해서 수정

		return ".order/insert";
	}

	@RequestMapping(value = "/insertOk.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Integer> insertOk(OrderVO vo) {
		log.info("/insertOk.do...{}", vo);

		session.setAttribute("member_num", 1);
		session.setAttribute("member_id", "user001");
		vo.setMember_num((Integer) session.getAttribute("member_num"));

		int result = service.insert(vo);

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("result", result);

		return map;
	}

	@RequestMapping(value = "/update.do", method = RequestMethod.GET)
	public String update(OrderVO vo, Model model) {
		log.info("/update.do...{}", vo);

		OrderVO result = service.selectOne(vo);
		log.info("{}", result);

		model.addAttribute("vo", result);

		return ".order/update";
	}

	@RequestMapping(value = "/updateOk.do", method = RequestMethod.POST)
	public String updateOk(OrderVO vo) {
		log.info("/updateOk.do...{}", vo);

		int result = service.update(vo);

		if (result > 0) {
			return "redirect:selectOne.do?num=" + vo.getNum();
		} else {
			return "redirect:update.do";
		}
	}

	@RequestMapping(value = "/deleteOk.do", method = RequestMethod.POST)
	public String deleteOk(OrderVO vo) {
		log.info("/deleteOk.do...{}", vo);

		int result = service.delete(vo);

		if (result > 0) {
			return "redirect:selectAll.do";
		} else {
			return "redirect:selectOne.do?num=" + vo.getNum();
		}
	}

	@RequestMapping(value = "/selectOne.do", method = RequestMethod.GET)
	public String selectOne(OrderVO vo, Model model) {
		log.info("/selectOne.do...{}", vo);

		OrderVO result = service.selectOne(vo);
		log.info("{}", result);

		model.addAttribute("vo", result);

		return ".order/selectOne";
	}

	@RequestMapping(value = "/selectAll.do", method = RequestMethod.GET)
	public String selectAll(Model model) {
		log.info("/selectAll.do...");

		List<OrderVO> result = service.selectAll();
		log.info("{}", result);

		model.addAttribute("vos", result);

		return ".order/selectAll";
	}
}
