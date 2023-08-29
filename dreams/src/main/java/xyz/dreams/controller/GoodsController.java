package xyz.dreams.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

	@RequestMapping("/main")
	public String view(String q, @RequestParam(defaultValue = "goods_code") String column, Model model) {
		System.out.println("q = " + q);
		System.out.println("column = " + column);

		Map<String, Object> map = new HashMap<>();
		if (q != null) {
			q.replaceAll(" ", "");
		}
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
	public String detail(HttpServletRequest request, Model model) {

//		굿즈 코드에서 이름만
		String goodsCode = request.getParameter("goodsCode");
		model.addAttribute("goodsCode", goodsCode);

//		굿즈 코드 전체
		GoodsDTO goodsDetail = goodsService.getGoodsDetail(goodsCode);
		String[] goodsCodeSplit = null;
		goodsCodeSplit = goodsDetail.getGoodsCode().split("-");
		if (goodsCodeSplit[1].equals("U")) {
			goodsDetail.setGoodsCategory("Uniform");
		} else if (goodsCodeSplit[1].equals("C")) {
			goodsDetail.setGoodsCategory("Cap");
		} else if (goodsCodeSplit[1].equals("F")) {
			goodsDetail.setGoodsCategory("Fan Goods");
		}
		model.addAttribute("goodsDetail", goodsDetail);

		return "goods/goods_detail";
	}

//	POST - 굿즈 상세 페이지

	@RequestMapping(value = "/detail", method = RequestMethod.POST)
	public String purchase(@ModelAttribute GoodsDTO goods, HttpSession session) {
		String[] goodsCodeSplit = null;

		goodsCodeSplit = goods.getGoodsCode().split("-");
		goods.setGoodsCode(goodsCodeSplit[0]);

		goods.setGoodsPrice(goods.getGoodsPrice() * goods.getGoodsCount());

		session.setAttribute("goods", goods);
		return "redirect:/order/new";
	}

}