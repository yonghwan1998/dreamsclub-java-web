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
	public int insert(OrderDTO payment) {
		System.out.println("DAO : " + payment);
		return sqlSession.insert(NS+".insert", payment);
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
	public OrderDTO selectByOrderId(String impUid) {
		return sqlSession.selectOne(NS+".selectByOrderId", impUid);
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
	public List<OrderDTO> allOrderList() {
		return sqlSession.selectList(NS+".allOrderList");
	}

	@Override
	public OrderDTO selectOrderId(String impUid, String memberId) {
		return sqlSession.getMapper(OrderMapper.class).selectOrderId(impUid, memberId);	
	}

	/*
	- 방용환(수정) : 2023/09/25, 테이블 변경에 따른 변경
	*/
	@Override
	public List<OrderDTO> selectOrderListByMemberId(String memberId) {
		return sqlSession.getMapper(OrderMapper.class).selectOrderListByMemberId(memberId);	
	}
	
}