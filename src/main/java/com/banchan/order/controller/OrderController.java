package com.banchan.order.controller;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.banchan.addressbook.model.AddressBookVO;
import com.banchan.addressbook.service.AddressBookService;
import com.banchan.cart.model.CartVO;
import com.banchan.cart.service.CartService;
import com.banchan.order.model.OrderVO;
import com.banchan.order.model.SearchOrderVO;
import com.banchan.order.service.OrderService;
import com.banchan.question.model.PagingVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class OrderController {

	@Autowired
	HttpSession session;

	@Autowired
	private OrderService service;

	@Autowired
	private CartService cartService;

	@Autowired
	private AddressBookService addressBookService;

	@RequestMapping(value = "/o_insert.do", method = RequestMethod.GET)
	public String insert(Model model) {
		log.info("/insert.do...");

		CartVO cartVO = new CartVO();
		cartVO.setMember_id((String) session.getAttribute("user_id"));
		List<CartVO> carts = cartService.selectAll(cartVO);
		log.info("carts:{}", carts);

		if (carts.size() == 0) {
			return "redirect:c_selectAll.do";
		}

		int order_price = cartService.sumMoney(cartVO);
		int delivery_fee = order_price >= 50000 ? 0 : 2500;
		log.info("delivery_fee:{}", delivery_fee);

		AddressBookVO addressBookVO = new AddressBookVO();
		addressBookVO.setMember_num((Integer) session.getAttribute("user_num"));
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

	@RequestMapping(value = "/o_update.do", method = RequestMethod.GET)
	public String update(OrderVO vo, Model model) {
		log.info("/update.do...{}", vo);

		OrderVO result = service.selectOne(vo);
		log.info("{}", result);

		model.addAttribute("vo", result);

		return ".order/update";
	}

	@RequestMapping(value = "/o_selectOne.do", method = RequestMethod.GET)
	public String selectOne(OrderVO vo, Model model) {
		log.info("/selectOne.do...{}", vo);

		OrderVO result = service.selectOne(vo);
		log.info("{}", result);

		model.addAttribute("vo", result);

		return ".order/selectOne";
	}

	@RequestMapping(value = "/o_selectAll.do", method = RequestMethod.GET)
	public String selectAll(Model model) {
		log.info("/selectAll.do...");

		List<OrderVO> result = service.selectAll();
		log.info("{}", result);

		model.addAttribute("vos", result);

		return ".order/selectAll";
	}

	@RequestMapping(value = "/o_mypageOrders.do", method = RequestMethod.GET)
	public String selectOrdersMypage(SearchOrderVO vo, Model model, PagingVO pagingVO) {
		log.info("/o_mypageOrders.do...{}, {}", vo, pagingVO);

		vo.setMember_num((Integer) session.getAttribute("user_num"));
		if (vo.getStart_date() == null || "".equals(vo.getStart_date())) {
			vo.setStart_date(LocalDate.now().toString());
		}
		if (vo.getEnd_date() == null || "".equals(vo.getEnd_date())) {
			vo.setEnd_date(LocalDate.now().toString());
		}

		int total = service.getOrderCount(vo);
		if (pagingVO.getNowPage() == 0) {
			pagingVO.setNowPage(1);
		}
		if (pagingVO.getCntPerPage() == 0) {
			pagingVO.setCntPerPage(5);
		}
		pagingVO = new PagingVO(total, pagingVO.getNowPage(), pagingVO.getCntPerPage());

		List<OrderVO> result = service.selectOrderList(vo, pagingVO);
		log.info("{}", result);

		model.addAttribute("vos", result);
		model.addAttribute("search", vo);
		model.addAttribute("paging", pagingVO);

		return ".my/order/selectAll";
	}

	@RequestMapping(value = "/o_mypageOrder.do", method = RequestMethod.GET)
	public String selectOrderMypage(OrderVO vo, Model model) {
		log.info("/o_mypageOrders.do...{}", vo);

		OrderVO result = service.selectOne(vo);
		log.info("{}", result);

		model.addAttribute("vo", result);

		return ".my/order/selectOne";
	}

	@RequestMapping(value = "/o_adminOrders.do", method = RequestMethod.GET)
	public String selectOrdersAdmin(SearchOrderVO vo, Model model, PagingVO pagingVO) {
		log.info("/o_adminOrders.do...{}, {}", vo, pagingVO);

		if (vo.getStart_date() == null || "".equals(vo.getStart_date())) {
			vo.setStart_date(LocalDate.now().toString());
		}
		if (vo.getEnd_date() == null || "".equals(vo.getEnd_date())) {
			vo.setEnd_date(LocalDate.now().toString());
		}
		if ("전체".equals(vo.getStatus())) {
			vo.setStatus(null);
		}

		int total = service.getOrderCount(vo);
		if (pagingVO.getNowPage() == 0) {
			pagingVO.setNowPage(1);
		}
		if (pagingVO.getCntPerPage() == 0) {
			pagingVO.setCntPerPage(5);
		}
		pagingVO = new PagingVO(total, pagingVO.getNowPage(), pagingVO.getCntPerPage());

		List<OrderVO> result = service.selectOrderList(vo, pagingVO);
		log.info("{}", result);

		model.addAttribute("vos", result);
		model.addAttribute("search", vo);
		model.addAttribute("paging", pagingVO);

		return ".admin/order/selectAll";
	}

	@RequestMapping(value = "/o_adminOrder.do", method = RequestMethod.GET)
	public String selectOrderAdmin(OrderVO vo, Model model) {
		log.info("/o_adminOrders.do...{}", vo);

		OrderVO result = service.selectOne(vo);
		log.info("{}", result);

		model.addAttribute("vo", result);

		return ".admin/order/selectOne";
	}
}
