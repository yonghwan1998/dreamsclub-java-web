package xyz.dreams.service;

import java.util.List;
import java.util.Map;

import xyz.dreams.dto.CartVO;

public interface CartService{
	Map<String, List> myCartList(CartVO cartVO);
	boolean findCartGoods(CartVO cartVO);
	void addGoodsInCart(CartVO cartVO);
	public boolean modifyCartQty(CartVO cartVO);
	public void removeCartGoods(int cartId);
}
