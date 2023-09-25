package xyz.dreams.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import xyz.dreams.dto.MemberDTO;
import xyz.dreams.dto.OrderDTO;
import xyz.dreams.dto.ReviewDTO;
import xyz.dreams.service.MemberService;
import xyz.dreams.service.OrderService;
import xyz.dreams.service.QnaService;
import xyz.dreams.service.ReviewService;

@Controller
@RequestMapping(value = "/mypage")
@RequiredArgsConstructor
@Slf4j
public class MypageController {
	private final MemberService memberService;
	private final ReviewService reviewService;
	private final QnaService qnaService;
	private final OrderService orderService;

	// WebApplicationContext 객체(스프링 컨테이너)를 제공받아 필드에 의존성 주입
	private final WebApplicationContext context;

	// 이소영(최종) : 2023-09-19 마이페이지 메인
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String mypage() {
		return "mypage/mypage_main";
	}

	// 이소영(최종) : 2023-09-19 마이페이지 회원정보 변경
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String mypage1() {
		return "mypage/mypage_modify";
	}

	// 이소영(최종) : 2023-09-19 마이페이지 회원정보 변경
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String mypage2(@ModelAttribute MemberDTO member, HttpSession session) {
		memberService.modifyMember(member);

		session.setAttribute("member", member);

		// 비밀번호 검증 및 처리 로직
		// if (!newPassword.equals(confirmPassword)) {
		// model.addAttribute("error", "새 비밀번호와 확인이 일치하지 않습니다.");
		// return "mypage/mypage_modify"; // 에러 메시지와 함께 다시 페이지로 이동
		// }

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

	/*
	- 강민경(2023/09/20): 마이페이지에서 상품 리스트 출력
	
	- 방용환(수정) : 2023/09/25, 테이블 변경에 따른 변경
	*/
	@RequestMapping(value = "/check", method = RequestMethod.GET)
	public String mypageGoodsList(HttpSession session, Model model) {

		MemberDTO member = (MemberDTO) session.getAttribute("member");

		List<OrderDTO> orderList = orderService.getOrderListByMemberId(member.getMemberId());
		model.addAttribute("orderList", orderList);
		// 강민경: orderId로 주문 리스트 출력 여부 결정
		return "mypage/mypage_check";
	}

	// 강민경(2023/09/11): '리뷰 작성'버튼 누르면 리뷰 작성 페이지로 이동
	@RequestMapping(value = "/review/write", method = RequestMethod.GET)
	public String ReviewWriterView(@RequestParam("impUid") String impUid, @ModelAttribute OrderDTO order, Model model,
			HttpSession session) {
		// 로그인 세션 불러오기
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		// DTO에 글쓴이 넣기
		String memberId = member.getMemberId();
		order = orderService.selectOrderId(impUid, memberId);
		model.addAttribute("order", order);
		log.info("order:{}", order);
		return "mypage/mypage_review_write";
	}

	// 강민경(2023/09/11): 리뷰 작성 등록, 리뷰 사진은 하나만 등록 가능
	@RequestMapping(value = "/review/write", method = RequestMethod.POST)
	public String ReviewWriter(@ModelAttribute ReviewDTO review, @ModelAttribute OrderDTO order, HttpSession session,
			@RequestParam MultipartFile uploadFile, Model model) throws IOException {
		// 로그인 세션 불러오기
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		// DTO에 글쓴이 넣기
		review.setMemberId(member.getMemberId());

		// 업로드된 파일이 pdf 파일이 아닌 경우(DTO 객체보다 Model객체에 저장하는 것이 뷰에 접근 하기 쉬움
		if (!uploadFile.isEmpty() && !uploadFile.getContentType().equals("image/png")) {
			model.addAttribute("message", "png 파일만 업로드 해주세요.");
			return "redirect:/mypage/review/write/";
		}
		if (!uploadFile.isEmpty()) {
			String uploadDirectory = context.getServletContext().getRealPath("/resources/review");

			// String revImg = extracted(uploadFile);
			String revImg = UUID.randomUUID().toString() + "_" + uploadFile.getOriginalFilename();
			uploadFile.transferTo(new File(uploadDirectory, revImg));

			// 전달 파일을 서버 디렉토리에 저장
			// File file=new File(uploadDirectory, revImg);

			review.setRevImg(revImg);
			// 전달파일을 서버 디렉토리에 저장 - 업로드 처리
			// model.addAttribute("uploadFilename", revImg);

		}
		// 작성한 리뷰 글 db에 등록
		reviewService.enrollReview(review);
		orderService.modifyStatusComplete(review.getImpUid());

		// 다 작성한 후 마이페이지로 페이지로 이동
		return "mypage/mypage_check";
	}

	// 강민경: 리뷰
	@RequestMapping(value = "/myreview", method = RequestMethod.GET)
	public String mypage6() {
		return "mypage/mypage_review";
	}

	// 이소영(최종) : 2023-09-19 회원탈퇴 시 비밀번호 검증
	@RequestMapping(value = "/withdraw", method = RequestMethod.POST)
	public String withdrawUser(@ModelAttribute MemberDTO member, HttpSession session,
			RedirectAttributes redirectAttributes) {

		if (memberService.checkPassword(member.getMemberId(), member.getMemberPw())) {
			memberService.deleteMember(member.getMemberId());
			System.out.println("1 : " + session);
			session.invalidate();
			System.out.println("2 : " + session);
			redirectAttributes.addFlashAttribute("message", "회원탈퇴가 완료되었습니다.");

			return "redirect:/login";
		} else {
			redirectAttributes.addFlashAttribute("error", "패스워드가 일치하지 않습니다.");
			return "redirect:/mypage/delete";
		}
	}

	@GetMapping("/myqna/{memberId}")
	public String getByMemberId(@PathVariable String memberId, Model model) {
		model.addAttribute("qnaList", qnaService.findByMemberId(memberId));
		return "mypage/mypage_myqna";

	}

	@GetMapping("/myreview/{memberId}")
	public String findByMemberId(@PathVariable String memberId, Model model) {
		model.addAttribute("reviewList", reviewService.findByMemberId(memberId));
		return "mypage/mypage_review";
	}
}