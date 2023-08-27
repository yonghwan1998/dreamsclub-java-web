package xyz.dreams.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import xyz.dreams.dto.OrderDetailDTO;

@Repository
public interface OrderDetailDAO {
	//주문 상세 정보 조회
	OrderDetailDTO getOrderById(String orderId);
	
	//주문 상세 정보 목록 조회
	List<OrderDetailDTO> getOrderList();
}
