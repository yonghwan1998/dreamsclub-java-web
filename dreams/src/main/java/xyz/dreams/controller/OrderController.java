package xyz.dreams.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dto.CartVO;
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
		model.addAttribute("orderInfo", order);
		
		return "order/order_result";
	}

	/*
	 * @RequestMapping(value = "/result", method = RequestMethod.POST) public String
	 * order(GoodsDTO goods, MemberDTO memberDTO, CartVO cartVO, Model model
	 * 
	 * @ModelAttribute("goodsSize") String goodsSize,
	 * 
	 * @ModelAttribute("goodsCount") int goodsCount,
	 * 
	 * @ModelAttribute("deliverMsg") String deliverMsg,
	 * 
	 * @ModelAttribute("goodsPrice") int goodsPrice,
	 * 
	 * @ModelAttribute("calInfo") String calInfo) {
	 * 
	 * OrderDTO orderDTO = new OrderDTO();
	 * 
	 * orderDTO.setMemberId(memberDTO.getMemberId());
	 * orderDTO.setMemberName(memberDTO.getMemberName());
	 * orderDTO.setMemberPhone(memberDTO.getMemberPhone());
	 * orderDTO.setMemberEmail(memberDTO.getMemberEmail());
	 * orderDTO.setMemberPcode(memberDTO.getMemberPcode());
	 * orderDTO.setMemberAddress1(memberDTO.getMemberAddress1());
	 * orderDTO.setMemberAddress2(memberDTO.getMemberAddress2());
	 * 
	 * orderDTO.setGoodsCode(cartVO.getGoodsCode());
	 * orderDTO.setGoodsPrice(cartVO.getGoodsPrice());
	 * orderDTO.setGoodsCount(cartVO.getGoodsCount());
	 * 
	 * 
	 * orderDTO.setGoodsSize(goodsSize); orderDTO.setGoodsCount(goodsCount);
	 * 
	 * orderDTO.setDeliverMsg(deliverMsg); orderDTO.setOrderStatus(0);
	 * orderDTO.setCalInfo(calInfo);
	 * 
	 * 
	 * orderService.insert(orderDTO); model.addAttribute("orderDTO", orderDTO);
	 * return "order/order_result"; }
	 */
	@RequestMapping(value = "/insert")
	public String orderInsert(@ModelAttribute CartVO cart, Model model) {
		System.out.println("test1= " + cart);

		CartVO cartVO = cartService.selectCartById(cart.getCartId());
		System.out.println(cartVO);
		model.addAttribute("cartInfo", cartVO);

		return "order/order";
	}
}
