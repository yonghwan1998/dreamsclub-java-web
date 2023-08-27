package xyz.dreams.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/mypage" )
public class MypageController {
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String test() {
		return "mypage/mypage";
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String mypage_modifytest() {
		return "mypage/mypage_modify";
	}
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String mypage_deletetest() {
		return "mypage/mypage_delete";
	}
	
}
