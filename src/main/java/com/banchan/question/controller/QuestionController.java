package com.banchan.question.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.banchan.answer.model.AnswerVO;
import com.banchan.answer.service.AnswerService;
import com.banchan.question.model.PagingVO;
import com.banchan.question.model.QuestionVO;
import com.banchan.question.service.QuestionService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class QuestionController {

	@Autowired
	QuestionService service;
	
	@Autowired
	AnswerService answerService;
	
	@RequestMapping(value = "/q_selectAll.do", method = RequestMethod.GET)
	public String q_selectAll(Model model) {
		log.info("/q_selectAll.do");

		List<QuestionVO> vos = service.selectAll();

		model.addAttribute("vos", vos);

		return ".question/selectAll";
	}
	
	@RequestMapping(value = "/boardList.do", method = RequestMethod.GET)
	public String boardList(PagingVO vo,Model model
			,@RequestParam (value="nowPage", required = false)String nowPage //String값에 담긴 value, require : key값이 존재하지않을 경우 badrequest 안뜸
			,@RequestParam (value="cntPerPage",required = false)String cntPerPage) {
		log.info("/boardList.do...{}",vo);
		
		int total = service.countBoard();
		log.info("total...{}",total);
		if(nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		}else if(nowPage == null) {
			nowPage = "1";	
		}else if(cntPerPage == null) {
			cntPerPage = "5";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging",vo);
		model.addAttribute("viewAll",service.selectBoard(vo));
		
		return ".admin/question/boardPaging";
	
	}
	
	
	@RequestMapping(value = "/q_searchList.do", method = RequestMethod.GET)
	public String q_searchList(Model model,
			String searchKey, String searchWord) {
		log.info("q_searchList.do...");
		log.info("searchKey:{}",searchKey);
		log.info("searchWord:{}",searchWord);
		
		List<QuestionVO> vos = service.searchList(searchKey,searchWord);
		model.addAttribute("vos", vos);
		
		return ".question/selectAll";
	}
	
	@RequestMapping(value = "/q_selectOne.do", method = RequestMethod.GET)
	public String q_selectOne(QuestionVO vo, Model model) {
		log.info("/q_selectOne.do...{}", vo);

		service.vcountUp(vo);
		
		QuestionVO vo2 = service.selectOne(vo);
		model.addAttribute("vo2", vo2);
		
		AnswerVO cvo = new AnswerVO();
		cvo.setQnum(vo.getQnum());
		List<AnswerVO> ans = answerService.selectAll(cvo);
		log.info("{}",ans);
		
		model.addAttribute("ans", ans);

		return ".question/selectOne";
	}
	
	@RequestMapping(value = "/q_insert.do", method = RequestMethod.GET)
	public String q_insert() {
		log.info("/q_insert.do...");
		
		return ".question/insert";
	}
	
	
	@RequestMapping(value = "/q_insertOK.do", method = RequestMethod.POST)
	public String q_insertOK(QuestionVO vo) {
		log.info("/q_insertOK.do...{}", vo);
		
		int result = service.insert(vo);
		log.info("result...{}", result);
		
		if(result==1) {
			return "redirect:boardList.do";
		}else {
			return "redirect:q_insert.do";
		}
		
	}
	
	@RequestMapping(value = "/q_update.do", method = RequestMethod.GET)
	public String q_update(QuestionVO vo, Model model) {
		log.info("/q_update.do...{}", vo);

		QuestionVO vo2 = service.selectOne(vo);

		model.addAttribute("vo2", vo2);

		return ".question/update";
	}
	
	@RequestMapping(value = "/q_updateOK.do", method = RequestMethod.POST)
	public String q_updateOK(QuestionVO vo) {
		log.info("/q_updateOK.do...{}", vo);
		
		int result = service.update(vo);
		log.info("result...{}", result);
		
		if(result==1) {
			return "redirect:q_selectOne.do?qnum="+vo.getQnum();
		}else {
			return "redirect:q_update.do?qnum="+vo.getQnum();
		}
		
	}
	
	@RequestMapping(value = "/q_deleteOK.do", method = RequestMethod.GET)
	public String q_deleteOK(QuestionVO vo) {
		log.info("/q_deleteOK.do...{}", vo);
		
		int result = service.delete(vo);
		log.info("result...{}", result);
		
		if(result==1) {
			return "redirect:boardList.do";
		}else {
			return "redirect:q_selectOne.do?wnum="+vo.getQnum();
		}
		
	}
	

}
