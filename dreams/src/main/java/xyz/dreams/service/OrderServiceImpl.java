package xyz.dreams.service;


import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dao.OrderDAO;
import xyz.dreams.dto.CartVO;
import xyz.dreams.dto.OrderDTO;

@Service
@RequiredArgsConstructor
public class OrderServiceImpl implements OrderService{
	private final OrderDAO orderDAO;
	
	@Transactional
	@Override
	public void insert(OrderDTO orderDTO) {
		orderDAO.insert(orderDTO);
		
		CartVO cartVO = new CartVO();
		cartVO.setMemberId(orderDTO.getMemberId());
		cartVO.setGoodsCode(orderDTO.getGoodsCode());
		
		delFromCart(cartVO);
	}
	
	@Override
	public List<OrderDTO> myOrderList(String memberId) {
		return orderDAO.myOrderList(memberId);
	}
	
	@Override
	public List<OrderDTO> list(int curPage) {
		return orderDAO.list(curPage);
	}
	
	@Override
	public List<OrderDTO> selectByOrderId(String orderId) {
		return orderDAO.selectByOrderId(orderId);
	}
	@Override
	public boolean updateOrderStatus(OrderDTO orderDTO) {
		boolean result = orderDAO.updateOrderStatus(orderDTO);
		return result;
	}
	
	@Override
	public boolean delFromCart(CartVO cartVO) {
		return orderDAO.delFromCart(cartVO);
	}
	
	@Override
	public int orderCancel(OrderDTO orderDTO) {
		return orderDAO.orderCancel(orderDTO);
	}
	
	@Override
	public int getAmount() {
		return orderDAO.getAmount();
	}
}
