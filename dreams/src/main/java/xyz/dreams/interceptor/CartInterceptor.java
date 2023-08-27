package xyz.dreams.interceptor;
/*
package xyz.dreams.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import xyz.dreams.dto.Cart;

public class CartInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		//loginUserinfo 나중에 수정할 수도 있음. 로그인페이지랑 비교해볼 필요 있음
		Cart loginUserinfo = (Cart)session.getAttribute("loginUserinfo");
		
		//비로그인 사용자인 경우
		if(loginUserinfo==null) {			
			//로그인페이지로 리다이렉트
			request.setAttribute("message", "로그인이 필요합니다.");
			response.sendRedirect("/dreams/login/");
			return false;
		} else {
		return true;
		}	
	}
}
*/
