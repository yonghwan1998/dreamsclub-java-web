package xyz.dreams.controller;


import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dto.GoodsDTO;
import xyz.dreams.dto.MemberDTO;
import xyz.dreams.dto.OrderDetailDTO;
import xyz.dreams.service.OrderDetailService;
import xyz.dreams.service.OrderService;


@Controller
@RequiredArgsConstructor
@RequestMapping("/order")
public class OrderDetailController {
	private final OrderService orderService;

   @RequestMapping(value = "/detail" ,method = RequestMethod.GET)
   public String viewOrder(HttpSession session, Model model) {
       MemberDTO member = (MemberDTO) session.getAttribute("member");
	   GoodsDTO goods = (GoodsDTO) session.getAttribute("goods"); 
       System.out.println("Controller1"+goods);
       
       if (member != null) {
    	   String memberId = member.getMemberId();
    	   MemberDTO memberInfo = orderService.getMemberInfo(memberId);

           model.addAttribute("memberId", memberId);
           model.addAttribute("goods", goods);
           model.addAttribute("memberInfo", memberInfo); 

       }
       
       return "order/order_detail";
   }
}