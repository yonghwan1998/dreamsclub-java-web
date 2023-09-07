package xyz.dreams.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dto.CartDTO;
import xyz.dreams.mapper.CartMapper;

@Repository
@RequiredArgsConstructor
public class CartDAOImpl implements CartDAO {
	private final SqlSession sqlSession;

	@Override
	public int addCart(CartDTO cart) throws Exception {
		return sqlSession.getMapper(CartMapper.class).addCart(cart);
	}

	@Override
	public int deleteCart(String cartNo) {
		return sqlSession.getMapper(CartMapper.class).deleteCart(cartNo);
	}

	@Override
	public int modifyCart(CartDTO cart) {
		return sqlSession.getMapper(CartMapper.class).modifyCart(cart);
	}

	@Override
	public List<CartDTO> selectCartList(String memberId) {
		return sqlSession.getMapper(CartMapper.class).selectCartList(memberId);
	}

	@Override
	public CartDTO checkCart(CartDTO cart) {
		return sqlSession.getMapper(CartMapper.class).checkCart(cart);
	}

	@Override
	public int deleteOrderCart(CartDTO cartOrder) {
		return sqlSession.getMapper(CartMapper.class).deleteOrderCart(cartOrder);
	}
	


	

}
