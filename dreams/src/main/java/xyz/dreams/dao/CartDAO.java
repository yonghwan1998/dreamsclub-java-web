package xyz.dreams.dao;

import java.util.List;
import java.util.Map;

import xyz.dreams.dto.CartVO;
import xyz.dreams.dto.GoodsDTO;

public interface CartDAO {
	List<CartVO> selectCartList(String memberId);
	List<GoodsDTO> selectGoodsList(List<CartVO> cartList);
	boolean findCartGoods(CartVO cartVO);
	void addGoodsInCart(CartVO cartVO);
	void updateGoodsCount(CartVO cartVO);
	boolean delFromCart(CartVO cartVO);
}
