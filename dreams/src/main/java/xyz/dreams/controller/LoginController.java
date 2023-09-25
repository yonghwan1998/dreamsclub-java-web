
package xyz.dreams.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import xyz.dreams.dto.MemberDTO;
import xyz.dreams.exception.LoginAuthFailException;
import xyz.dreams.exception.MemberNotFoundException;
import xyz.dreams.service.MemberService;

@Controller
@RequestMapping("/login")
@RequiredArgsConstructor
@Slf4j
public class LoginController {
   private final MemberService memberService;
   private final xyz.dreams.auth.KakaoLoginBean kakaoLoginBean;
   private final xyz.dreams.auth.NaverLoginBean naverLoginBean;
   
   
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
   
   /*카카오 로그인 API - 강민경(2023.09.25)*/
   //강민경: 카카오 로그인 페이지를 요청하기 위한 요청 처리 메소드
   @RequestMapping("/kakao")
	public String kakaoLogin(HttpSession session) throws UnsupportedEncodingException {
		String kakaoAuthUrl=kakaoLoginBean.getAuthorizationUrl(session);
		return "redirect:"+kakaoAuthUrl;
	}
   
   //강민경: 카카오 로그인 성공시 Callback URL 페이지를 처리하기 위한 요청 처리 메소드
 	@RequestMapping("/kakao/callback")
 	public String kakaoLogin(@RequestParam String code, @RequestParam String state
 			, HttpSession session) throws IOException, ParseException {
 		OAuth2AccessToken accessToken=kakaoLoginBean.getAccessToken(session, code, state);
 		
 		//빈등록된 토큰을 가져와서 넣어줌(카카오 정보에 접근할 수 있는 토큰을 가져옴)
 		String apiResult=kakaoLoginBean.getUserProfile(accessToken);
 		System.out.println(apiResult);
 		
 		//api에선 제이슨 형태로 전달해줘서 parser를 사용하여 자바 객체로 변환해줌 
 		JSONParser parser=new JSONParser();
 		//JSONParser.parse(String json) : JSON 형식의 문자열을 Object 객체로 변환하는 메소드
 		Object object=parser.parse(apiResult);
 		//Object 객체로 JSONObject 객체로 변환하여 저장
 		JSONObject jsonObject=(JSONObject)object;
		JSONObject kakaoAccount =(JSONObject)jsonObject.get("kakao_account");
		JSONObject profile =(JSONObject)kakaoAccount.get("profile");
		
		
		//JSON 객체에 저장된 값을 제공받아 저장 - 파싱(Parsing)
		//JSONObject.get(String name) : JSONObject 객체에 저장된 값(객체)을 반환하는 메소드
		// => Object 타입으로 값(객체)를 반환하므로 반드시 형변환하여 저장
		Long id=(Long)jsonObject.get("id");
		String email=(String)kakaoAccount.get("email");
		String name=(String)profile.get("nickname");//카카오 api에서 name 대신 nickname을 받아서 넣어줌
		log.info("email:{}",email);
		log.info("name:{}",name);

		
		//객체를 만들 수 있게 해줌 
		MemberDTO member = new MemberDTO();
		//카카오 로그인을 통해 받아온 값을 set을 이용하여 저장 
		member.setMemberId("kakao_"+id);
		member.setMemberPw(UUID.randomUUID().toString());
		member.setMemberName(name);
		member.setMemberEmail(email);
		member.setMemberStatus(1);
		log.info("member:{}",member);
		
		List<MemberDTO> memberList = new ArrayList<MemberDTO>();
		memberList.add(member);
		
		//네이버 로그인 사용자의 정보를 member테이블에 저장
		if(memberService.getMember("kakao_"+id) ==null) {
			memberService.addMember(member);
		}
		//강민경: 세션에 토큰 등록 
 		session.setAttribute("member", member);
 		return "redirect:/";
 	}
 	 
 	
 	/*네이버 로그인 - 김예지(2023.09.25)*/
 	//김예지: 네이버 로그인 페이지를 요청하기 위한 요청 처리 메소드
 	@RequestMapping("/naver")
	public String naverLogin(HttpSession session) throws UnsupportedEncodingException {
		String naverAuthUrl=naverLoginBean.getAuthorizationUrl(session);
		return "redirect:"+naverAuthUrl;
	}
 	
 	//김예지: 네이버 로그인 성공시 Callback URL 페이지를 처리하기 위한 요청 처리 메소드
	//네이버 로그인 성공시 Callback URL 페이지를 처리하기 위한 요청 처리 메소드
	@RequestMapping("/naver/callback")
	public String naverLogin(@RequestParam String code, @RequestParam String state
			, HttpSession session) throws IOException, ParseException {
		//네이버 로그인 사용자에 대한 접근 토큰을 반환하는 메소드 호출하여 사용자 접근 토큰 저장 
		OAuth2AccessToken accessToken=naverLoginBean.getAccessToken(session, code, state);
		
		//접근 토큰을 이용하여 로그인 사용자의 프로필을 반환하는 메소드를 호출하여 사용자 프로필(JSON)을 저장
		String apiResult=naverLoginBean.getUserProfile(accessToken);
		//예시: {"resultcode":"00","message":"success","response":{"id":"XAfMAwX_vELrzkOKnQPW2B5VSOs4kPM5P0Zl0ZuFY00","nickname":"ocj****","email":"ocj1778@hanmail.com","name":"\uc624\ucc3d\uc911"}}
		System.out.println(apiResult);
		
		//JSONParser 객체 : JSON 형식의 문자열을 JSON 객체로 변환하는 기능을 제공하는 객체
		JSONParser parser=new JSONParser();
		//JSONParser.parse(String json) : JSON 형식의 문자열을 Object 객체로 변환하는 메소드
		Object object=parser.parse(apiResult);
		//Object 객체로 JSONObject 객체로 변환하여 저장.,,,
		JSONObject jsonObject=(JSONObject)object;
		
		//JSON 객체에 저장된 값을 제공받아 저장 - 파싱(Parsing)
		//JSONObject.get(String name) : JSONObject 객체에 저장된 값(객체)을 반환하는 메소드
		// => Object 타입으로 값(객체)를 반환하므로 반드시 형변환하여 저장
		JSONObject responseObject=(JSONObject)jsonObject.get("response");
		String id=(String)responseObject.get("id");
		String name=(String)responseObject.get("name");
		String email=(String)responseObject.get("email");
		String phone=(String)responseObject.get("phone");
		
		
		//반환받은 네이버 사용자 프로필의 값을 사용하여 Java 객체의 필드값으로 저장
		MemberDTO member = new MemberDTO();
		member.setMemberId("naver_"+id);
		member.setMemberPw(UUID.randomUUID().toString());
		member.setMemberName(name);
		member.setMemberEmail(email);
		member.setMemberPhone(phone);
		member.setMemberStatus(1); //1:일반회원
		
		List<MemberDTO> memberList = new ArrayList<MemberDTO>();
		memberList.add(member);
		
		//네이버 로그인 사용자의 정보를 member테이블에 저장
		if(memberService.getMember("naver_"+id) ==null) {
			memberService.addMember(member);
		}
		
		//세션에 네이버 로그인 사용자 정보 저장
		session.setAttribute("member", member);
		
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