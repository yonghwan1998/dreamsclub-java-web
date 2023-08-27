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

	
	//강민경
	MemberDTO selectLoginCheck(String MemberId);
}
