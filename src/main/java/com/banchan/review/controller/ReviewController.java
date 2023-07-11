package com.banchan.review.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.banchan.review.model.ReviewVO;
import com.banchan.review.service.ReviewService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ReviewController {
	
	@Autowired
	ReviewService service;
	
	@Autowired
	HttpSession session;
	
	
	@RequestMapping(value = "/re_selectAll.do", method = RequestMethod.GET)
	public String re_selectAll(ReviewVO vo,Model model) {
		log.info("/re_selectAll.do.....");
		
		session.setAttribute("member_id", "user001"); // 테스트값. session 구현시 변경
		vo.setMember_id((String)session.getAttribute("member_id"));
		

		List<ReviewVO> vos = service.selectAll(vo);
		log.info("vos:{}", vos);
		
		model.addAttribute("vos", vos);

		return "review/selectAll";
	}
	
	
	@RequestMapping(value = "/re_deleteOK.do", method = RequestMethod.GET)
	public String re_deleteOK(ReviewVO vo) {
		log.info("/re_deleteOK.do...{}",vo);
		
		session.setAttribute("member_id", "user001"); // 테스트값. session 구현시 변경
		vo.setMember_id((String)session.getAttribute("member_id"));
		
		int result = service.delete(vo);
		log.info("result:{}",result);
		
		
		return "redirect:re_selectAll.do?member_id="+vo.getMember_id();
	}
	
	
	
	
	
	
	
	
	
}
