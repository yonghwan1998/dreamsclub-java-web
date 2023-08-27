package xyz.dreams.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dto.OrderDetailDTO;
import xyz.dreams.mapper.OrderDetailMapper;

@Repository
@RequiredArgsConstructor
public class OrderDetailDAOImpl implements OrderDetailDAO {
	private final SqlSession sqlSession;

	@Override
	public OrderDetailDTO getOrderById(String orderId) {
		return sqlSession.getMapper(OrderDetailMapper.class).getOrderById(orderId);
	}
	
	@Override
	public List<OrderDetailDTO> getOrderList() {
		return sqlSession.getMapper(OrderDetailMapper.class).getOrderList();
	}
}
