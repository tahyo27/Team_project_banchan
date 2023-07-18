package com.banchan.question.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.banchan.question.model.PagingVO;
import com.banchan.question.model.QuestionDAO;
import com.banchan.question.model.QuestionVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class QuestionService {

	@Autowired
	QuestionDAO dao;

	public QuestionService() {
		log.info("BoardService...");
	}

	public int insert(QuestionVO vo) {
		return dao.insert(vo);
	}

	public int update(QuestionVO vo) {
		return dao.update(vo);
	}

	public int delete(QuestionVO vo) {
		return dao.delete(vo);
	}

	public List<QuestionVO> selectAll() {
		return dao.selectAll();
	}

	public QuestionVO selectOne(QuestionVO vo) {
		return dao.selectOne(vo);
	}

	public List<QuestionVO> searchList(String searchKey, String searchWord) {
		return dao.searchList(searchKey, searchWord);
	}

	public void vcountUp(QuestionVO vo) {
		dao.vcountUp(vo);
	}
	
	public int countBoard() {
		return dao.countBoard();
	}
	
	public List<QuestionVO> selectBoard(PagingVO vo){
		return dao.selectBoard(vo);
	}

}
