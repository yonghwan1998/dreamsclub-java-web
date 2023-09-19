package xyz.dreams.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import xyz.dreams.dto.MemberDTO;
import xyz.dreams.exception.LoginAuthFailException;
import xyz.dreams.exception.MemberNotFoundException;

public interface MemberService {

   // 강민경: DAO-login 메소드와 getLogin DB 비교
   // Member getMember(String memberId, String memberPw) throws
   // MemberNotFoundException;
   MemberDTO loginAuth(MemberDTO member) throws LoginAuthFailException;
   //강민경: Id 찾을 때 사용
   String searchId(MemberDTO member);
   
   //강민경: 이메일 발송
   void sendEmail(MemberDTO member, String div) throws MemberNotFoundException;
      
   //강민경: 비밀번호 찾기 
   void searchPw(HttpServletResponse response,MemberDTO member) throws MemberNotFoundException;
   
   // 회원가입
   void addMember(MemberDTO member);


   // 이소영(수정) : 2023-09-18 회원탈퇴 시 비밀번호 확인
   int deleteMember(String memberId);
   boolean checkPassword(String userId, String password); 

   MemberDTO getMember(String memberId);

   List<MemberDTO> getMemberList();

//   오진서 2 ▼


   //이소영(수정) : 2023-08-28 회원정보 수정
   void modifyMember(MemberDTO member);
   
}