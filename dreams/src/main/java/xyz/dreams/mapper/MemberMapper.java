package xyz.dreams.mapper;

import java.util.List;
import xyz.dreams.dto.MemberDTO;

public interface MemberMapper {
	//오진서 
	int insertMember(MemberDTO member);

	int updateMember(MemberDTO member);

	int deleteMember(String memberId);

	MemberDTO selectMember(String memberId);

	List<MemberDTO> selectMemberList();

	
	//강민경: 로그인 시 사용
	MemberDTO selectLoginCheck(String memberId);
	
	//강민경: 아이디 찾기 시 사용 
	String selectSearch(MemberDTO member);
	//강민경: 비밀번호 찾기 
	
	int searchPw(MemberDTO member);
	
}
