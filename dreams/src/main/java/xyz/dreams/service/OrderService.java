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

	String canclePayment(String accessToken, OrderDTO payment);
	
	/*
	- 방용환(수정) : 2023/09/25, 테이블 변경에 따른 변경
	*/
	List<OrderDTO> getOrderListByMemberId(String memberId);
	
	void modifyStatusComplete(String impUid);

	//이소영(추가) : 2023/09/26 고유주문번호 통해 조회 
	OrderDTO getOrderDetailByImpUid(String impUid);
}
