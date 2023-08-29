package xyz.dreams.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dto.GoodsDTO;
import xyz.dreams.mapper.GoodsMapper;

@Repository
@RequiredArgsConstructor
public class GoodsDAOImpl implements GoodsDAO {
	private final SqlSession sqlSession;

//	굿즈 메인 페이지

	@Override
	public List<GoodsDTO> selectGoodsList(String q) {
		return sqlSession.getMapper(GoodsMapper.class).selectGoodsList(q);
	}

//	굿즈 디테일 페이지

	@Override
	public List<GoodsDTO> selectGoodsDetailList(String goodsCode) {
		return sqlSession.getMapper(GoodsMapper.class).selectGoodsDetailList(goodsCode);
	}
	
//	관리자 페이지 굿즈 관리

	@Override
	public List<GoodsDTO> selectAdminGoodsList() {
		return sqlSession.getMapper(GoodsMapper.class).selectAdminGoodsList();
	}

	@Override
	public int insertGoods(GoodsDTO goods) {
		return sqlSession.getMapper(GoodsMapper.class).insertGoods(goods);
	}
}
