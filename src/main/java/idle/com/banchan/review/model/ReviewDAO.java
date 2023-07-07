package idle.com.banchan.review.model;

import java.util.List;

public interface ReviewDAO {

	int insert(ReviewVO vo); // 리뷰 작성
	
	int delete(ReviewVO vo); // 리뷰 삭제 

	List<ReviewVO> selectAll(ReviewVO vo); // 사용자가 작성한 리뷰 리스트

	List<ReviewVO> selectAllTotal(ReviewVO rvo); // 상품정보 밑에 뿌려줄 전체 리뷰 리스트


}
