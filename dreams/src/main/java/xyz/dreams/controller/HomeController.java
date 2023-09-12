package xyz.dreams.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dto.GoodsDTO;
import xyz.dreams.service.GoodsService;

@Controller
@RequiredArgsConstructor
public class HomeController {
	private final GoodsService goodsService; 

	/*
	방용환(수정) : 2023/09/11, 메인 페이지 굿즈 리스트 출력
	리뷰 or 별점순으로 출력 예정
	*/
	@RequestMapping("/")
	public String home(@RequestParam(defaultValue = "goods_code") String column, Model model) {
		
//		Map<String, Object> map = new HashMap<>();
//		map.put("column", column);
//		
//		List<GoodsDTO> goodsList = goodsService.getGoodsList(map);
//		model.addAttribute("goodsList", goodsList);
		
		return "mainpage/index";
	}

	@RequestMapping("/introduction")
	public String introduction() {
		return "mainpage/introduction";
	}

	@RequestMapping("/team")
	public String team() {
		return "mainpage/team";
	}

	@RequestMapping("/service")
	public String service() {
		return "mainpage/service";
	}
	
}