package xyz.dreams.dao;

import java.util.List;
import java.util.Map;

import xyz.dreams.dto.CartVO;
import xyz.dreams.dto.GoodsDTO;

public interface CartDAO {
	List<CartVO> selectCartList(CartVO cartVO);
	List<GoodsDTO> selectGoodsList(List<CartVO> cartList);
	boolean findCartGoods(CartVO cartVO);
	void addGoodsInCart(CartVO cartVO);
	void updateCartGoodsQty(CartVO cartVO);
	void deleteCartGoods(int cartId);
}
