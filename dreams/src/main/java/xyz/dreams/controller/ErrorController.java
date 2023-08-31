package xyz.dreams.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/errors")
public class ErrorController {
	
	@GetMapping("error")
	public String defaultError() {
		return "errors/error";
	}
	
//	@GetMapping("/no-resource")
//	public String noResource() {
//		return "error/noResource";
//	}
//	
//	@GetMapping("/server-error")
//	public String serverError() {
//		return "error/serverError";
//	}
}
