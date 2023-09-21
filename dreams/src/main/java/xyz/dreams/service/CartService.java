package xyz.dreams.service;

import java.util.List;
import java.util.Map;

import xyz.dreams.dto.CartVO;

public interface CartService{
	List<CartVO> myCartList(String memberId);
	CartVO selectCartById(int cartId);
	boolean findCartGoods(CartVO cartVO);
	void addGoodsInCart(CartVO cartVO);
	public boolean updateGoodsCount(CartVO cartVO);
	int delFromCart(CartVO cartVO);
}
