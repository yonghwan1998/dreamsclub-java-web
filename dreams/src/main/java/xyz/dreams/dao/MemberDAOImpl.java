package xyz.dreams.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dto.MemberDTO;
import xyz.dreams.mapper.MemberMapper;

@Repository
@RequiredArgsConstructor

public class MemberDAOImpl implements MemberDAO {
	private final SqlSession sqlSesstion;

	// 강민경
	@Override
	public MemberDTO selectLoginCheck(String memberId) {
		return sqlSesstion.getMapper(MemberMapper.class).selectLoginCheck(memberId);
	}
	
	
	
	
	//오진서
		@Override
		public int insertMember(MemberDTO member) {
			return sqlSesstion.getMapper(MemberMapper.class).insertMember(member);
		}


		@Override
		public int updateMember(MemberDTO member) {
			return sqlSesstion.getMapper(MemberMapper.class).updateMember(member);
		}

		@Override
		public int deleteMember(String memberId) {
			return sqlSesstion.getMapper(MemberMapper.class).deleteMember(memberId);
		}

		@Override
		public MemberDTO selectMember(String memberId) {
			return sqlSesstion.getMapper(MemberMapper.class).selectMember(memberId);
		}

		@Override
		public List<MemberDTO> selectMemberList() {
			return sqlSesstion.getMapper(MemberMapper.class).selectMemberList();
		}
}

