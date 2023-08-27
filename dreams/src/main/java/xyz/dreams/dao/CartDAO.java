package xyz.dreams.dao;

import java.util.List;

import xyz.dreams.dto.CartDTO;
import xyz.dreams.dto.Userinfo;

public interface CartDAO {
	/* 장바구니 추가 (여기서 모든 Cart는 DTO 클래스임) */
	int insertCart(CartDTO cart);
	
	/* 장바구니 삭제 */
	int deleteCart(CartDTO cart);

	/* 장바구니 수량 수정 */
	int updateCart(CartDTO cart);
	
	/* 장바구니 목록 보기 */
	List<CartDTO> selectCartList(String memberId);
	
	/*장바구니 목록 하나 보기*/
	CartDTO selectCart(String memberId);

	/* 장바구니 확인 */
	public CartDTO checkCart(CartDTO cart);
}
