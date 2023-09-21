package xyz.dreams.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dto.CheerDTO;
import xyz.dreams.service.CheerService;

@Controller
@RequestMapping(value = "/cheer")
@RequiredArgsConstructor
public class CheerController {
	private final CheerService cheerService;

	/*
	- 방용환(생성) : 2023/09/19, 응원의 한마디 페이지 정보 출력
	
	- 방용환(수정) : 2023/09/20, 페이징 처리
	 */
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String cheerMain(@RequestParam(defaultValue = "1") int pageNum, Model model) {
		
		Map<String, Object> map = cheerService.getCheerList(pageNum);
		model.addAttribute("pager", map.get("pager"));
		model.addAttribute("cheerList", map.get("cheerList"));
		
		return "cheer/cheer_main";
	}

	/*
	- 방용환(생성) : 2023/09/19, 응원의 한마디 페이지 새로운 메모 INSERT
	 */
	@RequestMapping(value = "", method = RequestMethod.POST)
	public String addCheer(@ModelAttribute CheerDTO cheer) {
		cheerService.addCheer(cheer);
		return "redirect:/cheer";
	}
	
	/*
	- 방용환(생성) : 2023/09/20, 선택한 메모 삭제 처리
	 */
	@ResponseBody
	@RequestMapping(value = "/deleteMemo", method = RequestMethod.POST)
	public String removeMemo(@RequestBody Map<String, Object> map) {
		cheerService.changeCheerY(Integer.parseInt((String)map.get("cheerNo")));
		return "success";
	}
	
	/*
	- 방용환(생성) : 2023/09/20, 선택한 메모 복귀 처리
	 */
	@ResponseBody
	@RequestMapping(value = "/returnMemo", method = RequestMethod.POST)
	public String returnMemo(@RequestBody Map<String, Object> map) {
		cheerService.changeCheerN(Integer.parseInt((String)map.get("cheerNo")));
		return "success";
	}
}
