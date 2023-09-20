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
	- 방용환(수정) : 2023/09/11, 메인 페이지 굿즈 리스트 출력
	리뷰 or 별점순으로 출력 예정
	
	- 방용환(수정) : 2023/09/12, 메인 페이지 오류 수정
	minPrice, maxPrice 미설정으로 인한 IndexOutOfBounds 오류 수정
	
	- 방용환(수정) : 2023/09/12, 메인 페이지 오류 수정
	uniform, cap, fan 미설정으로 인한 IndexOutOfBounds 오류 수정
	
	- 방용환(수정) : 2023/09/19, 굿즈 리스트 별점순으로 변경
	*/
	@RequestMapping("/")
	public String home(@RequestParam(defaultValue = "goods_star") String column,
			@RequestParam(defaultValue = "9999999") int maxPrice, @RequestParam(defaultValue = "0") String minPrice,
			@RequestParam(defaultValue = "true") Boolean uniform, @RequestParam(defaultValue = "true") Boolean cap,
			@RequestParam(defaultValue = "true") Boolean fan, Model model) {

		// column:정렬순서, minPrice:최소 금액. maxPrice:최대 금액,
		// uniform:유니폼 카테고리, cap:모자 카테고리, fan:팬 상품 카테고리 등의 값을
		// goodsService에 인자로 넘기기 위한 Map
		Map<String, Object> map = new HashMap<>();

		map.put("column", column);

		map.put("maxPrice", maxPrice);
		map.put("minPrice", minPrice);

		map.put("uniform", uniform);
		map.put("cap", cap);
		map.put("fan", fan);

		// 검색 조건들을 goodsService.getGoodsList(Map<String, Object> map)에 인자로 넘김
		List<GoodsDTO> goodsList = goodsService.getGoodsList(map);
		model.addAttribute("goodsList", goodsList);

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