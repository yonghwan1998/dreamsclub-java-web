package xyz.dreams.service;

import java.util.List;


import xyz.dreams.dto.OrderDetailDTO;

public interface OrderDetailService {
	//주문 상세
	OrderDetailDTO getOrderById(String orderId);
	
	//관리자 - 주문 목록, 주문 상태 변경
	List<OrderDetailDTO> getOrderList();
}
