package xyz.dreams.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import xyz.dreams.dto.CartVO;
import xyz.dreams.dto.OrderDTO;

@Repository
public interface OrderDAO {
	int insert(OrderDTO payment);

	List<OrderDTO> myOrderList(String memberId);

	List<OrderDTO> allOrderList();

	OrderDTO selectByOrderId(String impUid);

	boolean updateOrderStatus(OrderDTO orderDTO);

	int orderCancel(OrderDTO orderDTO);

	int getAmount();

	OrderDTO selectOrderId(String impUid, String memberId);
	
	/*
	- 방용환(수정) : 2023/09/25, 테이블 변경에 따른 변경
	*/
	List<OrderDTO> selectOrderListByMemberId(String memberId);
	
	int updateStatusComplete(String impUid);

	//이소영(2023/09/26): 고유주문번호 통해 조회
	OrderDTO getOrderDetailByImpUid(String impUid);
}
