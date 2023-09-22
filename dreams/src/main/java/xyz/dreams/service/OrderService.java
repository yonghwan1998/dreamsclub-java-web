package xyz.dreams.service;

import java.util.List;

import xyz.dreams.dto.OrderDTO;

public interface OrderService {
	void insert(OrderDTO order);

	List<OrderDTO> myOrderList(String memberId);

	List<OrderDTO> list(int curPage);

	OrderDTO selectByOrderId(int orderId);

	boolean updateOrderStatus(OrderDTO orderDTO);
	
	int orderCancel(OrderDTO orderDTO);

	int getAmount();
}
