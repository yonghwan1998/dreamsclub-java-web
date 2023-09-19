package xyz.dreams.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.config.YamlProcessor.ResolutionMethod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dto.GoodsDTO;
import xyz.dreams.dto.QnaDTO;
import xyz.dreams.service.GoodsService;
import xyz.dreams.service.QnaService;
import xyz.dreams.util.GoodsReviewComparator;

@Controller
@RequiredArgsConstructor
@RequestMapping("/goods")
public class GoodsController {
	private final GoodsService goodsService;
	private final QnaService qnaService;
	private Object map;

	/*
	- 방용환(수정) : 2023/09/11, 굿즈 메인 페이지에서 굿즈 출력
	q:검색 키워드, column:정렬순서, minPrice:최소 금액. maxPrice:최대 금액
	등의 값을 받아서 해당 조건들에 맞는 굿즈들 출력 
	
	- 방용환(수정) : 2023/09/12, 굿즈 메인 페이지에서 굿즈 출력
	uniform:유니폼 카테고리, cap:모자 카테고리, fan:팬 상품 카테고리
	등의 값을 받아서 해당 조건들에 맞는 굿즈들 출력
	
	- 방용환(수정) : 2023/09/18, 리뷰순 정렬 기능 추가

	- 방용환(수정) : 2023/09/19, 별점순 정렬 기능 추가
	 */
	
	// 검색 조건을 설정하기 전에 전체 범위로 이름순으로 출력하기 위해 defaultValue 설정
	@RequestMapping("/main")
	public String view(String q, @RequestParam(defaultValue = "goods_code") String column,
			@RequestParam(defaultValue = "9999999") int maxPrice, @RequestParam(defaultValue = "0") String minPrice,
			@RequestParam(defaultValue = "true") Boolean uniform, @RequestParam(defaultValue = "true") Boolean cap,
			@RequestParam(defaultValue = "true") Boolean fan, Model model) {

		// 띄어쓰기 무시하고 검색하기 위해 검색 키워드(q)에서 띄어쓰기를 제거하는 작업
		if (q != null) {
			q = q.replaceAll(" ", "");
		}
		
		// 검색 키워드(q), column:정렬순서, minPrice:최소 금액. maxPrice:최대 금액,
		// uniform:유니폼 카테고리, cap:모자 카테고리, fan:팬 상품 카테고리 등의 값을
		// 페이지 불러오기 이후에도 jsp에 그대로 보여주고, goodsService에 인자로 넘기기 위한 Map
		Map<String, Object> map = new HashMap<>();
		map.put("q", q);

		map.put("column", column);

		map.put("maxPrice", maxPrice);
		map.put("minPrice", minPrice);

		map.put("uniform", uniform);
		map.put("cap", cap);
		map.put("fan", fan);

		// 검색 조건들을 goodsService.getGoodsList(Map<String, Object> map)에 인자로 넘김
		List<GoodsDTO> goodsList = goodsService.getGoodsList(map);
		model.addAttribute("map", map);
		model.addAttribute("goodsList", goodsList);
		model.addAttribute("goodsCount", goodsList.size());

		return "goods/goods_main";
	}

	/*
	- 방용환(수정) : 2023/08/23, 굿즈 디테일 페이지에서 해당 굿즈 정보 출력
	goodsCode가 아닌 goodsName을 전달해 해당 이름에 해당하는 굿즈 정보 출력
	
	- 방용환(수정) : 2023/09/15, 굿즈 사이즈마다 재고 및 구매 가능 여부 출력
	 */
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(@RequestParam String goodsName, @RequestParam Map<String,Object> map, Model model) {

		GoodsDTO goodsDetail = goodsService.getGoodsDetail(goodsName);
		model.addAttribute("goodsDetail", goodsDetail);
		
		// 9/19 오진서 - qna 목록리스트 추가
		model.addAttribute("qnaList", qnaService.getQnaList(map)); 

		return "goods/goods_detail";
	}

//	장바구니로 굿즈 정보 넘기기
	@RequestMapping(value = "/detail", method = RequestMethod.POST)
	public String purchaseCart(@ModelAttribute GoodsDTO goods, RedirectAttributes attributes) {

		attributes.addFlashAttribute("goods", goods);
		
		return "redirect:/cart/purchase";
	}
	
//	결제페이지로 굿즈 정보 바로 넘기기
	@RequestMapping(value = "/detail/order", method = RequestMethod.POST)
	public String purchaseOrder(@ModelAttribute GoodsDTO goods, RedirectAttributes attributes) {

		goods.setGoodsPrice(goods.getGoodsPrice() * goods.getGoodsCount());

		attributes.addFlashAttribute("goods", goods);
		
		return "redirect:/order/new";
	}
	
	
//	// 오진서 - 9/10 ▼ 댓글쓰기
//	// POST - 댓글 작성 처리
//    @PostMapping("/addQna")
//    @ResponseBody
//    public Map<String, Object> addComment(@RequestBody QnaDTO qnaDTO) {
//        Map<String, Object> result = new HashMap<>();
//
//        try {
//        	
//            // 여기에 댓글을 저장하고 DB에 추가하는 로직을 추가
//            // QnaDTO 객체에는 goodsName과 content가 포함됨
//
//            // 저장이 성공하면 success 값을 true로 설정
//            result.put("success", true);
//        } catch (Exception e) {
//            // 저장에 실패하면 success 값을 false로 설정
//            result.put("success", false);
//            result.put("errorMessage", "문의글 작성에 실패했습니다.");
//            e.printStackTrace();
//        }
//
//        return result;
//    }
    
	// 오진서 - 9/19(수정)  Q&A 작성 페이지로 이동
	@RequestMapping(value = "/qna/write", method = RequestMethod.GET)
	public String showQnaWriteForm(
			@RequestParam String goodsCode,Model model) {
		model.addAttribute("goodsCode", goodsCode);
		return "goods/goods_qna_write"; // JSP 페이지 이름
	}
	
	// 오진서 - 09/19(수정) Q&A 작성 하기
	@RequestMapping(value = "write/add", method = RequestMethod.POST)
	public String qnaWritePOST(@ModelAttribute QnaDTO qna, HttpSession session) throws Exception{
		System.out.println("**************"); 
		System.out.println(qna); // 값 제대로 받아오나 확인
		System.out.println("**************"); 
		qnaService.enrollQna(qna); // 등록
		
		return "redirect:/goods/main"; // 입력후 굿즈메인페이지로 이동 **추후 수정해야함..
	}
	
//	// 오진서 - 9/19 Q&A 목록 도전!!!!!! 목록을 받아와야하니칸 GET 방식
//	// 정보받아와서 목록 출력하고 싶어....
//	@RequestMapping(value = "/detail/qna", method = RequestMethod.GET)
//	public String qnaList(@RequestParam String goodsCode, Model model,
//			@RequestParam Map<String,Object> map) {
//		// 9/19 - 맵넣어줘야한대 ▲
//		
//		model.addAttribute("qnaList", qnaService.getQnaList(map)); 
//	//model안에 qnaService안에있는 getQnaList 를 넣을거임 (qnaListqnaList)란 이름으로
//		return "goods/goods_detail";
//	}
//// 500 떠서 잠시 묻어둠
	

	
    
}