package xyz.dreams.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dao.CartDAO;
import xyz.dreams.dto.CartVO;
import xyz.dreams.dto.GoodsDTO;

@Service
@Transactional(propagation = Propagation.REQUIRED)
@RequiredArgsConstructor
public class CartServiceImpl implements CartService{
	private final CartDAO cartDAO;

	@Override
	public Map<String, List> myCartList(CartVO cartVO) {
		Map<String, List> cartMap = new HashMap<String, List>();

		//형섭(23/09/11): cart 테이블에서 회원이 등록한 장바구니 굿즈 id를 가져옴.
		//=> 결과가 1개 이상이므로 list 사용.
		List<CartVO> myCartList = cartDAO.selectCartList(cartVO);
		if(myCartList.size() == 0) {
			return null;
		}
		
		//형섭(23/09/11): cart에서 가져온 굿즈 id를 이용해 상품을 검색. 
		//=> 결과가 1개 이상이므로 list 사용.
		List<GoodsDTO> myGoodsList = cartDAO.selectGoodsList(myCartList);
		cartMap.put("myCartList", myCartList);
		cartMap.put("myGoodsList", myGoodsList);
		
		return cartMap;
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
	public boolean modifyCartQty(CartVO cartVO) {
		boolean result=true;
		cartDAO.updateCartGoodsQty(cartVO);
		return result;
	}

	@Override
	public void removeCartGoods(int cartId) {
		cartDAO.deleteCartGoods(cartId);
	}
}
