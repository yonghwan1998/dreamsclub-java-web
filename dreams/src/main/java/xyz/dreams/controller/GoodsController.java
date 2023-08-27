package xyz.dreams.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dto.GoodsDTO;
import xyz.dreams.service.GoodsService;

@Controller
@RequiredArgsConstructor
@RequestMapping("/goods")
public class GoodsController {
	private final GoodsService goodsService;

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(Model model) {
		List<GoodsDTO> goodsList = goodsService.getGoodsList();
		model.addAttribute("goodsList", goodsList);
		model.addAttribute("goodsCount", goodsList.size());
		return "goods/goods_main";
	}

	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail() {
		return "goods/goods_detail";
	}
}
