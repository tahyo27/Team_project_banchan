package idle.com.banchan.product.model;

import java.util.List;

public interface ProductDAO {

	public List<ProductVO> selectAll();

	public List<ProductVO> searchList(String searchKey, String searchWord);

	public ProductVO selectOne(ProductVO vo);

	public int insert(ProductVO vo);

	public int update(ProductVO vo);

	public int delete(ProductVO vo);

}
