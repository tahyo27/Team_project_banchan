package idle.com.banchan.addressbook.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import idle.com.banchan.addressbook.model.AddressBookVO;
import idle.com.banchan.addressbook.service.AddressBookService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AddressBookController {

	@Autowired
	AddressBookService service;
	
	
	@RequestMapping(value = "/ab_selectAll.do", method = RequestMethod.GET)
	public String m_selectAll(Model model, AddressBookVO vo) {
		log.info("/ab_selectAll.do.....");

		List<AddressBookVO> vos = service.selectAll(vo);
		
		log.info("vos:{}", vos);
		
		model.addAttribute("vos", vos);

		return "addressbook/selectAll";
	}
}
