package xyz.dreams.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import xyz.dreams.dto.CartVO;
import xyz.dreams.dto.OrderDTO;

@Repository
public interface OrderDAO {
	int insert(OrderDTO order);

	List<OrderDTO> myOrderList(String memberId);

	List<OrderDTO> list(int curPage);

	OrderDTO selectByOrderId(int orderId);

	boolean updateOrderStatus(OrderDTO orderDTO);

	int orderCancel(OrderDTO orderDTO);

	int getAmount();

	OrderDTO selectOrderId(int orderId, String memberId);
}
