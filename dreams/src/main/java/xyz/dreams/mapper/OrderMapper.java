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
	
	//강민경(2023/09/20): 마이페이지에서 상품 리스트 출력 
	List<OrderDTO> selectOrderStatus();
}
