package xyz.dreams.controller;


import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dto.CartVO;
import xyz.dreams.dto.GoodsDTO;
import xyz.dreams.dto.OrderDTO;
import xyz.dreams.service.CartService;
import xyz.dreams.service.GoodsService;
import xyz.dreams.service.OrderService;

@Controller
@RequiredArgsConstructor
@RequestMapping("/order")
public class OrderController {
	private final OrderService orderService;
	private final CartService cartService;
	private final GoodsService goodsService;

	@ResponseBody
	@RequestMapping(value = "/cancel", method = RequestMethod.POST)
	public int orderCancel(OrderDTO orderDTO) {
		int result = orderService.orderCancel(orderDTO);
		return result;
	}
	@RequestMapping(value = "/result", method = RequestMethod.GET)
	public String order() {
		return "order/order_result";
	}
	
	
	@RequestMapping(value = "/result", method = RequestMethod.POST)
	public String order(@ModelAttribute OrderDTO order, Model model) {
		orderService.insert(order);
		System.out.println(order);
		
		OrderDTO orderInfo = orderService.selectByOrderId(order.getImpUid()); 
		model.addAttribute("orderInfo", orderInfo);
		
		return "order/order_result";
	}

	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String orderInsert(@ModelAttribute CartVO cart, Model model) {

		CartVO cartVO = cartService.selectCartById(cart.getCartId());
		model.addAttribute("cartInfo", cartVO);

		return "order/order";
	}
	
	@RequestMapping(value = "/insertGoods", method = RequestMethod.POST)
	public String GoodsOrder(@ModelAttribute("goodsCode") String goodsCode, @RequestParam("goodsCount") int goodsCount, Model model) {

		GoodsDTO goods = goodsService.getOrderGoods(goodsCode);
		goods.setGoodsCount(goodsCount);
		goods.setGoodsPrice(goods.getGoodsCount() * goods.getGoodsPrice());
		
		model.addAttribute("cartInfo", goods);
		
		return "order/order";
	}
	
	@RequestMapping(value = "/pay", method = RequestMethod.POST)
	@ResponseBody
	public String pay(@RequestBody OrderDTO payment, HttpSession session) {
		// 결제 관련 API를 이용하기 전에 결제 금액 검증을 위해 세션에 주문번호(이름)와 결제금액(값)을 저장
		System.out.println(payment);
		session.setAttribute(payment.getMerchantUid(), payment.getGoodsPrice());
		return "ok";
	}

	// 결제 후 결제 금액을 검증하여 응답하는 요청 처리 메소드
	@RequestMapping(value = "/complete", method = RequestMethod.POST)
	@ResponseBody
	public String complete(@RequestBody OrderDTO payment, HttpSession session) {

		// 접근 토큰을 발급받아 저장
		String accessToken = orderService.getAccessToken(payment);

		// 토큰과 결제고유값을 전달하여 API를 이용하여 결제정보를 반환받아 저장
		OrderDTO uniquePayment = orderService.getPayment(accessToken, payment.getImpUid());
		payment.setImpUid(uniquePayment.getImpUid());
		payment.setMerchantUid(uniquePayment.getMerchantUid());
		payment.setGoodsPrice(uniquePayment.getGoodsPrice());
		payment.setStatus(uniquePayment.getStatus());

		// 결제 페이지에서 전달 받은 정보 저장
		OrderDTO returnPayment = payment;

		// 세션에 저장된 결제 금액을 반환받아 저장
		Long beforeAmount = (Long) session.getAttribute(payment.getMerchantUid());
		session.removeAttribute(payment.getMerchantUid());

		// 결제된 결제금액을 반환받아 저장
		Long amount = returnPayment.getGoodsPrice();

		if (beforeAmount.equals(amount)) {// 검증 성공
			System.out.println("Controller : " + returnPayment);
			orderService.insert(returnPayment);// 테이블에 결제정보 삽입 처리
			orderService.modifyStatusComplete(payment.getImpUid());
			return "success";
		} else {// 검증 실패(결제 금액 불일치) - 위변조된 결제
			orderService.canclePayment(accessToken, returnPayment);
			return "forgery";
		}
	}
}
