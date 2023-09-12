package xyz.dreams.dao;

import java.util.List;
import java.util.Map;

import xyz.dreams.dto.CartVO;
import xyz.dreams.dto.GoodsDTO;

public interface CartDAO {
	boolean findCartGoods(CartVO cartVO);
	void addGoodsInCart(CartVO cartVO);
	List<CartVO> getMyCartGoodsCode(String memberId);
	List<GoodsDTO> getMyCartList(List<CartVO> cartList);
}
