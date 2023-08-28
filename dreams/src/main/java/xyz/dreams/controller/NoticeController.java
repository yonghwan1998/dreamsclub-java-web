package xyz.dreams.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/notice")
public class NoticeController {
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String notice() {
		return "notice/notice_main";
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String notice2() {
		return "notice/notice_detail";
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String notice3() {
		return "notice/notice_write";
	}
}
