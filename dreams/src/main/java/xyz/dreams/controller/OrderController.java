package xyz.dreams.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dto.GoodsDTO;
import xyz.dreams.dto.MemberDTO;
import xyz.dreams.dto.OrderDTO;
import xyz.dreams.service.OrderService;

@Controller
@RequiredArgsConstructor
@RequestMapping("/order")
public class OrderController {
    private final OrderService orderService;
    
    @RequestMapping(value = "/new", method = RequestMethod.GET)
    public String orderPage(Model model, HttpSession session) {
        MemberDTO member = (MemberDTO) session.getAttribute("member");
        GoodsDTO goods = (GoodsDTO) session.getAttribute("goods");
        System.out.println("Controller1"+goods);
        if (member != null) {
            String memberId = member.getMemberId();
            MemberDTO memberInfo = orderService.getMemberInfo(memberId);
            model.addAttribute("memberInfo", memberInfo);
            model.addAttribute("goods", goods);
            model.addAttribute("memberId", memberId);
        }
        
        return "order/order";
    }
    
    @PostMapping
    public String orderPage(OrderDTO orderDTO, HttpServletRequest request) {
        System.out.println(orderDTO);
        return "redirect:/order/new";
    }
}