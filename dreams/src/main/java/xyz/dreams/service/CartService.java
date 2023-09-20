package xyz.dreams.service;

import java.util.List;
import java.util.Map;

import xyz.dreams.dto.CartVO;

public interface CartService{
	List<CartVO> myCartList(String memberId);
	boolean findCartGoods(CartVO cartVO);
	void addGoodsInCart(CartVO cartVO);
	public boolean updateGoodsCount(CartVO cartVO);
	boolean delFromCart(CartVO cartVO);
}
