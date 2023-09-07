package xyz.dreams.mapper;

import java.util.List;

import xyz.dreams.dto.CartDTO;

public interface CartMapper {
	/* 장바구니 추가 */
	int addCart(CartDTO cart) throws Exception;
	
	/* 장바구니 삭제(row 삭제) */
	int deleteCart(String cartNo);

	/* 장바구니 수량 수정 */
	int modifyCart(CartDTO cart);
	
	/* 장바구니 목록 보기 */
	List<CartDTO> selectCartList(String memberId);
	
	/* 장바구니 확인 */
	CartDTO checkCart(CartDTO cart);
	
	/* 장바구니 제거(주문) */
	int deleteOrderCart(CartDTO cartOrder);

}
