package xyz.dreams.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.HtmlUtils;

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
		model.addAttribute("NoticeList", noticeService.getList());
		return "notice/notice_main";
	}
	
	//공지사항 글 하나 보는 페이지 (조회)
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String noticeDetail(@RequestParam int noticeNo, Model model) {
		NoticeDTO notice = noticeService.getPage(noticeNo);
		notice.setNoticeCont(notice.getNoticeCont().replace("\r\n", "<br>").replace("\n", "<br"));
		model.addAttribute("pageInfo", notice);
		
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
		
		notice.setNoticeTitle(HtmlUtils.htmlEscape(notice.getNoticeTitle()));
		notice.setNoticeCont(HtmlUtils.htmlEscape(notice.getNoticeCont()));
		noticeService.enrollNotice(notice);
		
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
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String noticeDeleteGET(@RequestParam("noticeNo") int noticeNo, @ModelAttribute NoticeDTO noticeDTO, HttpSession session) throws Exception{
		
		//로그인 세션 불러오기
		//MemberDTO member = (MemberDTO)session.getAttribute("memeber");
		
		noticeService.deleteNotice(noticeNo);
		
		return "redirect:/notice";
	}
	
}
