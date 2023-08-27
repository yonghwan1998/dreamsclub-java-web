package xyz.dreams.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dto.GoodsDTO;
import xyz.dreams.dto.MemberDTO;
import xyz.dreams.dto.OrderDetailDTO;
import xyz.dreams.service.GoodsService;
import xyz.dreams.service.MemberService;
import xyz.dreams.service.OrderDetailService;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
public class AdminController {
	private final MemberService memberService;
	private final OrderDetailService orderDetailService;
	private final GoodsService goodsService;

//	관리자 회원 관리
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String AdminMemberView(Model model) {
		List<MemberDTO> getMemberList = memberService.getMemberList();
		model.addAttribute("getMemberList", getMemberList);
		return "admin/admin";
	}

//	관리자 주문 관리
	@GetMapping("/order")
	public String AdminOrderView(Model model) {
		List<OrderDetailDTO> getOrderList = orderDetailService.getOrderList();
		model.addAttribute("getOrderList", getOrderList);
		return "admin/admin_order";
	}


//    관리자 굿즈 관리
	@RequestMapping(value = "/goods", method = RequestMethod.GET)
	public String AdminGoodsView(Model model) {

		String q = "";
		List<GoodsDTO> goodsList = goodsService.getGoodsList(q);
		model.addAttribute("goodsList", goodsList);
		model.addAttribute("goodsCount", goodsList.size());

		return "admin/admin_goods";
	}
}
