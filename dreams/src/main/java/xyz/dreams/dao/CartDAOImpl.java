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
	public int insertCart(CartDTO cart) {
		return sqlSession.getMapper(CartMapper.class).insertCart(cart);
	}

	@Override
	public int deleteCart(CartDTO cart) {
		return sqlSession.getMapper(CartMapper.class).deleteCart(cart);
	}

	@Override
	public int updateCart(CartDTO cart) {
		return sqlSession.getMapper(CartMapper.class).updateCart(cart);
	}

	@Override
	public List<CartDTO> selectCartList(String memberId) {
		return sqlSession.getMapper(CartMapper.class).selectCartList(memberId);
	}

	@Override
	public CartDTO checkCart(CartDTO cart) {
		return sqlSession.getMapper(CartMapper.class).checkCart(cart);
	}
	//강민경: 메소드 하나 정의된게 없어서 에러 뜨길래 만들었어용,,,,,,,,,,
	@Override
	public CartDTO selectCart(String memberId) {
		// TODO Auto-generated method stub
		return null;
	}


	

}
