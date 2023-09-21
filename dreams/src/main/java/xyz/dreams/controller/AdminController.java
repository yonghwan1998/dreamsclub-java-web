package xyz.dreams.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dto.GoodsDTO;
import xyz.dreams.dto.MemberDTO;
import xyz.dreams.service.GoodsService;
import xyz.dreams.service.MemberService;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
public class AdminController {
	private final MemberService memberService;
	private final GoodsService goodsService;

	private final WebApplicationContext context;

	/* 관리자 페이지 회원 관리 */
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String AdminMemberView(Model model) {
		List<MemberDTO> getMemberList = memberService.getMemberList();
		model.addAttribute("getMemberList", getMemberList);
		return "admin/admin";
	}

	/* 관리자 페이지 주문 관리 */
	@GetMapping("/order")
	public String AdminOrderView(Model model) {
		//List<OrderDetailDTO> getOrderList = orderDetailService.getOrderList();
		//model.addAttribute("getOrderList", getOrderList);
		return "admin/admin_order";
	}

	/*
	- 방용환(생성) : 2023/08/28, 관리자 페이지 굿즈 출력 기능
	 */
	@RequestMapping(value = "/goods", method = RequestMethod.GET)
	public String AdminGoodsView(Model model) {

		List<GoodsDTO> goodsList = goodsService.getAdminGoodsList();
		model.addAttribute("goodsList", goodsList);

		return "admin/admin_goods";
	}

	/*
	- 방용환(생성) : 2023/09/01, 관리자 페이지 굿즈 등록 페이지 이동
	 */
	@RequestMapping(value = "/goods/write", method = RequestMethod.GET)
	public String AdminGoodsWriteView() {
		return "admin/admin_goods_write";
	}

	/*
	- 방용환(생성) : 2023/09/01, 굿즈 등록 페이지 굿즈 등록
	 */
	@RequestMapping(value = "/goods/write", method = RequestMethod.POST)
	public String AdminGoodsWrite(@ModelAttribute GoodsDTO goods, @RequestParam MultipartFile uploadImage)
			throws IllegalStateException, IOException {

		String uploadDirectory = context.getServletContext().getRealPath("/resources/img/goods-img");
		String uploadName = UUID.randomUUID().toString() + "_" + uploadImage.getOriginalFilename();
		uploadImage.transferTo(new File(uploadDirectory, uploadName));

		goods.setGoodsImage(uploadName);
		goodsService.addAdminGoods(goods);

		return "redirect:/admin/goods";
	}
	
	/*
	- 방용환(생성) : 2023/09/11, 관리자 굿즈 수정 기능
	admin_goods.jsp에서 입력한 수정 값을 받아와 해당 굿즈 정보 UPDATE
	 */
	@ResponseBody
	@RequestMapping(value = "/goods/modify", method = RequestMethod.POST)
	public String AdminGoodsModify(@RequestBody GoodsDTO goods) {
		goodsService.modifyAdminGoods(goods);
		return "success";
	}
	
	/*
	- 방용환(생성) : 2023/09/11, 관리자 굿즈 판매 여부 수정 기능
	admin_goods.jsp에서 클릭한 굿즈의 값이 'Y'라면 'N'으로, 'N'이라면 'Y'로 굿즈 정보 UPDATE
	 */
	@ResponseBody
	@RequestMapping(value = "/goods/modifyYn", method = RequestMethod.POST)
	public String AdminGoodsModifyYn(@RequestBody GoodsDTO goods) {
		goodsService.modifyAdminGoodsYn(goods);

		if (goods.getGoodsYn().equals("Y")) {
			return "Y";
		} else if (goods.getGoodsYn().equals("N")) {
			return "N";
		} else {
			return "fail";
		}
	}
}
