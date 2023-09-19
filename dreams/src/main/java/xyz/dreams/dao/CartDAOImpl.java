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
	public List<GoodsDTO> selectGoodsList(List<CartVO> cartList) {
		return sqlSession.selectList(NS+".selectGoodsList", cartList);
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
	public void updateCartGoodsQty(CartVO cartVO) {
		sqlSession.insert(NS+".updateCartGoodsQty", cartVO);
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
