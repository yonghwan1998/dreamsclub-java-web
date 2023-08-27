package xyz.dreams.service;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dao.MypageDAO;
import xyz.dreams.dto.MemberDTO;

@Service
@RequiredArgsConstructor
public class MypageServiceImpl implements MypageService{
	private final MypageDAO mypageDAO;
	
	@Override
	public void modifyMember(MemberDTO member) {
		mypageDAO.updateMember(member);
	}
}
