package xyz.dreams.service;


import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dao.OrderDAO;
import xyz.dreams.dto.GoodsDTO;
import xyz.dreams.dto.MemberDTO;
import xyz.dreams.dto.OrderDTO;
import xyz.dreams.dto.OrderDetailDTO;
import xyz.dreams.mapper.OrderMapper;

@Service
@RequiredArgsConstructor
public class OrderServiceImpl implements OrderService{
	private final OrderDAO orderDAO;

	@Override
	public int insertOrder(OrderDTO orderDTO) {
		return orderDAO.insertOrder(orderDTO);
	}

	@Override
	public int updateOrder(OrderDTO orderDTO) {
		return orderDAO.updateOrder(orderDTO);
	}
	
	@Override
	public MemberDTO getMemberInfo(String memberId) {
		return orderDAO.getMemberInfo(memberId);
	}

	@Override
	public GoodsDTO getGoodsInfo(String goodsCode) {
		return orderDAO.getGoodsInfo(goodsCode);
	}

	
	
	//
	@Override
	public List<OrderDetailDTO> getGoods(List<OrderDetailDTO> orders) {
		List<OrderDetailDTO> result = new ArrayList<OrderDetailDTO>();
		
		for(OrderDetailDTO ord : orders) {
			OrderDetailDTO goodsInfo = orderDAO.getGoods(ord.getGoodsCode());
			goodsInfo.setGoodsCount(ord.getGoodsCount());
			
			result.add(goodsInfo);
		}
		
		return result;
	}

	
}
