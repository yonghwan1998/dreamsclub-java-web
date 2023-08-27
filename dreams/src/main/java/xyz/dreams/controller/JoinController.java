package xyz.dreams.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dto.MemberDTO;
import xyz.dreams.service.MemberService;

@Controller
@RequestMapping("/join")
@RequiredArgsConstructor
public class JoinController {
	
	private final MemberService memberService;

	@RequestMapping(value = "/check", method = RequestMethod.GET)
	public String check() {
		return "join/join_check";
	}

	@RequestMapping(value = "/hewon", method = RequestMethod.GET)
	public String main() {
		return "join/join_hewon";
	}

	@RequestMapping(value = "/hewon", method = RequestMethod.POST)
	public String add(@ModelAttribute MemberDTO memberDTO) {
		memberService.addMember(memberDTO);



		
		
		
		
		return "redirect:/"; //회원가입 성공시 http://localhost:8000/dreams/으로 리턴
	}

}