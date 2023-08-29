package xyz.dreams.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dto.GoodsDTO;
import xyz.dreams.dto.MemberDTO;
import xyz.dreams.dto.OrderDTO;
import xyz.dreams.service.MemberService;
import xyz.dreams.service.OrderService;

@Controller
@RequiredArgsConstructor
@RequestMapping("/order")
public class OrderController {
	
	  private final OrderService orderService;
	  
	  @RequestMapping(value = "/new", method = RequestMethod.GET) 
	  public String OrderNew(Model model, HttpSession session, OrderDTO opd) { 
		  MemberDTO member = (MemberDTO) session.getAttribute("member");
		  GoodsDTO goods = (GoodsDTO) session.getAttribute("goods"); 
		  System.out.println("Controller1"+goods); 
		  
		  if (member != null) { 
			  String memberId = member.getMemberId(); 
			  MemberDTO memberInfo = orderService.getMemberInfo(memberId);
			  model.addAttribute("memberInfo", memberInfo); model.addAttribute("goods", goods); 
			  model.addAttribute("memberId", memberId);

//			  model.addAttribute("orderList", orderService.getGoods(opd.getOrders()));
//		    	model.addAttribute("memberInfo", orderService.getMemberInfo(memberId));
//		    	System.out.println("memberDTO : "+ member);
//				  System.out.println("OrderDTO : "+ opd);
			  } else { 
				  return "redirect:/login"; 
			  }
	  
	  return "order/order"; }
	  
//	  @RequestMapping(value = "/detail", method = RequestMethod.POST) 
//	  public String OrderView(OrderDTO orderDTO) { 
//		  System.out.println(orderDTO); 
//		  return "redirect:/order/new"; 
//	  }
	 
    
    
    //
	
//	@Autowired
//	private MemberService memberService;
	
//	@RequestMapping(value = "/detail", method = RequestMethod.GET) 
//    public String orderPageGET(@PathVariable("memberId") String memberId, OrderDTO opd, Model model) {
//    	
//    	System.out.println("memberId : "+ memberId);
//    	System.out.println("OrderDTO : "+ opd);
//    	
//    	model.addAttribute("orderList", orderService.getGoods(opd.getOrders()));
//    	model.addAttribute("memberInfo", orderService.getMemberInfo(memberId));
//    	
//    	return "/order";
//    }
}















