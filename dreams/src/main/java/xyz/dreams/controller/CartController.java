package xyz.dreams.controller;

import java.io.Console;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
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
	
	@RequestMapping(value="/mycart/{memberId}" ,method = RequestMethod.GET)
	public String myCart(@PathVariable("memberId") String memberId, GoodsDTO goods, Model model) {
		List<CartVO> cartList = cartService.myCartList(memberId);
		model.addAttribute("cartList", cartList);
		return "cart/mycart";
	}
	
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
		
		
		boolean isAreadyExisted=cartService.findCartGoods(cartVO);
		System.out.println("isAreadyExisted:"+isAreadyExisted);
		
		if(isAreadyExisted){
			return "already_existed";
		}else{
			cartService.addGoodsInCart(cartVO);
			return "add_success";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/modifyCartQty" ,method = RequestMethod.POST)
	public String modifyCartQty(@RequestParam("goodsCode") String goodsCode,
								@RequestParam("goodsCount") int goodsCount,
								HttpSession session)  throws Exception{
		MemberDTO memberInfo = (MemberDTO) session.getAttribute("member");
		String memberId = memberInfo.getMemberId();
		
		CartVO cartVO = new CartVO();
		cartVO.setMemberId(memberId);
		cartVO.setGoodsCode(goodsCode);
		cartVO.setGoodsCount(goodsCount);
		
		boolean result=cartService.updateGoodsCount(cartVO);
		
		if(result==true){
			return "modify_success";
		}else{
			return "modify_failed";	
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/delFromCart", method = RequestMethod.POST)
	public String delFromCart(CartVO cartVO) {
		System.out.println("cartVO = "+cartVO);
		
	    int result = cartService.delFromCart(cartVO);
	    if (result == 1) {
	        return "ok";
	    } else {
	        return "no";
	    }
	}
}