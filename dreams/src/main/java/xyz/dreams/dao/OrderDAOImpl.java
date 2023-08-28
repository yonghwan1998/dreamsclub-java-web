package xyz.dreams.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dto.GoodsDTO;
import xyz.dreams.dto.MemberDTO;
import xyz.dreams.dto.OrderDTO;
import xyz.dreams.mapper.OrderMapper;

@Repository
@RequiredArgsConstructor
public class OrderDAOImpl implements OrderDAO {
	private final SqlSession sqlSession;

	@Override
	public int insertOrder(OrderDTO orderDTO) {
		return sqlSession.getMapper(OrderMapper.class).insertOrder(orderDTO);
	}

	@Override
	public int updateOrder(OrderDTO orderDTO) {
		return sqlSession.getMapper(OrderMapper.class).updateOrder(orderDTO);
	}

	@Override
	public MemberDTO getMemberInfo(String memberId) {
		return sqlSession.getMapper(OrderMapper.class).getMemberInfo(memberId);
	}

	@Override
	public GoodsDTO getGoodsInfo(String memberId) {
		return sqlSession.getMapper(OrderMapper.class).getGoodsInfo(memberId);
	}
}