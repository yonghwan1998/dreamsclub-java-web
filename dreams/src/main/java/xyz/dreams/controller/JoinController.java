package xyz.dreams.controller;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dto.MemberDTO;
import xyz.dreams.service.MemberService;


@Controller
@RequestMapping("/join") //http://localhost:8000/dreams/join
@RequiredArgsConstructor
public class JoinController {
   
   private final MemberService memberService;

   @RequestMapping(value = "/check", method = RequestMethod.GET) //http://localhost:8000/dreams/join/check
   public String check() {
      return "join/join_check"; // join파일안에 join_check 불러옴
   }
   
   //강민경(수정): 2023/9/9, 밸리데이션을 사용한 메세지 적용 
   @RequestMapping(value = "/hewon", method = RequestMethod.GET) //http://localhost:8000/dreams/join/hewon
   public String main(@ModelAttribute MemberDTO memberDTO) {
      return "join/join_hewon"; // join파일안에 join_check 불러옴
   }
   
   //강민경(수정): 2023/9/9, 밸리데이션을 사용한 메세지 적용  // 이거때문에 회원가입에러 뜬다네.....
   @RequestMapping(value = "/hewon", method = RequestMethod.POST)
   public String add(@ModelAttribute @Valid MemberDTO memberDTO, Errors errors) {
	   System.out.println(memberDTO);
      if(errors.hasErrors()) {
         System.out.println("error");
         return "join/join_hewon";
      }
      memberService.addMember(memberDTO);

      return "redirect:/login"; //회원가입 성공시 http://localhost:8000/dreams/login으로 다시리턴
   }

   
   // 아이디중복체크
   @ResponseBody
   @RequestMapping(value = "/member_id_check", method = RequestMethod.GET)
   public String idChk(String memberId) throws Exception {
       MemberDTO member = memberService.getMember(memberId);
       System.out.println(memberId+"="+member);
       if (member == null) {
           return "ok"; // 사용 가능한 아이디
       }
       return "no"; // 이미 사용 중인 아이디
   }
   
   

}