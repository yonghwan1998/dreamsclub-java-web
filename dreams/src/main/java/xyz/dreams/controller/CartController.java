package xyz.dreams.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dto.CartVO;
import xyz.dreams.dto.GoodsDTO;
import xyz.dreams.dto.MemberDTO;
import xyz.dreams.dto.OrderDTO;
import xyz.dreams.service.CartService;
import xyz.dreams.service.OrderService;

@Controller
@RequestMapping(value = "/cart")
@RequiredArgsConstructor
public class CartController {
	private final CartService cartService;
	
	private final OrderService orderService;
	
	//형섭(23/09/11): 세션에서 굿즈 정보를 가져온 후 굿즈 정보를 모델에 추가하여 뷰로 전달하는 handler.
	@RequestMapping(value = "/purchase", method = RequestMethod.GET)
	public String purchaseGoods(HttpSession session, Model model) {
		
	    GoodsDTO goods = (GoodsDTO) session.getAttribute("goods");
	    
	    model.addAttribute("goods", goods);
	    
	    return "order/order";
	}
	
	
	//형섭(23/09/11): 세션에 저장된 로그인 정보를 이용해 굿즈를 장바구니에 담는 handler.
	@ResponseBody
	@RequestMapping(value = "/{goodsCode}", method = RequestMethod.POST)
	public String addGoodsInCart(@PathVariable("goodsCode") String goodsCode, HttpSession session) {
		//로그인 되어 있는 정보를 이용해서 memberId를 가져온다.
		MemberDTO memberInfo = (MemberDTO)session.getAttribute("member");
		String memberId = memberInfo.getMemberId();
		
		//cart 객체 생성, 객체 안에 memberId와 goodsCode를 set.
		CartVO cartVO = new CartVO();
		
		cartVO.setMemberId(memberId);
		cartVO.setGoodsCode(goodsCode);
		
		//해당 상품이 카트에 존재하는지 여부를 판별해주는 메서드
		boolean isAlreadyExisted = cartService.findCartGoods(cartVO);
		System.out.println("isAlreadyExisted : "+ isAlreadyExisted);
		
		if(isAlreadyExisted) {
			return "already_existed";//이미 카트에 있으면, already_existed를 리턴
		} else {
			cartService.addGoodsInCart(cartVO);
			return "add_success";	//카트에 없으면 카트에 저장 후, add_success를 리턴
		}
	}
	
	/*  형섭(23/09/11): 'memberId'로 들어오는 요청을 받는 handler.
		memberId로 cart 테이블에서 장바구니에 넣은 목록을 검색해 가져온 뒤,
		목록을 바로 mybatis로 넘겨 goods 테이블에서 장바구니에 넣은 상품들의 정보를 확인해
		한번에 가져올 수 있도록 map 사용. getMyCart는 2가지 List를 가짐. */
	@RequestMapping(value = "/mycart/{memberId}", method = RequestMethod.GET)
	public String myCart(@PathVariable("memberId") String memberId, Model model) {
		Map<String, List> cartMap = cartService.getMyCart(memberId);		
		model.addAttribute("cartMap", cartMap);
		return "cart/mycart";
	}
	
	@ResponseBody
	@RequestMapping(value = "/delFromCart", method = RequestMethod.POST)
	public String delFromCart(CartVO cartVO) {
		
		boolean result = orderService.delFromCart(cartVO);
		if(result) {
			return "ok";
		} else {
			return "no";
		}
	}
	
	@RequestMapping(value = "/result", method = RequestMethod.POST)
    public void cartOrderResult(OrderDTO[] arr) {
    	
    	for(int i=0; i<arr.length; i++) {
    		OrderDTO orderDTO = arr[i];
    		System.out.println(orderDTO);
    	}
    }

}











