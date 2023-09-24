
package xyz.dreams.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dto.MemberDTO;
import xyz.dreams.exception.LoginAuthFailException;
import xyz.dreams.exception.MemberNotFoundException;
import xyz.dreams.service.MemberService;

@Controller
@RequestMapping("/login")
@RequiredArgsConstructor
public class LoginController {
   private final MemberService memberService;
   private final xyz.dreams.auth.KakaoLoginBean kakaoLoginBean;
   
   // 1. 로그인 화면
   @RequestMapping(value = "", method = RequestMethod.GET)
   public String login() {
      return "login/login";
   }

   // 1-2. 로그인 성공 시 세션 생성 실패시 LoginAuthInterceptor
   @RequestMapping(value = "", method = RequestMethod.POST)
   public String login(@ModelAttribute MemberDTO member, HttpSession session) throws LoginAuthFailException {
      MemberDTO authMember = memberService.loginAuth(member);
      session.setAttribute("member", authMember);
      return "redirect:/";
   }
   //강민경: 카카오 로그인 페이지를 요청하기 위한 요청 처리 메소드
   @RequestMapping("/kakao")
	public String login(HttpSession session) throws UnsupportedEncodingException {
		String kakaoAuthUrl=kakaoLoginBean.getAuthorizationUrl(session);
		return "redirect:"+kakaoAuthUrl;
	}
   
   //카카오 로그인 성공시 Callback URL 페이지를 처리하기 위한 요청 처리 메소드
 	@RequestMapping("/callback")
 	public String login(@RequestParam String code, @RequestParam String state
 			, HttpSession session) throws IOException, ParseException {
 		OAuth2AccessToken accessToken=kakaoLoginBean.getAccessToken(session, code, state);
 		
 		String apiResult=kakaoLoginBean.getUserProfile(accessToken);
 		System.out.println(apiResult);
 		
 		return "redirect:/";
 	}
   
   
   //2-1. 아이디 찾기
   @RequestMapping(value = "/search_id", method = RequestMethod.GET)
   public String search_id() {
      return "login/search_id";
   }
   //2-2. 아이디 찾기, 매개변수 member에는 name, email를 받음 
   @RequestMapping(value = "/search_id", method = RequestMethod.POST)
   public String search_id(@ModelAttribute MemberDTO member, Model model)  {
      String id = memberService.searchId(member);
      model.addAttribute("searchId", id);
      return "login/search_result_id";
   }
   

   //3-1. 비밀번호 찾기
   @RequestMapping(value = "/search_pw", method = RequestMethod.GET)
   public String search_pw() {
      return "login/search_pw";
   }
   
   
   //3-2. 비밀번호 찾기-이메일 전송 
   @RequestMapping(value = "/search_pw", method = RequestMethod.POST)
   public String search_pw(@ModelAttribute MemberDTO member, HttpServletResponse response) throws MemberNotFoundException{
      memberService.searchPw(response, member);
      
      return "redirect:/login";
   }
   
   
   
   //4. 로그아웃
   @RequestMapping("/logout")
   public String logout(HttpSession session) {
         session.invalidate();
      
      return "redirect:/";
   }

}