package xyz.dreams.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dto.MemberDTO;
import xyz.dreams.dto.NoticeDTO;
import xyz.dreams.service.NoticeService;

@Controller
@RequestMapping(value = "/notice")
@RequiredArgsConstructor
public class NoticeController {
	private final NoticeService noticeService;
	
	//공지사항 목록 페이지 접속
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String notice(Model model) {
		List<NoticeDTO> nList = noticeService.getList();
		model.addAttribute("NoticeList", noticeService.getList());
	
		return "notice/notice_main";
	}
	
	//공지사항 글 하나 보는 페이지 (조회)
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String noticeDetail(HttpServletRequest request, Model model) {
		
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		model.addAttribute("pageInfo", noticeService.getPage(noticeNo));
		
		return "notice/notice_detail";
	}
	
	//공지사항 글쓰기 페이지 접속
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String noticeWrite() {
		return "notice/notice_write";
	}
	
	//공지사항 등록하기
	@RequestMapping(value = "write/add", method = RequestMethod.POST)
	public String noticeWritePOST(@ModelAttribute NoticeDTO notice, HttpSession session) throws Exception{
		
		//세션 아이디값 가져오기(member객체로)
		session.getAttribute("memberId");
		noticeService.enrollNotice(notice);
		
		//띄워쓰기, 줄바꿈등의 개행문자를 문자처리하여 DB에 저장하기
		notice.setNoticeCont(notice.getNoticeCont().replaceAll("\r\n", "<br>"));
		
		System.out.println(notice.toString());
		
		return "redirect:/notice";
	}
	
	//공지사항 수정 페이지 이동
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String noticeModify(int noticeNo, Model model) {
		
		model.addAttribute("pageInfo", noticeService.getPage(noticeNo));
		
		return null;
		
	}
	
	//페이지 수정
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String noticeModifyPOST(NoticeDTO notice, RedirectAttributes rttr) {
		
		noticeService.modifyNotice(notice);
		
		return "redirect:/notice";
	}
	
	//페이지 삭제
	
	public String noticeDeleteGET(@RequestParam("noticeNo") int noticeNo, @ModelAttribute NoticeDTO noticeDTO, HttpSession session) throws Exception{
		
		//로그인 세션 불러오기
		MemberDTO member = (MemberDTO)session.getAttribute("memeber");
		
		noticeService.deleteNotice(noticeNo);
		
		return "redirect:/notice";
	}
	
}
