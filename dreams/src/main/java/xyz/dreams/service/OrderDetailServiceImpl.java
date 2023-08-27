package xyz.dreams.service;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dao.OrderDetailDAO;
import xyz.dreams.dto.OrderDetailDTO;

@Service
@RequiredArgsConstructor
public class OrderDetailServiceImpl implements OrderDetailService {
	private final OrderDetailDAO orderDetailDAO;

	 @Override
	 public OrderDetailDTO getOrderById(String orderId) {
        return orderDetailDAO.getOrderById(orderId);
	 }
	
	@Override
    public List<OrderDetailDTO> getOrderList() {
        return orderDetailDAO.getOrderList();
    }
}
