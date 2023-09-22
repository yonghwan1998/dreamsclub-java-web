package xyz.dreams.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dto.CheerDTO;
import xyz.dreams.mapper.CheerMapper;

@Repository
@RequiredArgsConstructor
public class CheerDAOImpl implements CheerDAO {
	private final SqlSession sqlSession;

	/*
	- 방용환(생성) : 2023/09/19, 응원의 한마디 페이지 정보 출력
	
	- 방용환(수정) : 2023/09/20, 페이징 처리
	 */
	@Override
	public List<CheerDTO> selectCheerList(Map<String, Object> map) {
		return sqlSession.getMapper(CheerMapper.class).selectCheerList(map);
	}

	/*
	- 방용환(생성) : 2023/09/19, 응원의 한마디 페이지 새로운 메모 INSERT
	 */
	@Override
	public int insertCheer(CheerDTO cheer) {
		return sqlSession.getMapper(CheerMapper.class).insertCheer(cheer);
	}

	@Override
	public int selectCheerCount() {
		return sqlSession.getMapper(CheerMapper.class).selectCheerCount();
	}

	@Override
	public int updateCheerY(int cheerNo) {
		return sqlSession.getMapper(CheerMapper.class).updateCheerY(cheerNo);
	}

	@Override
	public int updateCheerN(int cheerNo) {
		return sqlSession.getMapper(CheerMapper.class).updateCheerN(cheerNo);
	}
}
