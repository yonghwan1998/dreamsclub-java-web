package xyz.dreams.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import xyz.dreams.dto.MemberDTO;
import xyz.dreams.exception.BadRequestException;

//강민경: 탈퇴 계정 로그인 못하도록 설정
//로그인 사용자 관련 권한 처리를 위해 작성된 인터셉터 클래스
// => 요청 처리 메소드가 호출 전에 비로그인 사용자가 페이지를 요청한 경우 인위적으로 예외 발생
public class LoginAuthInterceptor implements HandlerInterceptor {
	//preHandle 메소드 : 요청 처리 메소드가 호출되기 전에 실행될 명령을 작성하기 위한 메소드
	// => false 반환 : 요청 처리 메소드 미호출, true 반환 : 요청 처리 메소드 호출
		
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session=request.getSession();
		
		MemberDTO MemberDTO=(MemberDTO)session.getAttribute("MemberDTO");
		
		//비로그인 사용자인 경우
		if(MemberDTO == null || MemberDTO.getMemberStatus() == 0) {
			throw new BadRequestException("비정상적인 요청입니다.");
		}
		
		return true;//요청 처리 메소드 호출
	}
}