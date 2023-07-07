package idle.com.banchan.product.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class ProductDAOimpl implements ProductDAO {

	@Autowired
	SqlSession sqlSession;
	
	public ProductDAOimpl() {
		log.info("ProductDAOimpl()...");
	}

	@Override
	public List<ProductVO> selectAll() {
		log.info("selectAll()...");
		
		List<ProductVO> vos = sqlSession.selectList("PR_SELECT_ALL");
		
		return vos;
	}

	@Override
	public List<ProductVO> searchList(String searchKey, String searchWord) {
		log.info("searchList()...");
		log.info("searchKey:{}",searchKey);
		log.info("searchWord:{}",searchWord);
		
		if(searchKey.equals("name")) {
			return sqlSession.selectList("PR_SEARCH_LIST_NAME", "%"+searchWord+"%");
		}else {
			return sqlSession.selectList("PR_SEARCH_LIST_PRICE", "%"+searchWord+"%");
		}
		
	}

	@Override
	public ProductVO selectOne(ProductVO vo) {
		log.info("selectOne()...{}",vo);
		
		ProductVO vo2 = sqlSession.selectOne("PR_SELECT_ONE", vo);
		
		return vo2;
	}

	@Override
	public int insert(ProductVO vo) {
		log.info("insert()...{}",vo);
		
		return sqlSession.insert("PR_INSERT",vo);
	}

	@Override
	public int update(ProductVO vo) {
		log.info("update()...{}",vo);
		
		return sqlSession.update("PR_UPDATE", vo);
	}

	@Override
	public int delete(ProductVO vo) {
		log.info("delete()...{}",vo);
		
		
		return sqlSession.delete("PR_DELETE",vo);
	}
	
}
