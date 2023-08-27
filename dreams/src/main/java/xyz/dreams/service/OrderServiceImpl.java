package xyz.dreams.service;


import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dao.OrderDAO;
import xyz.dreams.dto.CartDTO;
import xyz.dreams.dto.MemberDTO;
import xyz.dreams.dto.OrderDTO;

@Service
@RequiredArgsConstructor
public class OrderServiceImpl implements OrderService{
	private final OrderDAO orderDAO;

	@Override
	public int insertOrder(OrderDTO orderDTO) {
		return orderDAO.insertOrder(orderDTO);
	}

	@Override
	public int updateOrder(OrderDTO orderDTO) {
		return orderDAO.updateOrder(orderDTO);
	}

	@Override
	public MemberDTO getMemberInfo(String memberId) {
		MemberDTO member = orderDAO.getMemberInfo(memberId);
		if(member != null) {
			MemberDTO memberDTO = new MemberDTO();
			memberDTO.setMemberName(member.getMemberName());
			memberDTO.setMemberPhone(member.getMemberPhone());
			memberDTO.setMemberEmail(member.getMemberEmail());
			memberDTO.setMemberPcode(member.getMemberPcode());
			memberDTO.setMemberAddress1(member.getMemberAddress1());
			memberDTO.setMemberAddress2(member.getMemberAddress2());
			return memberDTO;
		}
		return null;
	}

	@Override
	public CartDTO getCartInfo(String memberId) {
		return orderDAO.getCartInfo(memberId);
	}
}
