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

	@Override
	public List<CheerDTO> selectCheerList() {
		return sqlSession.getMapper(CheerMapper.class).selectCheerList();
	}
}
