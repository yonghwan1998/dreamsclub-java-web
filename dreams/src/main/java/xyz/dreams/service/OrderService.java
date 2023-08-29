package xyz.dreams.service;

import java.util.List;

import xyz.dreams.dto.GoodsDTO;
import xyz.dreams.dto.MemberDTO;
import xyz.dreams.dto.OrderDTO;
import xyz.dreams.dto.OrderDetailDTO;

public interface OrderService {
	//주문 정보 삽입
	int insertOrder(OrderDTO orderDTO);
	
	//주문 정보 변경
	int updateOrder(OrderDTO orderDTO);
	
	//회원 정보 조회(배송 정보)
	MemberDTO getMemberInfo(String memberId);
	
	//굿즈 정보 조회(결제 정보)
	GoodsDTO getGoodsInfo(String goodsCode);
	
	
	//
	public List<OrderDetailDTO> getGoods(List<OrderDetailDTO> orders);
}
