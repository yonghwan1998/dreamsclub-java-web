package xyz.dreams.mapper;

import java.util.List;

import xyz.dreams.dto.OrderDetailDTO;

public interface OrderDetailMapper {
    List<OrderDetailDTO> getOrderList();
    OrderDetailDTO getOrderById(String orderId);
}

