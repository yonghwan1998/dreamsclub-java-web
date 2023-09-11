package xyz.dreams.service;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dao.CartDAO;
import xyz.dreams.dto.CartDTO;

@Service
@RequiredArgsConstructor
public class CartServiceImpl implements CartService{
	private final CartDAO cartDAO;

	/*장바구니 상품 추가*/
	@Override
	public int addCart(CartDTO cart) throws Exception {
		//장바구니에 데이터 있는지 확인
		CartDTO checkCart = cartDAO.checkCart(cart);
		
		if(checkCart != null) {
			return 2;
		}
		
		//로그인 되어 있으면 장바구니에 굿즈 추가됨. 아니면 0(등록취소)됨
		try {
			return cartDAO.addCart(cart);
		} catch (Exception e) {
			return 0;
		}
		
	}

	/*장바구니 row 삭제*/
	@Override
	public void deleteCart(String cartNo) {
		cartDAO.deleteCart(cartNo);
	}

	/*굿즈 수량 수정하기*/
	@Override
	public void modifyCart(CartDTO cart) {
		cartDAO.modifyCart(cart);
	}

	/*장바구니 목록 보기*/
	@Override
	public List<CartDTO> selectCartList(String memberId) {
		List<CartDTO> cart = cartDAO.selectCartList(memberId);
			
		return cart;
	}

}
