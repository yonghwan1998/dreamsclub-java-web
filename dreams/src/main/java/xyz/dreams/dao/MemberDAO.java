 package xyz.dreams.dao;


import java.util.List;

import xyz.dreams.dto.MemberDTO;
import xyz.dreams.exception.MemberNotFoundException;

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
   String selectSearch(MemberDTO member);
   //강민경: 비밀번호 변경
   int updatePw(MemberDTO member);
   
   //이소영 : 해당회원의 비밀번호를 가져와 문자열로 반환
   String getPassword(String memberId);
   
}