package xyz.dreams.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dto.MemberDTO;
import xyz.dreams.service.MemberService;

@Controller
@RequestMapping("/join") //http://localhost:8000/dreams/join
@RequiredArgsConstructor
public class JoinController {
	
	private final MemberService memberService;

	@RequestMapping(value = "/check", method = RequestMethod.GET) //http://localhost:8000/dreams/join/check
	public String check() {
		return "join/join_check"; // join파일안에 join_check 불러옴
	}

	@RequestMapping(value = "/hewon", method = RequestMethod.GET) //http://localhost:8000/dreams/join/hewon
	public String main() {
		return "join/join_hewon"; // join파일안에 join_check 불러옴
	}

	@RequestMapping(value = "/hewon", method = RequestMethod.POST)
	public String add(@ModelAttribute MemberDTO memberDTO) {
		memberService.addMember(memberDTO);



		
		
		
		
		return "redirect:/"; //회원가입 성공시 http://localhost:8000/dreams/으로 리턴
	}
	
	
//	// 아이디 중복 체크
//		@ResponseBody
//		@RequestMapping(value="/member_id_check", method = RequestMethod.GET)
//			public String idChk(String memberId) throws Exception {
//				MemberDTO member = memberService.getMember(memberId);
//				System.out.println("member = "+member);
//				if(member==null) {
//					return "ok";
//				}
//				return "no";
//		}	
	
	// 아이디중복체크222
	@ResponseBody
	@RequestMapping(value = "/member_id_check", method = RequestMethod.GET)
	public String idChk(String memberId) throws Exception {
	    MemberDTO member = memberService.getMember(memberId);
	    System.out.println(memberId+"="+member);
	    if (member == null) {
	        return "ok"; // 사용 가능한 아이디
	    }
	    return "no"; // 이미 사용 중인 아이디
	}
	
	

}