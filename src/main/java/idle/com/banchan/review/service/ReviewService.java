package idle.com.banchan.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import idle.com.banchan.review.model.ReviewDAO;
import idle.com.banchan.review.model.ReviewVO;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Service
public class ReviewService {
	
	
	@Autowired
	ReviewDAO dao;
	
	public ReviewService() {
		log.info("ReviewService()...");
	}
	
	public int insert(ReviewVO vo) { 
		return dao.insert(vo);
	}

	public List<ReviewVO> selectAll(ReviewVO vo) {
		return dao.selectAll(vo);
	}

	public int delete(ReviewVO vo) {
		return dao.delete(vo);
	}
	
	public List<ReviewVO> selectAllTotal(ReviewVO rvo) {
		return dao.selectAllTotal(rvo);
	}
	



}
