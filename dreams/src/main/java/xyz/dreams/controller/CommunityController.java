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
import xyz.dreams.dto.CommunityDTO;
import xyz.dreams.dto.MemberDTO;
import xyz.dreams.service.CommunityService;

@Controller
@RequestMapping(value = "/community")
@RequiredArgsConstructor
public class CommunityController {
	private final CommunityService communityService;

	/*게시판 목록 페이지 접속*/
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String community(Model model) {		
		model.addAttribute("CommunityList", communityService.getList());
		return "community/community_main";
	}
	
	
	/*게시판 글 하나 보는 페이지 (조회)*/
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String communityDetail(@RequestParam int commNo, Model model) {
		CommunityDTO comm=communityService.getPage(commNo);
		comm.setCommCont(comm.getCommCont().replace("\r\n", "<br>").replace("\n", "<br"));
		model.addAttribute("pageInfo", comm);
		
		//조회수 +1
		communityService.upCountCommunity(commNo);
		
		return "community/community_detail";
	}
	
	
	/*게시판 글쓰기 페이지 접속*/
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String communityWrite() {
		return "community/community_write";
	}
	
	/*게시판 등록하기*/
	@RequestMapping(value = "write/add", method = RequestMethod.POST)
	public String communityWritePOST(@ModelAttribute CommunityDTO community, HttpSession session) throws Exception{
		
		community.setCommTitle(HtmlUtils.htmlEscape(community.getCommTitle()));
		community.setCommCont(HtmlUtils.htmlEscape(community.getCommCont()));
		communityService.enrollCommunity(community);		
		return "redirect:/community";
	}

	/*게시판 수정 페이지 이동*/
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String communityModify(int commNo, Model model) {
		
		model.addAttribute("pageInfo", communityService.getPage(commNo));
		
		return null;
	}
	
	/*페이지 수정*/
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String communityModifyPOST(CommunityDTO community, RedirectAttributes rttr) {
		
		communityService.modifyCommunity(community);
		
		return "redirect:/community";
	}
	
	/*페이지 삭제*/
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String communityDeleteGET(@RequestParam("commNo") int commNo, @ModelAttribute CommunityDTO communityDTO,
				HttpSession session) throws Exception{
		
		//로그인 세션 불러오기
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		//DTO에 글쓴이 넣기
		communityDTO.setMemberId(member.getMemberId());
		
		communityService.deleteCommunity(commNo);
		
		return "redirect:/community";
	}

}