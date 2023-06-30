package idle.com.banchan.addressbook.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import idle.com.banchan.addressbook.model.AddressBookVO;
import idle.com.banchan.addressbook.service.AddressBookService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AddressBookRestController {
	
	@Autowired
	AddressBookService service;
	
	@ResponseBody
	@RequestMapping(value = "/ab_updateOK.do", method = RequestMethod.POST)
	public String ab_updateOK(AddressBookVO vo) {
		log.info("AddressBook_ab_updateOK.do...{}", vo);
		
		int result = service.update(vo);
		
		log.info("AddressBook_ab_updateOK result:" + result);
		
		if (result == 1) {
			return "redirect:ab_selectAll.do?member_num=" + vo.getMember_num();
		} else {
			return "redirect:home";
		}
	}
	
}//end class
