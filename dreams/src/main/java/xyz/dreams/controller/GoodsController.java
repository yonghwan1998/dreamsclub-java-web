package xyz.dreams.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dto.GoodsDTO;
import xyz.dreams.dto.MemberDTO;
import xyz.dreams.service.GoodsService;

@Controller
@RequiredArgsConstructor
@RequestMapping("/goods")
public class GoodsController {
	private final GoodsService goodsService;

//	GET - 굿즈 메인 페이지

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String view(Model model) {
		String q = "";
		List<GoodsDTO> goodsList = goodsService.getGoodsList(q);
		model.addAttribute("goodsList", goodsList);
		model.addAttribute("goodsCount", goodsList.size());
		return "goods/goods_main";
	}

	@RequestMapping(value = "/main/search", method = RequestMethod.GET)
	public String search(@RequestParam String q, Model model) {
		List<GoodsDTO> goodsList = goodsService.getGoodsList(q);
		model.addAttribute("goodsList", goodsList);
		model.addAttribute("goodsCount", goodsList.size());
		return "goods/goods_main";
	}

//	POST - 굿즈 메인 페이지

//	GET - 굿즈 상세 페이지

	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(HttpServletRequest request, Model model) {
		String goodsCode = request.getParameter("goodsCode");
		model.addAttribute("goodsCode", goodsCode);

		GoodsDTO goodsDetail = goodsService.getGoodsDetail(goodsCode);
		model.addAttribute("goodsDetail", goodsDetail);

		return "goods/goods_detail";
	}

//	POST - 굿즈 상세 페이지
	
	@RequestMapping(value = "/detail", method = RequestMethod.POST)
	public String purchase(@ModelAttribute GoodsDTO goods, Model model) {
		model.addAttribute("goods", goods);
		System.out.println(goods);
		return "order/new";
	}


}