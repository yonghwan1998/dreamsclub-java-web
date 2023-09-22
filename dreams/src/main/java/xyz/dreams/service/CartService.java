package xyz.dreams.service;

import java.util.List;
import java.util.Map;

import xyz.dreams.dto.CartVO;

public interface CartService{
	/* 형섭(생성): 2023/09/19, 회원의 아이디를 이용한 장바구니 조회 */
	List<CartVO> myCartList(String memberId);
	
	/* 형섭(생성): 2023/09/19, 장바구니 아이디를 이용한 장바구니 조회 */
	CartVO selectCartById(int cartId);
	
	/* 형섭(수정): 2023/09/11, 장바구니에 추가된 상품인지 검색 기능 */
	boolean findCartGoods(CartVO cartVO);
	
	/*형섭(수정): 2023/09/12, 장바구니에 상품 추가 기능*/
	void addGoodsInCart(CartVO cartVO);
	
	/* 형섭(생성): 2023/09/12, 장바구니에서 조건에 맞는 굿즈 삭제 기능 */
	int delFromCart(CartVO cartVO);
}
