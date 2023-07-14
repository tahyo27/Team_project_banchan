package com.banchan.addressbook.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.banchan.addressbook.model.AddressBookVO;
import com.banchan.addressbook.service.AddressBookService;

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
		String msg = "";
		int result = service.update(vo);
		
		log.info("AddressBook_ab_updateOK result:" + result);
		
		if (result == 1) {
			msg="성공";
		} else {
			msg="실패";
		}
		return msg;
	}
	
	@ResponseBody
	@RequestMapping(value = "/ab_deleteOK.do", method = RequestMethod.POST)
	public String ab_deleteOK(AddressBookVO vo) {
		log.info("AddressBook_ab_deleteOK.do...{}", vo);
		String msg = "";
		int result = service.delete(vo);
		
		log.info("AddressBook_ab_deleteOK result:" + result);
		
		if (result == 1) {
			msg="성공";
		} else {
			msg="실패";
		}
		return msg;
	}
	
}//end class
