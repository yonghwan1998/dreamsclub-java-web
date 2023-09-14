package xyz.dreams.service;

import java.util.List;
import java.util.Map;

import xyz.dreams.dto.CartVO;

public interface CartService{
	boolean findCartGoods(CartVO cartVO);
	void addGoodsInCart(CartVO cartVO);
	Map<String, List> getMyCart(String memberId);
}
