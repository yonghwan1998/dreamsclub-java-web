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

	@Override
	public List<CartVO> myCartList(String memberId) {

		//형섭(23/09/11): cart 테이블에서 회원이 등록한 장바구니 굿즈 id를 가져옴.
		List<CartVO> cartList = cartDAO.selectCartList(memberId);
		if(cartList.size() == 0) {
			return null;
		}
		
		return cartList;
	}

	@Override
	public CartVO selectCartById(int cartId) {
		CartVO cartVO = cartDAO.selectCartById(cartId);
		
		int goodsPrice = cartVO.getGoodsPrice();
		int goodsCount = cartVO.getGoodsCount();
		
		cartVO.setGoodsPrice(goodsPrice*goodsCount);
		return cartVO;
	}
	
	@Override
	public boolean findCartGoods(CartVO cartVO) {
		return cartDAO.findCartGoods(cartVO);
	}

	@Override
	public void addGoodsInCart(CartVO cartVO) {
		cartDAO.addGoodsInCart(cartVO);
	}

	@Override
	public boolean updateGoodsCount(CartVO cartVO) {
		boolean result=true;
		cartDAO.updateGoodsCount(cartVO);
		return result;
	}
	
	@Transactional
	@Override
	public int delFromCart(CartVO cartVO) {
		
		return cartDAO.delFromCart(cartVO);
	}

}
