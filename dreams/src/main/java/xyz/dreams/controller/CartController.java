package xyz.dreams.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dto.CartDTO;
import xyz.dreams.dto.MemberDTO;
import xyz.dreams.service.CartService;

@Controller
@RequiredArgsConstructor
public class CartController {
	private final CartService cartService;
	
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String cart() {
		return "/cart/cart";
	}
	
	/*장바구니 추가*/
	@RequestMapping(value = "/cart/add", method = RequestMethod.POST)
	@ResponseBody
	public String addCartPOST(CartDTO cart, HttpServletRequest request) {
		//로그인 체크
		HttpSession session = request.getSession();
		MemberDTO mdto = (MemberDTO)session.getAttribute("member");
		if(mdto==null) {
			return "5";
		}
		//장바구니 등록
		int result=cartService.addCart(cart);
		return result+"";
			
	}
	
	@GetMapping("/cart/{memberId}")
	public String cartPageGET(@PathVariable("memberId") String memberId, Model model) {
		model.addAttribute("cartInfo", cartService.getCartList(memberId));
		
		return "/cart/cart";
	}
}