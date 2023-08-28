 package xyz.dreams.dao;


import java.util.List;

import xyz.dreams.dto.MemberDTO;

public interface MemberDAO {

	//오진서 
	int insertMember(MemberDTO member);

	int updateMember(MemberDTO member);

	int deleteMember(String memberId);

	MemberDTO selectMember(String memberId);

	List<MemberDTO> selectMemberList();

	
	//강민경: 로그인 시 사용
	MemberDTO selectLoginCheck(String memberId);
	//강민경: 아이디, 비밀번호 찾을 시 사용
	MemberDTO selectSearch(String memberName);
}
