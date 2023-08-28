package xyz.dreams.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import xyz.dreams.exception.LoginAuthFailException;
import xyz.dreams.exception.MemberNotFoundException;



//@ControllerAdvice : 예외 처리 메소드만 작성된 Controller 클래스를 Spring Bean으로 등록하기 위한 어노테이션
// => 모든 Controller 클래스의 요청 처리 메소드에서 발생되어 전달된 예외를 제공받아 처리 가능
@ControllerAdvice	
public class ExceptionController {
	@ExceptionHandler(value = LoginAuthFailException.class)
	public String loginAuthFailExceptionHandler(LoginAuthFailException exception, Model model) {
		model.addAttribute("message", exception.getMessage());
		model.addAttribute("memberId", exception.getMemberId());
		return "login/login";
	}
	
	@ExceptionHandler(value = MemberNotFoundException.class)
	public String MemberNotFoundExceptionHandler(MemberNotFoundException exception, Model model) {
		model.addAttribute("message", exception.getMessage());
		model.addAttribute("memberName", exception.getMemberName());
		return "login/search_id";
	}
}





/* 선생님꺼, 참고하세여! 
@ControllerAdvice
public class ExceptionController {
	@ExceptionHandler(value = BadRequestException.class)	
	public String badRequestExceptionHander() {
		return "userinfo/user_error";
	}
	
	@ExceptionHandler(value = ExistsUserinfoException.class)	
	public String existsUserinfoExceptionHander(ExistsUserinfoException exception, Model model) {
		model.addAttribute("message", exception.getMessage());
		model.addAttribute("userinfo", exception.getUserinfo());
		return "userinfo/user_write";
	}
	
	@ExceptionHandler(value = LoginAuthFailException.class)
	public String loginAuthFailExceptionHandler(LoginAuthFailException exception, Model model) {
		model.addAttribute("message", exception.getMessage());
		model.addAttribute("userid", exception.getUserid());
		return "userinfo/user_login";
	}
	
	@ExceptionHandler(value = UserinfoNotFoundException.class)
	public String userinfoNotFoundExceptionHandler() {
		return "userinfo/user_error";
	}
	
	/*
	@ExceptionHandler(value = Exception.class)	
	public String exceptionHander() {
		return "userinfo/user_error";
	}
	
}
*/