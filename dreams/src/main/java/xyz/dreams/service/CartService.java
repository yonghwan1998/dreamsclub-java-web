package xyz.dreams.service;

import java.util.List;

import xyz.dreams.dto.CartDTO;

public interface CartService{

	/* 장바구니 추가 */
	public int addCart(CartDTO cart);
	
	/* 장바구니 수정 */
	public int modifyCart(CartDTO cart);
	
	/* 장바구니 삭제 */
	public int removeCart(CartDTO cart);
	
	/* 장바구니 목록 보기 */
	List<CartDTO> getCartList();
	
	/*장바구니 목록 하나 보기*/
	CartDTO selectCart(String memberId);
	
	/* 장바구니 확인 */
	void checkCart(CartDTO cart);
	
}
