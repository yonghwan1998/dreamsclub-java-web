package xyz.dreams.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dto.CartVO;
import xyz.dreams.dto.GoodsDTO;
import xyz.dreams.dto.MemberDTO;
import xyz.dreams.service.CartService;

@Controller
@RequestMapping(value = "/cart")
@RequiredArgsConstructor
public class CartController {
	private final CartService cartService;
	
	/* 형섭(수정): 2023/09/20, 나의 장바구니 조회 */
	@RequestMapping(value="/mycart/{memberId}" ,method = RequestMethod.GET)
	public String myCart(@PathVariable("memberId") String memberId, GoodsDTO goods, Model model) {
		List<CartVO> cartList = cartService.myCartList(memberId);
		model.addAttribute("cartList", cartList);
		return "cart/mycart";
	}
	
	
	/* 형섭(수정): 2023/09/20, 장바구니에 굿즈 정보 추가 */
	@ResponseBody
	@RequestMapping(value="/addGoodsInCart" ,method = RequestMethod.POST)
	public String addGoodsInCart(@RequestBody GoodsDTO goods, HttpSession session)  throws Exception{
		
		String goodsCode = goods.getGoodsCode();
		
		MemberDTO memberInfo = (MemberDTO) session.getAttribute("member");
		String memberId = memberInfo.getMemberId();
		
		CartVO cartVO = new CartVO();
		cartVO.setMemberId(memberId);
		cartVO.setGoodsCode(goodsCode);
		cartVO.setGoodsCount(goods.getGoodsCount());
		
		
		/* boolean을 이용하여 카트에 등록되어 있는 굿즈인지 여부 판단 */
		boolean isAreadyExisted=cartService.findCartGoods(cartVO);
		System.out.println("isAreadyExisted:"+isAreadyExisted);
		
		if(isAreadyExisted){
			return "already_existed";
		}else{
			cartService.addGoodsInCart(cartVO);
			return "add_success";
		}
	}

	/* 형섭(수정): 2023/09/21, 장바구니에서 굿즈 삭제 */
	@ResponseBody
	@RequestMapping(value = "/delFromCart", method = RequestMethod.POST)
	public String delFromCart(CartVO cartVO) {
		System.out.println("cartVO = "+cartVO);
		
		/* 형섭(수정): 2023/09/21, view에서 result값을 전달하여 삭제 처리 */ 
	    int result = cartService.delFromCart(cartVO);
	    if (result == 1) {
	        return "ok";
	    } else {
	        return "no";
	    }
	}
}