package xyz.dreams.service;

import java.util.List;

import xyz.dreams.dto.OrderDTO;

public interface OrderService {
	void insert(OrderDTO payment);

	List<OrderDTO> myOrderList(String memberId);

	List<OrderDTO> allOrderList();

	OrderDTO selectByOrderId(String impUid);

	boolean updateOrderStatus(OrderDTO orderDTO);
	
	int orderCancel(OrderDTO orderDTO);

	int getAmount();
	
	OrderDTO selectOrderId(String impUid, String memberId);
	
	String getAccessToken(OrderDTO payment);
	
	OrderDTO getPayment(String accessToken, String impUid);
	
	void addPayment(OrderDTO payment);
	
	String canclePayment(String accessToken, OrderDTO payment);
}
