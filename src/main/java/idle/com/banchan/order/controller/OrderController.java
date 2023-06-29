package idle.com.banchan.order.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import idle.com.banchan.order.model.OrderVO;
import idle.com.banchan.order.service.OrderService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/order")
public class OrderController {

	@Autowired
	private OrderService service;

//	public List<OrderVO> selectList(){
//		
//	}

}
