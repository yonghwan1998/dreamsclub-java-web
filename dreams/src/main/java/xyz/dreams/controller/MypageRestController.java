package xyz.dreams.controller;

import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.HtmlUtils;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dto.Member;
import xyz.dreams.service.MypageService;

@RestController
@RequestMapping("/mypage")
@RequiredArgsConstructor
public class MypageRestController {
	private final MypageService mypageService;
	
	@PutMapping("/memberupdate")
	public String memberModify(@RequestBody Member member) {
		member.setMemberpw(HtmlUtils.htmlEscape(member.getMemberpw()));
		member.setMembername(HtmlUtils.htmlEscape(member.getMembername()));
		member.setMemberemail(HtmlUtils.htmlEscape(member.getMemberemail()));
		member.setMemberphone(HtmlUtils.htmlEscape(member.getMemberphone()));
		member.setMemberaddress1(HtmlUtils.htmlEscape(member.getMemberaddress1()));
		member.setMemberaddress2(HtmlUtils.htmlEscape(member.getMemberaddress2()));
		mypageService.modifyMember(member);
		return "수정에 성공했음";
	}
}
