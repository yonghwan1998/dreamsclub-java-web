package xyz.dreams.service;

import java.security.SecureRandom;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dao.MemberDAO;
import xyz.dreams.dto.MemberDTO;
import xyz.dreams.exception.LoginAuthFailException;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {
	private final MemberDAO memberDAO;

	// 강민경: 매개변수로 회원정보(아이디와 비밀번호)를 전달받아 인증 처리하기 위한 메소드
	// =>인증 성공: 매개변수로 전달받은 아이디의 회원정보를 검색하여 반환 /실패 시 예외 발생
	@Override
	public MemberDTO loginAuth(MemberDTO member) throws LoginAuthFailException {
		// 매개변수로 전달받은 회원정보의 아이디로 기존 회원정보를 검색하여 검색결과를 반환받아 저장
		MemberDTO authMember = memberDAO.selectLoginCheck(member.getMemberId());

		
		if (authMember == null) {
			throw new LoginAuthFailException("회원정보가 존재하지 않습니다.", member.getMemberId());
		}

		// 매개변수로 전달받은 회원정보의 비밀번호와 검색된 회원정보의 비밀번호를 비교하여
		// 같지 않은 경우 - 비밀번호 인증 실패
		if (!BCrypt.checkpw(member.getMemberPw(), authMember.getMemberPw())) {
			throw new LoginAuthFailException("아이디가 없거나 비밀번호가 맞지 않습니다.", member.getMemberId());
		}

		// 매개변수로 전달받은 회원정보의 아이디로 검색된 회원정보 반환
		return authMember;
	}
	//강민경: 매개변수로 회원정보(이름, 이메일)를 전달받아 인증 처리하기 위한 메소드
	// =>인증 성공: 매개변수로 전달받은 아이디의 회원정보를 검색하여 반환 /실패 시 예외 발생
	@Override
	public String searchId(MemberDTO member) {
		String id= memberDAO.selectSearch(member);

		// 매개변수로 전달받은 회원정보의 아이디로 검색된 회원정보 반환
		return id;
	}
	
	@Override
	public void searchPw(MemberDTO member) {
		String uuid= UUID.randomUUID().toString().replaceAll("-", "").substring(0,10);
		String hashedPw = BCrypt.hashpw(uuid, BCrypt.gensalt());
		
		member.setMemberPw(hashedPw);
		
		memberDAO.searchPw(member);
		
//		이 아래 부분은 final 때 메일 보내기(암호화 전의 비밀번호를 보내야 함) 
		System.out.println(uuid);
	}

	/*
	 * // 오진서 2 ▼ public void addMember(MemberDTO member) throws
	 * ExistsMemberException { // 매개변수로 전달받은 회원정보의 아이디가 기존 회원정보의 아이디와 중복될 경우 if
	 * (memberDAO.selectMember(member.getMemberId()) != null) { // 예외를 명확하기 구분하고
	 * 예외처리시 필요한 값을 제공하기 위해 직접 생성한 예외 // 클래스를 사용하여 인위적인 예외 발생 throw new
	 * ExistsMemberException("이미 사용중인 아이디를 입력 하였습니다.", member); }
	 * 
	 * // 매개변수로 전달받은 회원정보의 비밀번호를 암호화 처리하여 필드값으로 다시 저장 String hashedPassword =
	 * BCrypt.hashpw(member.getMemberPw(), BCrypt.gensalt());
	 * member.setMemberPw(hashedPassword);
	 * 
	 * memberDAO.insertMember(member);
	 * 
	 * }
	 */

		@Override
		public void addMember(MemberDTO member) {
			String hashedPassword = BCrypt.hashpw(member.getMemberPw(), BCrypt.gensalt());
			member.setMemberPw(hashedPassword);
			
			memberDAO.insertMember(member);
		}

		@Override
		public void modifyMember(MemberDTO member) {
			// TODO Auto-generated method stub
			
		}


		@Override
		public void removeMember(String memberId) {
			// TODO Auto-generated method stub
			
		}


		@Override
		public MemberDTO getMember(String memberId) {
			// TODO Auto-generated method stub
			return null;
		}


		@Override
		public List<MemberDTO> getMemberList() {
			// TODO Auto-generated method stub
			return null;
		}


		



}
