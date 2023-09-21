package xyz.dreams.mapper;

import java.util.List;

import xyz.dreams.dto.CartVO;
import xyz.dreams.dto.GoodsDTO;

public interface CartMapper {
	List<CartVO> selectCartList(String memberId);
	CartVO selectCartById(int cartId);
	boolean findCartGoods(CartVO cartVO);
	void addGoodsInCart(CartVO cartVO);
	void updateCartGoodsQty(CartVO cartVO);
	int delFromCart(CartVO cartVO);
}
