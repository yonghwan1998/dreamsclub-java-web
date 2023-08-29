package xyz.dreams.rest;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dto.GoodsDTO;
import xyz.dreams.service.GoodsService;

@RestController
@RequestMapping("/goods")
@RequiredArgsConstructor
public class RestGoodsController {
	private final GoodsService goodsService;
	
//	GET - 굿즈 메인 페이지
	

//	POST - 굿즈 메인 페이지

	@PostMapping("/rest_option")
	public String getOptionGoodsList(@RequestBody String option) {
		System.out.println(option);
		return "success";
	}

//	GET - 굿즈 상세 페이지
	
//	POST - 굿즈 상세 페이지

	@PostMapping("/rest_test")
	public String addCartBtn(@RequestBody GoodsDTO goods) {
		System.out.println(goods);
		System.out.println("Controller");
		return "success";
	}

}
