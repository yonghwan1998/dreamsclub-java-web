package xyz.dreams.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/join")
public class JoinCheckController {
	
	@RequestMapping(value = "/check", method = RequestMethod.GET)
	public String test() {
		return "join/join_check";
	}

}
