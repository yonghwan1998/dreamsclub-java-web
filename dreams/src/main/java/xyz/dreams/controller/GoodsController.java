package xyz.dreams.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dto.GoodsDTO;
import xyz.dreams.service.GoodsService;

@Controller
@RequiredArgsConstructor
@RequestMapping("/goods")
public class GoodsController {
	private final GoodsService goodsService;

//	GET - 굿즈 메인 페이지

	@RequestMapping("/main")
	public String view(String q, @RequestParam(defaultValue = "goods_code") String column, Model model) {

		if (q != null) {
			q = q.replaceAll(" ", "");
		}
		Map<String, Object> map = new HashMap<>();
		map.put("q", q);
		map.put("column", column);

		List<GoodsDTO> goodsList = goodsService.getGoodsList(map);
		model.addAttribute("map", map);
		model.addAttribute("goodsList", goodsList);
		model.addAttribute("goodsCount", goodsList.size());

		return "goods/goods_main";
	}

//	POST - 굿즈 메인 페이지

//	GET - 굿즈 상세 페이지

	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(@RequestParam String goodsName, Model model) {

		GoodsDTO goodsDetail = goodsService.getGoodsDetail(goodsName);
		model.addAttribute("goodsDetail", goodsDetail);

		return "goods/goods_detail";
	}

//	POST - 굿즈 상세 페이지

	@RequestMapping(value = "/detail", method = RequestMethod.POST)
	public String purchase(@ModelAttribute GoodsDTO goods, RedirectAttributes attributes) {

		goods.setGoodsPrice(goods.getGoodsPrice() * goods.getGoodsCount());

		attributes.addFlashAttribute("goods", goods);
		
		return "redirect:/order/new";
	}

}