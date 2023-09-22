package xyz.dreams.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dto.OrderDTO;
import xyz.dreams.mapper.OrderMapper;

@Repository
@RequiredArgsConstructor
public class OrderDAOImpl implements OrderDAO {
	private final SqlSession sqlSession;

	private final String NS = "xyz.dreams.mapper.OrderMapper";
	
	@Override
	public int insert(OrderDTO order) {
			int orderId = sqlSession.selectOne(NS+".countOrderId");
			order.setOrderId(orderId);
			
			return sqlSession.insert(NS+".insert", order);
	}

	@Override
	public List<OrderDTO> myOrderList(String memberId) {
		List<OrderDTO> myOrderList = sqlSession.selectList(NS+".myOrderList", memberId);
		
		if(myOrderList.size() == 0) {
			return null;
		} else {
			return myOrderList;
		}
	}

	@Override
	public OrderDTO selectByOrderId(int orderId) {
		return sqlSession.selectOne(NS+".selectByOrderId", orderId);
	}

	@Override
	public boolean updateOrderStatus(OrderDTO orderDTO) {
		int result = sqlSession.update(NS+".updateOrderStatus", orderDTO);
		
		if(result == 1) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public int orderCancel(OrderDTO orderDTO) {
		return sqlSession.delete(NS+".orderCancel", orderDTO);
	}

	@Override
	public int getAmount() {
		return sqlSession.selectOne(NS+".getAmount");
	}

	@Override
	public List<OrderDTO> list(int curPage) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public OrderDTO selectOrderId(int orderId, String memberId) {
		return sqlSession.getMapper(OrderMapper.class).selectOrderId(orderId, memberId);	
		}
	
}