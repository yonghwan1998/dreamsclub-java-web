package xyz.dreams.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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

	
	@RequestMapping(value = "/result", method = RequestMethod.POST)
	public String order(@ModelAttribute OrderDTO order, Model model) {
		orderService.insert(order);
		System.out.println(order);
		
		OrderDTO orderInfo = orderService.selectByOrderId(order.getOrderId()); 
		model.addAttribute("orderInfo", orderInfo);
		
		return "order/order_result";
	}

	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String orderInsert(@ModelAttribute CartVO cart, Model model) {
		System.out.println("test1= " + cart);

		CartVO cartVO = cartService.selectCartById(cart.getCartId());
		System.out.println(cartVO);
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
}
