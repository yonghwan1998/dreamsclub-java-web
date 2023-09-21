package xyz.dreams.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
@RequiredArgsConstructor
@RequestMapping("/order")
public class OrderController {
    private final OrderService orderService;
    private final GoodsService goodsService;
    private final CartService cartService;
    
    @ResponseBody
    @RequestMapping(value = "/cancel", method = RequestMethod.POST)
    public int orderCancel(OrderDTO orderDTO) {
    	int result = orderService.orderCancel(orderDTO);
    	return result;
    }
    
    @RequestMapping(value = "/result", method = RequestMethod.POST)
    public String order(GoodsDTO goods, MemberDTO memberDTO, CartVO cartVO, Model model
    		/*@ModelAttribute("goodsSize") String goodsSize,
    		@ModelAttribute("goodsCount") int goodsCount,
    		@ModelAttribute("deliverMsg") String deliverMsg,
    		@ModelAttribute("goodsPrice") int goodsPrice,
    		@ModelAttribute("calInfo") String calInfo*/) {
    		
    	OrderDTO orderDTO = new OrderDTO();
    	
    	orderDTO.setMemberId(memberDTO.getMemberId());
    	orderDTO.setMemberName(memberDTO.getMemberName());
    	orderDTO.setMemberPhone(memberDTO.getMemberPhone());
    	orderDTO.setMemberEmail(memberDTO.getMemberEmail());
    	orderDTO.setMemberPcode(memberDTO.getMemberPcode());
    	orderDTO.setMemberAddress1(memberDTO.getMemberAddress1());
    	orderDTO.setMemberAddress2(memberDTO.getMemberAddress2());
    	
    	orderDTO.setGoodsCode(cartVO.getGoodsCode());
    	orderDTO.setGoodsPrice(cartVO.getGoodsPrice());
    	orderDTO.setGoodsCount(cartVO.getGoodsCount());
    	
		/*
		 * orderDTO.setGoodsSize(goodsSize); orderDTO.setGoodsCount(goodsCount);
		 * 
		 * orderDTO.setDeliverMsg(deliverMsg); orderDTO.setOrderStatus(0);
		 * orderDTO.setCalInfo(calInfo);
		 */
    	
    	orderService.insert(orderDTO);
    	model.addAttribute("orderDTO", orderDTO);
    	return "order/order_result";
    }
   
    @RequestMapping(value = "/insert/{cartId}")
    public String orderInsert(@PathVariable("cartId") int cartId, Model model) {
    	System.out.println("test1= "+cartId);
        
        CartVO cartVO = cartService.selectCartById(cartId);
        
        model.addAttribute("cartInfo", cartVO);
        
        
        return "order/order";
    }
}
