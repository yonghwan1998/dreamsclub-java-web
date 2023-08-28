package xyz.dreams.controller;

import java.util.List;

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
		
//		굿즈 코드에서 이름만
		String goodsCode = request.getParameter("goodsCode");
		model.addAttribute("goodsCode", goodsCode);

//		굿즈 코드 전체
		GoodsDTO goodsDetail = goodsService.getGoodsDetail(goodsCode);
		String[] goodsCodeSplit = null;
		goodsCodeSplit = goodsDetail.getGoodsCode().split("-");
		if (goodsCodeSplit[0].equals("U")) {
			goodsDetail.setGoodsCategory("Uniform");
		}else if (goodsCodeSplit[0].equals("C")) {
			goodsDetail.setGoodsCategory("Cap");
		}else if (goodsCodeSplit[0].equals("F")) {
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
		goods.setGoodsCode(goodsCodeSplit[1]);

		goods.setGoodsPrice(goods.getGoodsPrice() * goods.getGoodsCount());

		session.setAttribute("goods", goods);
		return "redirect:/order/new";
	}

}