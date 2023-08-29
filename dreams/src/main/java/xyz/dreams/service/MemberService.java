package xyz.dreams.service;

import java.util.List;

import xyz.dreams.dto.MemberDTO;
import xyz.dreams.exception.LoginAuthFailException;
import xyz.dreams.exception.MemberNotFoundException;

public interface MemberService {

	// 강민경: DAO-login 메소드와 getLogin DB 비교
	// Member getMember(String memberId, String memberPw) throws
	// MemberNotFoundException;
	MemberDTO loginAuth(MemberDTO member) throws LoginAuthFailException;
	//강민경: Id, Pw 찾을 때 사용
	String searchId(MemberDTO member);
	
	// 회원가입
	void addMember(MemberDTO member);

	// 업데이트
	void modifyMember(MemberDTO member);

	// 삭제
	void removeMember(String memberId);

	MemberDTO getMember(String memberId);

	List<MemberDTO> getMemberList();

//	//오진서 2 ▼
//	void addMember(MemberDTO member) throws ExistsMemberException;
//	void modifyMember(MemberDTO member) throws MemberNotFoundException;
//	void removeMember(String memberId) throws MemberNotFoundException;
//	List<MemberDTO> getMemberList();

}
