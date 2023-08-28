package xyz.dreams.controller;


import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dto.MemberDTO;
import xyz.dreams.dto.OrderDetailDTO;
import xyz.dreams.service.OrderDetailService;


@Controller
@RequiredArgsConstructor
@RequestMapping("/order/detail")
public class OrderDetailController {
   private final OrderDetailService orderDetailService;

   @RequestMapping(method = RequestMethod.GET)
   public String viewOrder(HttpSession session, Model model) {
       MemberDTO member = (MemberDTO) session.getAttribute("member");
       System.out.println("Controller1"+member);
       if (member != null) {
    	   String memberId = member.getMemberId();
           model.addAttribute("memberId", memberId);

           OrderDetailDTO orderDetail = orderDetailService.getOrderById(memberId);
           if (orderDetail != null) {
               model.addAttribute("orderDetail", orderDetail);
           } else {
               // 주문 정보가 없을 경우에 대한 처리
        	   System.out.println("주문 정보가 없습니다.");
           }
       }
       
       return "order/order_detail";
   }
}