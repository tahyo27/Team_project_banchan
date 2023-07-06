package idle.com.banchan.order.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import idle.com.banchan.order.model.OrderVO;
import idle.com.banchan.order.service.OrderService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/order")
public class OrderController {

	@Autowired
	private OrderService service;

	@RequestMapping(value = "/insert.do", method = RequestMethod.GET)
	public String insert() {
		log.info("/insert.do...");

		return ".order/insert";
	}

	@RequestMapping(value = "/insertOk.do", method = RequestMethod.POST)
	public String insertOk(OrderVO vo) {
		log.info("/insertOk.do...{}", vo);

		int result = service.insert(vo);

		if (result > 0) {
			return "redirect:selectAll.do";
		} else {
			return "redirect:insert.do";
		}
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
