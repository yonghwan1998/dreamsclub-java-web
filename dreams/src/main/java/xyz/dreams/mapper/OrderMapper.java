package xyz.dreams.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import xyz.dreams.dto.OrderDTO;

public interface OrderMapper {
	int insert(OrderDTO payment);

	List<OrderDTO> myOrderList(String memberId);

	List<OrderDTO> list(int curPage);

	List<OrderDTO> selectByOrderId(String orderId);

	boolean updateOrderStatus(OrderDTO orderDTO);

	int orderCancel(OrderDTO orderDTO);

	int getAmount();


	OrderDTO selectOrderId(@Param("impUid") String impUid, @Param("memberId") String memberId);
	
	/*
	- 강민경(2023/09/20): 마이페이지에서 상품 리스트 출력
	
	- 방용환(수정) : 2023/09/25, 테이블 변경에 따른 변경
	*/
	List<OrderDTO> selectOrderListByMemberId(String memberId);
}
