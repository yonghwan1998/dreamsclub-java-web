package xyz.dreams.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dao.CartDAO;
import xyz.dreams.dto.CartVO;

@Service
@RequiredArgsConstructor
public class CartServiceImpl implements CartService{
	private final CartDAO cartDAO;

	/* 형섭(수정): 2023/09/19, 회원의 아이디를 이용한 장바구니 조회 */
	@Override
	public List<CartVO> myCartList(String memberId) {

		//형섭(23/09/11): cart 테이블에서 회원이 등록한 장바구니 굿즈 id를 가져옴.
		List<CartVO> cartList = cartDAO.selectCartList(memberId);
		if(cartList.size() == 0) {
			return null;
		}
		
		return cartList;
	}

	/* 
	 형섭(수정): 2023/09/21, 장바구니 아이디를 이용한 장바구니 조회 
	 굿즈 가격 계산하는 기능 추가
	 */
	@Override
	public CartVO selectCartById(int cartId) {
		CartVO cartVO = cartDAO.selectCartById(cartId);
		
		int goodsPrice = cartVO.getGoodsPrice();
		int goodsCount = cartVO.getGoodsCount();
		
		cartVO.setGoodsPrice(goodsPrice*goodsCount);
		return cartVO;
	}
	
	/* 형섭(수정): 2023/09/11, 장바구니에 추가된 상품인지 검색 기능 */
	@Override
	public boolean findCartGoods(CartVO cartVO) {
		return cartDAO.findCartGoods(cartVO);
	}

	/*형섭(수정): 2023/09/12, 장바구니에 상품 추가 기능*/
	@Override
	public void addGoodsInCart(CartVO cartVO) {
		cartDAO.addGoodsInCart(cartVO);
	}
	
	/* 형섭(생성): 2023/09/12, 장바구니에서 조건에 맞는 굿즈 삭제 기능 */
	@Transactional
	@Override
	public int delFromCart(CartVO cartVO) {
		
		return cartDAO.delFromCart(cartVO);
	}

}
