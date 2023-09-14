package xyz.dreams.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dao.CartDAO;
import xyz.dreams.dto.CartVO;
import xyz.dreams.dto.GoodsDTO;

@Service
@RequiredArgsConstructor
public class CartServiceImpl implements CartService{
	private final CartDAO cartDAO;

	@Override
	public boolean findCartGoods(CartVO cartVO) {
		return cartDAO.findCartGoods(cartVO);
	}

	@Override
	public void addGoodsInCart(CartVO cartVO) {
		cartDAO.addGoodsInCart(cartVO);
	}

	@Override
	public Map<String, List> getMyCart(String memberId) {
		
		Map<String, List> cartMap = new HashMap<String, List>();

		//형섭(23/09/11): cart 테이블에서 회원이 등록한 장바구니 굿즈 id를 가져옴.
		//=> 결과가 1개 이상이므로 list 사용.
		List<CartVO> cartList = cartDAO.getMyCartGoodsCode(memberId);
		if(cartList.size() == 0) {
			return null;
		}
		
		//형섭(23/09/11): cart에서 가져온 굿즈 id를 이용해 상품을 검색. 
		//=> 결과가 1개 이상이므로 list 사용.
		List<GoodsDTO> goodsList = cartDAO.getMyCartList(cartList);
		
		//형섭(23/09/13): goodsCode에서 굿즈명 분리 작업
		for(GoodsDTO goods : goodsList) {
			String goodsCode = goods.getGoodsCode();
			String[] parts = goodsCode.split("-");
			if(parts.length > 0) {
				goods.setGoodsCode(parts[0]);
			}
		}
		
		cartMap.put("cartList", cartList);
		cartMap.put("goodsList", goodsList);
		
		return cartMap;
	}

	

}
