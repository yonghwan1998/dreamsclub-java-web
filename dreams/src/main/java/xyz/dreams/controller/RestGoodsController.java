package xyz.dreams.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dto.Goods;
import xyz.dreams.service.GoodsService;

@RestController
@RequestMapping("/goods")
@RequiredArgsConstructor
public class RestGoodsController {
	private final GoodsService goodsService;
	
	@GetMapping("/temp")
	public String addCartBtn(@RequestBody Goods goods) {
		System.out.println("Controller");
		return "success";
	}

}
