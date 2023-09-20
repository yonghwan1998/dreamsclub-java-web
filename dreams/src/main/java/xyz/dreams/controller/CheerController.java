package xyz.dreams.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dto.CheerDTO;
import xyz.dreams.service.CheerService;

@Controller
@RequestMapping(value = "/cheer")
@RequiredArgsConstructor
public class CheerController {
	
	private final CheerService cheerService;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String cheerMain(Model model) {
		List<CheerDTO> cheerList =  cheerService.getCheerList();
		model.addAttribute("cheerList", cheerList);
		return "cheer/cheer_main";
	}
}
