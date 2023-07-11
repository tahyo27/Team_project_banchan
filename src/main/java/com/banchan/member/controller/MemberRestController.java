package com.banchan.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.banchan.MailSend.MailSendService;
import com.banchan.member.model.MemberVO;
import com.banchan.member.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberRestController {
	
	@Autowired
	MemberService service;
	
	@Autowired
	private MailSendService mailService;
	
	@ResponseBody
	@RequestMapping(value = "/json_m_idCheck.do", method = RequestMethod.GET)
	public String json_m_idCheck(MemberVO vo) {
		log.info("/json_m_idCheck.do...{}",vo);
		
		MemberVO vo2 = service.idCheck(vo);
		log.info("{}",vo2);
		if(vo2==null) {
			return "{\"result\":\"OK\"}";
		}else {
			return "{\"result\":\"NotOK\"}";
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/mailCheck.do", method = RequestMethod.GET)
	public String mailCheck(String email) {
		log.info("이메일 인증 요청이 들어왔음");
		log.info("이메일 인증 이메일 : "+ email);
		return mailService.joinEmail(email);
	}

}//end class
