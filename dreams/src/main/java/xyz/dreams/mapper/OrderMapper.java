package xyz.dreams.mapper;

import xyz.dreams.dto.GoodsDTO;
import xyz.dreams.dto.MemberDTO;
import xyz.dreams.dto.OrderDTO;
import xyz.dreams.dto.OrderDetailDTO;

public interface OrderMapper {
	int insertOrder(OrderDTO orderDTO);
	int updateOrder(OrderDTO orderDTO);
	MemberDTO getMemberInfo(String memberId);
	GoodsDTO getGoodsInfo(String goodsCode);
	
	
	//
	public OrderDetailDTO getGoods(String goodsCode);
}
