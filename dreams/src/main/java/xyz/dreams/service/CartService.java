package xyz.dreams.service;

import java.util.List;

import xyz.dreams.dto.CartDTO;

public interface CartService{
	
	/* 장바구니 추가 */
	int addCart(CartDTO cart) throws Exception;
	
	/* 장바구니 삭제 */
	void deleteCart(String cartNo);

	/* 장바구니 수량 수정 */
	void modifyCart(CartDTO cart);
	
	/* 장바구니 목록 보기 */
	List<CartDTO> selectCartList(String memberId);
	
	/* 장바구니 확인 */
	CartDTO checkCart(CartDTO cart);
	
	/* 장바구니 제거(주문) */
	void deleteOrderCart(CartDTO cartOrder);
	
}
