package xyz.dreams.controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dto.MemberDTO;
import xyz.dreams.service.MemberService;

@Controller
@RequestMapping(value = "/mypage" )
@RequiredArgsConstructor
public class MypageController {
	private final MemberService memberService;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String mypage() {
		return "mypage/mypage_main";
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String mypage1() {
		return "mypage/mypage_modify";
	}
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String mypage2(@ModelAttribute MemberDTO member, HttpSession session) {
		memberService.modifyMember(member);
		
		session.setAttribute("member", member);
		
        // 비밀번호 검증 및 처리 로직
       // if (!newPassword.equals(confirmPassword)) {
        //    model.addAttribute("error", "새 비밀번호와 확인이 일치하지 않습니다.");
        //    return "mypage/mypage_modify"; // 에러 메시지와 함께 다시 페이지로 이동
      //  }

        // 비밀번호 변경 로직 등 추가 처리

        return "redirect:/mypage"; // 변경이 성공적으로 완료되면 다른 페이지로 리다이렉트
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
	//강민경: 
	@RequestMapping(value = "/myreview", method = RequestMethod.GET)
	public String mypage6() {
		return "mypage/mypage_review";
	}
	
}
