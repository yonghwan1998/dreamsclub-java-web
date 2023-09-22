package xyz.dreams.exception;

//비정상적으로 페이지를 요청한 경우의 문제를 처리하기 위한 예외 클래스 
public class QuitAccountException extends Exception{
	private static final long serialVersionUID = 1L;
	
	public QuitAccountException() {
	}
	public QuitAccountException(String message) {
		super(message);
	}
}
