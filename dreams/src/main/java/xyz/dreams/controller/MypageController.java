package xyz.dreams.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dto.MemberDTO;
import xyz.dreams.dto.OrderDTO;
import xyz.dreams.dto.ReviewDTO;
import xyz.dreams.service.MemberService;
import xyz.dreams.service.ReviewService;

@Controller
@RequestMapping(value = "/mypage" )
@RequiredArgsConstructor
public class MypageController {
   private final MemberService memberService;
   private final ReviewService reviewService;
   
   //이소영(최종) : 2023-09-19 마이페이지 메인
   @RequestMapping(value = "", method = RequestMethod.GET)
   public String mypage() {
      return "mypage/mypage_main";
   }
   
   //이소영(최종) : 2023-09-19 마이페이지 회원정보 변경
   @RequestMapping(value = "/modify", method = RequestMethod.GET)
   public String mypage1() {
      return "mypage/mypage_modify";
   }
   
   //이소영(최종) : 2023-09-19 마이페이지 회원정보 변경
   @RequestMapping(value = "/modify", method = RequestMethod.POST)
   public String mypage2(@ModelAttribute MemberDTO member, HttpSession session) {
      memberService.modifyMember(member);
      
      session.setAttribute("member", member);

      
        // 비밀번호 검증 및 처리 로직
       // if (!newPassword.equals(confirmPassword)) {
        //    model.addAttribute("error", "새 비밀번호와 확인이 일치하지 않습니다.");
        //    return "mypage/mypage_modify"; // 에러 메시지와 함께 다시 페이지로 이동
      //  }

        // 비밀번호 변경 로직 등 추가 처리

        return "redirect:/mypage"; // 변경이 성공적으로 완료되면 다른 페이지로 리다이렉트
    }
   
   @RequestMapping(value = "/delete", method = RequestMethod.GET)
   public String mypage3() {
      return "mypage/mypage_delete";
   }
   
   @RequestMapping(value = "/myqna", method = RequestMethod.GET)
   public String mypage4() {
      return "mypage/mypage_myqna";
   }
   
   
   @RequestMapping(value = "/check", method = RequestMethod.GET)
   public String mypage5() {
      return "mypage/mypage_check";
   }
   
   
   //강민경(2023/09/11): '리뷰 작성'버튼 누르면 리뷰 작성 페이지로 이동
   @RequestMapping(value = "/review/write", method = RequestMethod.GET)
   public String ReviewWriterView() {
      return "mypage/mypage_review_write";
   }
   
   //강민경(2023/09/11): 리뷰 작성 등록
   @RequestMapping(value="/review/write", method = RequestMethod.POST)
   public String ReviewWriter(@ModelAttribute ReviewDTO review, @ModelAttribute OrderDTO order) {
      reviewService.enrollReview(review);
      
      //다 작성한 후 마이페이지로 페이지 바뀜
      return "redirect:/mypage/mypage_check";
   }
   
   //강민경: 리뷰 
   @RequestMapping(value = "/myreview", method = RequestMethod.GET)
   public String mypage6() {
      return "mypage/mypage_review";
   }
   
    @RequestMapping(value = "/withdraw", method = RequestMethod.POST)
    public String withdrawUser(@RequestParam("user-password") String password,@RequestParam("memberId") String memberId, HttpSession session, RedirectAttributes redirectAttributes) {
      
        System.out.println("memberId"+memberId);
        boolean isValid = memberService.checkPassword(memberId, password);
        
        if(isValid) {
            memberService.deleteMember(memberId);
            session.invalidate();
            redirectAttributes.addFlashAttribute("message", "회원탈퇴가 완료되었습니다.");
            return "redirect:/login";
        } else {
            redirectAttributes.addFlashAttribute("error", "패스워드가 일치하지 않습니다.");
            return "redirect:/mypage/delete";
        }
    }

   
}