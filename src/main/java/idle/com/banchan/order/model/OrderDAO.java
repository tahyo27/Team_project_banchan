package idle.com.banchan.order.model;

import java.util.List;

public interface OrderDAO {
	String NAMESPACE = "idle.com.banchan.order.";

	public int insert(OrderVO vo);

	public int update(OrderVO vo);

	public int delete(OrderVO vo);

	public OrderVO selectOne(OrderVO vo);

	public List<OrderVO> selectAll();
}
