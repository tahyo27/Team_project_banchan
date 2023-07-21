package com.banchan.member.controller;

import javax.servlet.http.HttpSession;

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
	HttpSession session;
	
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
	@RequestMapping(value = "/m_json_selectOne.do", method = RequestMethod.GET)
	public MemberVO m_json_selectOne(MemberVO vo) {
		log.info("/m_json_selectOne.do....vo:{}", vo);	
		
		MemberVO vo2 = service.selectOne(vo);
		log.info("m_json_selectOne.... vo2:{}", vo2);
		return vo2;
	
	}
	
	@ResponseBody
	@RequestMapping(value = "/mailCheck.do", method = RequestMethod.GET)
	public String mailCheck(String email) {
		log.info("이메일 인증 요청이 들어왔음");
		log.info("이메일 인증 이메일 : "+ email);
		return mailService.joinEmail(email);
	}
	
	@ResponseBody
	@RequestMapping(value = "/m_user_deleteOK.do", method = RequestMethod.POST)
	public String m_user_deleteOK(MemberVO vo) {
		log.info("/m_user_deleteOK.do....vo:{}", vo);
		String msg ="";
		int result = service.user_delete(vo);
		log.info("m_user_deleteOK result:{}", result);
		log.info("/m_user_deleteOK.do....delete vo:{}", vo);
		
		if (result == 1) {
			session.invalidate();
			msg="성공";
		} else {
			msg="실패";
		}
		return msg;
	}
	
	@ResponseBody
	@RequestMapping(value = "/m_sns_deleteOK.do", method = RequestMethod.POST)
	public String m_sns_deleteOK(MemberVO vo) {
		log.info("/m_sns_deleteOK.do....vo:{}", vo);
		String msg ="";
		int result = service.delete(vo);
		log.info("m_sns_deleteOK result:{}", result);
		log.info("/m_sns_deleteOK.do....delete vo:{}", vo);
		
		if (result == 1) {
			session.invalidate();
			msg="성공";
		} else {
			msg="실패";
		}
		return msg;
	}
	
	

}//end class
