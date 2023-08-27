package xyz.dreams.mapper;

import java.util.List;

import xyz.dreams.dto.CartDTO;

public interface CartMapper {
	/* 장바구니 추가 */
	int insertCart(CartDTO cart);
	
	/* 장바구니 삭제 */
	int deleteCart(CartDTO cart);

	/* 장바구니 수량 수정 */
	int updateCart(CartDTO cart);
	
	/* 장바구니 목록 보기 */
	List<CartDTO> selectCartList(String memberId);
	
	/* 장바구니 확인 */
	public CartDTO checkCart(CartDTO cart);
}
