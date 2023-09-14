package xyz.dreams.mapper;

import xyz.dreams.dto.CartVO;

public interface CartMapper {
	boolean findCartGoods(CartVO cartVO);
	void addGoodsInCart(CartVO cartVO);
}
