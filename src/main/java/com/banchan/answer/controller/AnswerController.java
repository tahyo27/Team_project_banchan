package com.banchan.answer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.banchan.answer.model.AnswerVO;
import com.banchan.answer.service.AnswerService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AnswerController {
	
	@Autowired
	AnswerService answerService;

	@RequestMapping(value = "/a_updateOK.do", method = RequestMethod.GET)
	public String a_updateOK(AnswerVO vo) {
		log.info("/a_updateOK.do...{}", vo);
		
		int result = answerService.update(vo);
		log.info("result...{}", result);
		
		return "redirect:q_selectOne.do?qnum="+vo.getQnum();
		
	}
	
	@RequestMapping(value = "/a_deleteOK.do", method = RequestMethod.GET)
	public String a_deleteOK(AnswerVO vo) {
		log.info("/a_deleteOK.do...{}", vo);
		
		int result = answerService.delete(vo);
		log.info("result...{}", result);
		
		return "redirect:q_selectOne.do?qnum="+vo.getQnum();
		
	}
	
	@RequestMapping(value = "/a_insertOK.do", method = RequestMethod.GET)
	public String a_insertOK(AnswerVO vo) {
		log.info("/a_insertOK.do...{}", vo);
		
		int result = answerService.insert(vo);
		log.info("result...{}", result);
		
		return "redirect:q_selectOne.do?qnum="+vo.getQnum();
		
	}
	

}
