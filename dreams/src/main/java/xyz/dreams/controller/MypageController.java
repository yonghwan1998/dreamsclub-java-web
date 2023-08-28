package xyz.dreams.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/mypage" )
public class MypageController {
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String mypage() {
		return "mypage/mypage_main";
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String mypage2() {
		return "mypage/mypage_modify";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String mypage3() {
		return "mypage/mypage_delete";
	}
	
	@RequestMapping(value = "/myqna", method = RequestMethod.GET)
	public String mypage4() {
		return "mypage/mypage_myqna";
	}
	
	@RequestMapping(value = "/check", method = RequestMethod.GET)
	public String mypage5() {
		return "mypage/mypage_check";
	}
}
