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
	public List<CartVO> selectCartList(CartVO cartVO) {
		List<CartVO> cartList = (List)sqlSession.selectList(NS+".selectCartList", cartVO);
		return cartList;
	}

	@Override
	public List<GoodsDTO> selectGoodsList(List<CartVO> cartList) {
		List<GoodsDTO> myGoodsList;
		myGoodsList = sqlSession.selectList(NS+".selectGoodsList", cartList);
		return myGoodsList;
	}
	
	@Override
	public boolean findCartGoods(CartVO cartVO) {
		String result = sqlSession.selectOne(NS+".findCartGoods", cartVO);
		return Boolean.parseBoolean(result);
	}

	@Override
	public void addGoodsInCart(CartVO cartVO) {
		int cartId = selectMaxCartId();
		cartVO.setCartId(cartId);
		sqlSession.insert(NS+".addGoodsInCart", cartVO);
	}

	@Override
	public void updateCartGoodsQty(CartVO cartVO) {
		sqlSession.insert(NS+".updateCartGoodsQty", cartVO);
	}

	@Override
	public void deleteCartGoods(int cartId) {
		sqlSession.delete(NS+".deleteCartGoods", cartId);
	}

	private int selectMaxCartId() {
		int cartId = sqlSession.selectOne(NS+".selectMaxCartId");
		return cartId;
	}


}
