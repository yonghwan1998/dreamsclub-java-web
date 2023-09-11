package xyz.dreams.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import xyz.dreams.dto.CartVO;
import xyz.dreams.dto.OrderDTO;

@Repository
public interface OrderDAO {
	void insert(OrderDTO orderDTO);

	List<OrderDTO> myOrderList(String memberId);

	List<OrderDTO> list(int curPage);

	List<OrderDTO> selectByOrderId(String orderId);

	boolean updateOrderStatus(OrderDTO orderDTO);

	boolean delFromCart(CartVO cartVO);

	int orderCancel(OrderDTO orderDTO);

	int getAmount();
}
