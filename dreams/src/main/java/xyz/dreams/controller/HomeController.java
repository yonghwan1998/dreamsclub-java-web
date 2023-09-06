package xyz.dreams.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	@RequestMapping("/")
	public String home() {
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