package xyz.dreams.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dto.CartVO;
import xyz.dreams.dto.GoodsDTO;
import xyz.dreams.dto.MemberDTO;
import xyz.dreams.dto.OrderDTO;
import xyz.dreams.service.CartService;
import xyz.dreams.service.GoodsService;
import xyz.dreams.service.MemberService;
import xyz.dreams.service.OrderService;

@Controller
@RequestMapping(value = "/cart")
@RequiredArgsConstructor
public class CartController {
	private final CartService cartService;
	private final MemberService memberService;
	private final GoodsService goodsService;
	
	@RequestMapping(value="/mycart/{memberId}" ,method = RequestMethod.GET)
	public String myCart(CartVO cartVO, Model model)  throws Exception {
		Map<String, List> cartMap = cartService.myCartList(cartVO);
		model.addAttribute("cartMap", cartMap);
		return "cart/mycart";
	}
	
	@ResponseBody
	@RequestMapping(value="/{goodsCode}" ,method = RequestMethod.POST,produces = "application/text; charset=utf8")
	public String addGoodsInCart(@RequestParam("goods_code") String goodsCode,
			                    HttpSession session)  throws Exception{
		
		MemberDTO memberInfo = (MemberDTO) session.getAttribute("member");
		String memberId = memberInfo.getMemberId();
		
		CartVO cartVO = new CartVO();
		cartVO.setMemberId(memberId);
		cartVO.setGoodsCode(goodsCode);
		
		boolean isAreadyExisted=cartService.findCartGoods(cartVO);
		System.out.println("isAreadyExisted:"+isAreadyExisted);
		
		if(isAreadyExisted==true){
			return "already_existed";
		}else{
			cartService.addGoodsInCart(cartVO);
			return "add_success";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/modifyCartQty" ,method = RequestMethod.POST)
	public String modifyCartQty(@RequestParam("goods_code") String goodsCode,
								@RequestParam("cart_goods_qty") int cartGoodsQty,
								HttpSession session)  throws Exception{
		MemberDTO memberInfo = (MemberDTO) session.getAttribute("member");
		String memberId = memberInfo.getMemberId();
		
		CartVO cartVO = new CartVO();
		cartVO.setMemberId(memberId);
		cartVO.setGoodsCode(goodsCode);
		cartVO.setCartGoodsQty(cartGoodsQty);
		
		boolean result=cartService.modifyCartQty(cartVO);
		
		if(result==true){
			return "modify_success";
		}else{
			return "modify_failed";	
		}
		
	}
	
	@RequestMapping(value="/removeCartGoods" ,method = RequestMethod.POST)
	public String removeCartGoods(@RequestParam("cart_id") int cartId)  throws Exception{
		cartService.removeCartGoods(cartId);
		
		return "redirect:/cart/mycart/{memberId}";
	}
}