package xyz.dreams.service;


import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dao.CartDAO;
import xyz.dreams.dao.OrderDAO;
import xyz.dreams.dto.CartVO;
import xyz.dreams.dto.OrderDTO;

@Service
@RequiredArgsConstructor
public class OrderServiceImpl implements OrderService{
	private final OrderDAO orderDAO;
	private final CartDAO cartDAO;
	
	@Transactional
	@Override
	public void insert(OrderDTO order) {
		
		if (order.getNewSelected() == 1) {
			orderDAO.insert(order);
		}else {
			order.setMemberPcode(order.getMemberNewPcode());
			order.setMemberAddress1(order.getMemberNewAddress1());
			order.setMemberAddress2(order.getMemberNewAddress2());
			orderDAO.insert(order);
		}
		
		CartVO cartVO = new CartVO();
		cartVO.setMemberId(order.getMemberId());
		cartVO.setGoodsCode(order.getGoodsCode());
		
		cartDAO.delFromCart(cartVO);
	}
	
	@Override
	public List<OrderDTO> myOrderList(String memberId) {
		return orderDAO.myOrderList(memberId);
	}
	
	@Override
	public List<OrderDTO> allOrderList() {
		return orderDAO.allOrderList();
	}
	
	@Override
	public OrderDTO selectByOrderId(int orderId) {
		return orderDAO.selectByOrderId(orderId);
	}
	@Override
	public boolean updateOrderStatus(OrderDTO orderDTO) {
		boolean result = orderDAO.updateOrderStatus(orderDTO);
		return result;
	}
	
	@Override
	public int orderCancel(OrderDTO orderDTO) {
		return orderDAO.orderCancel(orderDTO);
	}
	
	@Override
	public int getAmount() {
		return orderDAO.getAmount();
	}

	@Override
	public OrderDTO selectOrderId(int orderId, String memberId) {
		return orderDAO.selectOrderId(orderId, memberId);
	}
	
}
