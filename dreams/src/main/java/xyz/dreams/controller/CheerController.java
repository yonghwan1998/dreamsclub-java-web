package xyz.dreams.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	 */
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String cheerMain(Model model) {
		List<CheerDTO> cheerList = cheerService.getCheerList();
		model.addAttribute("cheerList", cheerList);
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
}
