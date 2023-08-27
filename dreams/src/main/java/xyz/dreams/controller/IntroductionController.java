package xyz.dreams.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class IntroductionController {

	@RequestMapping(value = "/introduction", method = RequestMethod.GET)
	public String test() {
		return "/introduction/introduction";
	}
}
