package xyz.dreams.service;


import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dao.OrderDAO;
import xyz.dreams.dto.GoodsDTO;
import xyz.dreams.dto.MemberDTO;
import xyz.dreams.dto.OrderDTO;

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
	public GoodsDTO getGoodsInfo(String memberId) {
		return orderDAO.getGoodsInfo(memberId);
	}
}
