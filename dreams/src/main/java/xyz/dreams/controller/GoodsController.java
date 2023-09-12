package xyz.dreams.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import xyz.dreams.dto.QnaDTO;
import xyz.dreams.service.GoodsService;
import xyz.dreams.service.QnaService;

@Controller
@RequiredArgsConstructor
@RequestMapping("/goods")
public class GoodsController {
	private final GoodsService goodsService;
	
	// 오진서 - 9/10 추가 ▼
	private final QnaService qnaService;

	/* GET - 굿즈 메인 페이지 */
//	굿즈 리스트 출력
	@RequestMapping("/main")
	public String view(String q, @RequestParam(defaultValue = "goods_code") String column,
			@RequestParam(defaultValue = "9999999") int maxPrice, @RequestParam(defaultValue = "0") String minPrice,
			Model model) {

		if (q != null) {
			q = q.replaceAll(" ", "");
		}
		Map<String, Object> map = new HashMap<>();
		map.put("q", q);
		map.put("column", column);
		map.put("maxPrice", maxPrice);
		map.put("minPrice", minPrice);

		List<GoodsDTO> goodsList = goodsService.getGoodsList(map);
		model.addAttribute("map", map);
		model.addAttribute("goodsList", goodsList);
		model.addAttribute("goodsCount", goodsList.size());

		return "goods/goods_main";
	}

	/* POST - 굿즈 메인 페이지 */

	/* GET - 굿즈 상세 페이지 */
//	굿즈 상세 정보 출력
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(@RequestParam String goodsName, Model model) {

		GoodsDTO goodsDetail = goodsService.getGoodsDetail(goodsName);
		model.addAttribute("goodsDetail", goodsDetail);

		return "goods/goods_detail";
	}

	/* POST - 굿즈 상세 페이지 */
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
    
    
//	// 오진서 - 09/11 Q&A 작성 페이지 이동 1
//	@RequestMapping(value = "/qna/write", method = RequestMethod.GET)
//	public String QnaWrite() {
//
//		return "goods/goods_qna_write";
//	}
//	
//	
//	
//	
	// 오진서 - 09/11 Q&A 작성 하기 1
	@RequestMapping(value = "write/add", method = RequestMethod.POST)
	public String qnaWritePOST(@ModelAttribute QnaDTO qna, HttpSession session) throws Exception{
		qnaService.enrollQna(qna);
		
		return "redirect:/goods"; // 입력후 굿즈메인페이지로 이동 **추후 수정해야함..
	}
	
	
	
    // 오진서 - 9/12 // Q&A 작성 페이지로 이동 2
	@RequestMapping(value = "/qna/write", method = RequestMethod.GET)
    public String showQnaWriteForm() {
        return "goods_qna_write"; // JSP 페이지 이름
    }
	
//    // 오진서 - 9/12 //  Q&A 작성 처리2
//    @PostMapping("/qna/write")
//    public String submitQna(@ModelAttribute QnaDTO qna) {
//        // qnaService를 사용하여 Q&A 데이터를 저장하는 로직을 수행
//        qnaService.enrollQna(qna);
//        return "redirect:/goods"; // 작업 완료 후 이동할 경로

}