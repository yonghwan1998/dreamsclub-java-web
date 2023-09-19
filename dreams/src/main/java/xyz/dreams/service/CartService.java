package xyz.dreams.service;

import java.util.List;
import java.util.Map;

import xyz.dreams.dto.CartVO;

public interface CartService{
	Map<String, List> myCartList(String memberId);
	boolean findCartGoods(CartVO cartVO);
	void addGoodsInCart(CartVO cartVO);
	public boolean modifyCartQty(CartVO cartVO);
	boolean delFromCart(CartVO cartVO);
}
