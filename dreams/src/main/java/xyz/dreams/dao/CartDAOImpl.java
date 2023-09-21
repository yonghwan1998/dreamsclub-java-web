package xyz.dreams.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dto.CartVO;
import xyz.dreams.dto.GoodsDTO;

@Repository
@RequiredArgsConstructor
public class CartDAOImpl implements CartDAO {
	private final SqlSession sqlSession;
	private final String NS = "xyz.dreams.mapper.CartMapper";
	
	@Override
	public List<CartVO> selectCartList(String memberId) {
		return sqlSession.selectList(NS+".selectCartList", memberId);
	}

	@Override
	public CartVO selectCartById(int cartId) {
		return sqlSession.selectOne(NS+".selectCartById", cartId);
	}
	
	@Override
	public boolean findCartGoods(CartVO cartVO) {
		String result = sqlSession.selectOne(NS+".findCartGoods", cartVO);
		return Boolean.parseBoolean(result);
	}

	@Override
	public void addGoodsInCart(CartVO cartVO) {
		sqlSession.insert(NS+".addGoodsInCart", cartVO);
	}

	@Override
	public void updateGoodsCount(CartVO cartVO) {
		sqlSession.insert(NS+".modifyGoodsQty", cartVO);
	}

	@Override
	public boolean delFromCart(CartVO cartVO) {
		int result = sqlSession.delete(NS+".delFromCart", cartVO);
		
		if (result == 1) {
			return true;
		} else {
			return false;
		}		
	}
}
