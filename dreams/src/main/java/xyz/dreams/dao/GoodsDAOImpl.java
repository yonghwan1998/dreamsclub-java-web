package xyz.dreams.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dto.GoodsDTO;
import xyz.dreams.mapper.GoodsMapper;

@Repository
@RequiredArgsConstructor
public class GoodsDAOImpl implements GoodsDAO{
	private final SqlSession sqlSession;

	@Override
	public List<GoodsDTO> selectGoodsList() {
		return sqlSession.getMapper(GoodsMapper.class).selectGoodsList();
	}
	
	
}
