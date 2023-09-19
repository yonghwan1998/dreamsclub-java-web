package xyz.dreams.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dto.CheerDTO;
import xyz.dreams.mapper.CheerMapper;
import xyz.dreams.mapper.GoodsMapper;

@Repository
@RequiredArgsConstructor
public class CheerDAOImpl implements CheerDAO {
	private final SqlSession sqlSession;

	/*
	- 방용환(생성) : 2023/09/19, 응원의 한마디 페이지 정보 출력
	 */
	@Override
	public List<CheerDTO> selectCheerList() {
		return sqlSession.getMapper(CheerMapper.class).selectCheerList();
	}

	/*
	- 방용환(생성) : 2023/09/19, 응원의 한마디 페이지 새로운 메모 INSERT
	 */
	@Override
	public int insertCheer(CheerDTO cheer) {
		return sqlSession.getMapper(CheerMapper.class).insertCheer(cheer);
	}
}
