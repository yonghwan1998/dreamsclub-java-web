package xyz.dreams.dao;

import org.springframework.stereotype.Repository;

import xyz.dreams.dto.CartDTO;
import xyz.dreams.dto.GoodsDTO;
import xyz.dreams.dto.MemberDTO;
import xyz.dreams.dto.OrderDTO;

@Repository
public interface OrderDAO {
	//주문 정보 삽입
	int insertOrder(OrderDTO orderDTO);
	
	//주문 정보 변경
	int updateOrder(OrderDTO orderDTO);
	
	//회원 정보 조회
	MemberDTO getMemberInfo(String memberId);
	
	//굿즈 조회
	GoodsDTO getGoodsInfo(String goodsCode);
}
