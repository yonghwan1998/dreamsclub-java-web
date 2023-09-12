package xyz.dreams.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dto.GoodsDTO;
import xyz.dreams.dto.MemberDTO;
import xyz.dreams.dto.OrderDTO;
import xyz.dreams.service.GoodsService;
import xyz.dreams.service.MemberService;
import xyz.dreams.service.OrderService;

@Controller
@RequiredArgsConstructor
@RequestMapping("/order")
public class OrderController {
    private final OrderService orderService;
    private final MemberService memberService;
    private final GoodsService goodsService;

	/*
	 * @RequestMapping(value = "/new", method = RequestMethod.GET) public String
	 * orderNew(Model model, HttpSession session) { MemberDTO member = (MemberDTO)
	 * session.getAttribute("member"); GoodsDTO goods = (GoodsDTO)
	 * model.getAttribute("goods"); System.out.println("model = " + model);
	 * System.out.println("goods = " + goods);
	 * 
	 * if (member != null) { String memberId = member.getMemberId(); MemberDTO
	 * memberInfo = orderService.getMemberInfo(memberId);
	 * model.addAttribute("memberInfo", memberInfo); model.addAttribute("goods",
	 * goods); model.addAttribute("memberId", memberId); } else { return
	 * "redirect:/login"; }
	 * 
	 * return "order/order"; }
	 * 
	 * @RequestMapping(value = "/detail", method = RequestMethod.POST) public String
	 * submitOrder(@RequestParam("orderMemo") String orderMemo, RedirectAttributes
	 * redirectAttributes) { redirectAttributes.addAttribute("orderMemo",
	 * orderMemo); // 배송 요청사항을 쿼리 파라미터로 추가하여 리다이렉트 return "redirect:/order/detail";
	 * }
	 * 
	 * @RequestMapping(value = "/detail", method = RequestMethod.GET) public String
	 * viewOrder(HttpSession session, HttpServletRequest request, Model model) {
	 * MemberDTO member = (MemberDTO) session.getAttribute("member"); GoodsDTO goods
	 * = (GoodsDTO) session.getAttribute("goods"); System.out.println("Controller1"
	 * + goods);
	 * 
	 * if (member != null) { String memberId = member.getMemberId(); MemberDTO
	 * memberInfo = orderService.getMemberInfo(memberId);
	 * model.addAttribute("memberId", memberId); model.addAttribute("goods", goods);
	 * model.addAttribute("memberInfo", memberInfo);
	 * 
	 * // 배송 요청사항 추출 String orderMemo = request.getParameter("orderMemo"); if
	 * (orderMemo != null && !orderMemo.isEmpty()) { model.addAttribute("orderMemo",
	 * orderMemo); } }
	 * 
	 * return "order/order_detail"; }
	 */
    
    @RequestMapping(value = "/result", method = RequestMethod.POST)
    public String order(GoodsDTO goodsDTO, MemberDTO memberDTO, Model model,
    		@ModelAttribute("selected_opt") String selectedOpt,
    		@ModelAttribute("order_qty") int orderQty,
    		@ModelAttribute("deliver_msg") String deliverMsg,
    		@ModelAttribute("total_amount") String totalAmount,
    		@ModelAttribute("cal_info") String calInfo) {
    		
    	OrderDTO orderDTO = new OrderDTO();
    	
    	goodsDTO = goodsService.getGoodsDetail(goodsDTO.getGoodsCode());
    	
    	orderDTO.setMemberId(memberDTO.getMemberId());
    	orderDTO.setMemberName(memberDTO.getMemberName());
    	orderDTO.setMemberPhone(memberDTO.getMemberPhone());
    	orderDTO.setMemberEmail(memberDTO.getMemberEmail());
    	orderDTO.setMemberPcode(memberDTO.getMemberPcode());
    	orderDTO.setMemberAddress1(memberDTO.getMemberAddress1());
    	orderDTO.setMemberAddress2(memberDTO.getMemberAddress2());
    	
    	orderDTO.setGoodsCode(goodsDTO.getGoodsCode());
    	orderDTO.setGoodsPrice(goodsDTO.getGoodsPrice());
    	orderDTO.setGoodsStock(goodsDTO.getGoodsStock());
    	orderDTO.setGoodsInfo(goodsDTO.getGoodsInfo());
    	
    	orderDTO.setSelectedOpt(selectedOpt);
    	orderDTO.setOrderQty(orderQty);
    	orderDTO.setDeliverMsg(deliverMsg);
    	orderDTO.setOrderStatus(0);
    	orderDTO.setCalInfo(calInfo);
    	
//    	int totalAmount = Integer.parseInt(totalAmount);
//    	orderDTO.setTotalAmount(totalAmount);
    	
    	orderService.insert(orderDTO);
    	model.addAttribute("orderDTO", orderDTO);
    	
    	return "order/order_result";
    }
    
    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    public String orderInsert(GoodsDTO goodsDTO, HttpSession session, Model model,
    		@ModelAttribute("selected_Opt") String selectedOpt, 
    		@ModelAttribute("order_qty") String orderQty) {
    	MemberDTO memberInfo = (MemberDTO)session.getAttribute("member");
    	memberInfo = memberService.getMember(memberInfo.getMemberId());
    	goodsDTO = goodsService.getGoodsDetail(goodsDTO.getGoodsCode());
    	
    	model.addAttribute("memberInfo", memberInfo);
    	model.addAttribute("goodsInfo", goodsDTO);
    	model.addAttribute("order_Qty", orderQty);
    	model.addAttribute("selected_Opt", selectedOpt);
    	
    	return "order/order";
    }
    
    @RequestMapping(value = "/insert/{goodsCode}", method = RequestMethod.GET)
    public String orderInsert(@PathVariable("goodsCode") String goodsCode, 
    		HttpSession session, Model model) {
    	MemberDTO memberInfo = (MemberDTO)session.getAttribute("member");
    	memberInfo = memberService.getMember(memberInfo.getMemberId());
    	GoodsDTO goodsDTO = goodsService.getGoodsDetail(goodsCode);
    	
    	model.addAttribute("memberInfo", memberInfo);
    	model.addAttribute("goodsInfo", goodsDTO);
    	
    	return "order/order";
    }
}
