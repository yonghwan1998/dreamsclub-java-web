package xyz.dreams.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dto.CartVO;
import xyz.dreams.dto.GoodsDTO;

@Repository
@RequiredArgsConstructor
public class CartDAOImpl implements CartDAO {
	private final SqlSession sqlSession;
	private final String NS = "xyz.dreams.mapper.CartMapper";
	
	@Override
	public boolean findCartGoods(CartVO cartVO) {
		String result = sqlSession.selectOne(NS+".findCartGoods", cartVO);
		return Boolean.parseBoolean(result);
	}

	@Override
	public void addGoodsInCart(CartVO cartVO) {
		sqlSession.insert(NS+".addGoodsInCart", cartVO);
	}

	@Override
	public List<CartVO> getMyCartGoodsCode(String memberId) {
		return sqlSession.selectList(NS+".getMyCartGoodsCode", memberId);
	}

	@Override
	public List<GoodsDTO> getMyCartList(List<CartVO> cartList) {
		return sqlSession.selectList(NS+".getMyCartList", cartList);
	}


}
