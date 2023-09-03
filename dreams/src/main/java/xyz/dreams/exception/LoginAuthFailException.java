package xyz.dreams.exception;

import lombok.Getter;

//로그인 처리할 때 사용자로부터 입력 받은 아이디에 대한 인증이 실패한 경우의
//문제를 처리하기 위한 예외 클래스 
public class LoginAuthFailException extends Exception{
	private static final long serialVersionUID = 1L;
	
	//예외처리에 필요한 값을 저장하기 위한 필드
	// => 사용자부터 입력받은 아이디를 저장하기 위한 필드
	@Getter
	private String memberId ;
	
	public LoginAuthFailException() {
		// TODO Auto-generated constructor stub
	}
	public LoginAuthFailException(String message, String memberId) {
		super(message);
		this.memberId=memberId;
	
		
	}
	
}
