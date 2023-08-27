package xyz.dreams.service;

import xyz.dreams.dto.CartDTO;
import xyz.dreams.dto.MemberDTO;
import xyz.dreams.dto.OrderDTO;

public interface OrderService {
	//주문 정보 삽입
	int insertOrder(OrderDTO orderDTO);
	
	//주문 정보 변경
	int updateOrder(OrderDTO orderDTO);
	
	//회원 정보 조회(배송 정보)
	MemberDTO getMemberInfo(String memberId);
	
	//장바구니 조회(결제 정보)
	CartDTO getCartInfo(String memberId);
}
