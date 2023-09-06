package xyz.dreams.service;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dao.CartDAO;
import xyz.dreams.dto.CartDTO;
import xyz.dreams.mapper.CartMapper;

@Service
@RequiredArgsConstructor
public class CartServiceImpl implements CartService{
	private final CartDAO cartDAO;

	@Override
	public int addCart(CartDTO cart) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void deleteCart(String cartNo) {
		cartDAO.deleteCart(cartNo);
	}

	@Override
	public void modifyCart(CartDTO cart) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<CartDTO> selectCartList(String memberId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CartDTO checkCart(CartDTO cart) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteOrderCart(CartDTO cartOrder) {
		// TODO Auto-generated method stub
		
	}

}
