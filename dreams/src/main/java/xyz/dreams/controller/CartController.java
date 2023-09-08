package xyz.dreams.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dto.CartDTO;
import xyz.dreams.dto.GoodsDTO;
import xyz.dreams.service.CartService;

@Controller
@RequestMapping(value = "/cart")
@RequiredArgsConstructor
public class CartController {
	private final CartService cartService;
	
	/* 장바구니 추가 => 어떤 역할하는지 자세히 보고싶으면 goods_detail.jsp에 있는 js 참고하세용 */
	/**
	 * 0: 등록 실패
	 * 1: 등록 성공
	 * 2: 등록된 데이터 존재
	 * 5: 로그인 필요
	 * 
	 */
	
	/*장바구니 상품 추가하기*/
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addCartPOST(CartDTO cartDTO, Model model, HttpSession session) throws Exception{
		//질문: HttpServletRequest request 이랑 HttpSession session이랑 뭐가 다른거?
		
		//로그인아이디 가져오기
		CartDTO cartLogin = (CartDTO)session.getAttribute("member");
		
		//로그인 안되어있으면 로그인 필요 경고창 반환(jsp에서 js넣어주기)
		if(cartLogin == null) {
			return "5";
		}
		GoodsDTO goods = (GoodsDTO)model.getAttribute("goods");
		
		int result = cartService.addCart(cartDTO);
		
		return result+"";
		
	}

	
	/*장바구니 목록 보기*/
	@RequestMapping(value = " ", method = RequestMethod.GET)
	public String cartPage(@PathVariable("memberId") String memberId, Model model) {
		
		model.addAttribute("cartInfo", cartService.selectCartList(memberId));
		
		return "cart/cart";
	}


	/*장바구니 수량 수정(추가)*/
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String updateCartPOST(CartDTO cartDTO) {
		
		cartService.modifyCart(cartDTO);
		
		return "redirect:/cart/"+cartDTO.getMemberId();
	}
	
	
	/*장바구니 삭제(row 삭제)*/
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String deleteCartPOST(CartDTO cartDTO) {
		cartService.deleteCart(cartDTO.getCartNo());
		return "redirect:/cart/"+cartDTO.getMemberId();
	}
	
	
	/*주문페이지로 주문요청 상품 정보 넘기기*/
	@RequestMapping(value="", method = RequestMethod.POST)
	public String orderGo(@ModelAttribute CartDTO cart, RedirectAttributes attr) {
		
		//장바구니의 값들을 주문페이지로 넘기기
		attr.addFlashAttribute("cart", cart);
		
		return "redirect:/order/new";
	}

}