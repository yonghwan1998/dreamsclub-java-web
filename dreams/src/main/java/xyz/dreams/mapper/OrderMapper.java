package xyz.dreams.mapper;

import java.util.List;

import xyz.dreams.dto.CartVO;
import xyz.dreams.dto.OrderDTO;

public interface OrderMapper {
	void insert(OrderDTO orderDTO);

	List<OrderDTO> myOrderList(String memberId);

	List<OrderDTO> list(int curPage);

	List<OrderDTO> selectByOrderId(String orderId);

	boolean updateOrderStatus(OrderDTO orderDTO);

	boolean delFromCart(CartVO cartVO);

	int orderCancel(OrderDTO orderDTO);

	int getAmount();
}
