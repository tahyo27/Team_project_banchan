package com.banchan.answer.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.banchan.answer.model.AnswerDAO;
import com.banchan.answer.model.AnswerVO;

@Service
public class AnswerService {

	@Autowired
	AnswerDAO dao;

	public int insert(AnswerVO vo) {
		return dao.insert(vo);
	}

	public int update(AnswerVO vo) {
		return dao.update(vo);
	}

	public int delete(AnswerVO vo) {
		return dao.delete(vo);
	}

	public List<AnswerVO> selectAll(AnswerVO vo) {
		return dao.selectAll(vo);
	}

}
