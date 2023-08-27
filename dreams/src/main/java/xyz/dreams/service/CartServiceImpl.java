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

	@Override
	public int addCart(CartDTO cart) {
		//상품이 장바구니DB에 있는지 확인
		CartDTO checkCart = cartDAO.checkCart(cart);
		
		if(checkCart != null) {
			return 2;
		}
		
		try {
			return cartDAO.insertCart(cart);
		}catch (Exception e) {
			return 0;
		}
		
	}

	@Override
	public int modifyCart(CartDTO cart) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int removeCart(CartDTO cart) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<CartDTO> getCartList() {
		
		List<CartDTO> cart = cartDAO.selectCart(memberId);
		
		for(CartDTO dto : cart) {
			dto.getTotalPrice();
		}
		
		return null;
	}

	@Override
	public void checkCart(CartDTO cart) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public CartDTO selectCart(String memberId) {
		// TODO Auto-generated method stub
		return null;
	}

}
