package xyz.dreams.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dto.CartVO;

@Repository
@RequiredArgsConstructor
public class CartDAOImpl implements CartDAO {
	private final SqlSession sqlSession;
	private final String NS = "xyz.dreams.mapper.CartMapper";
	
	/* 형섭(생성): 2023/09/19, 회원의 아이디를 이용한 장바구니 조회 */
	@Override
	public List<CartVO> selectCartList(String memberId) {
		return sqlSession.selectList(NS+".selectCartList", memberId);
	}

	/* 형섭(생성): 2023/09/19, 장바구니 아이디를 이용한 장바구니 조회 */
	@Override
	public CartVO selectCartById(int cartId) {
		return sqlSession.selectOne(NS+".selectCartById", cartId);
	}
	
	/* 형섭(수정): 2023/09/11, 장바구니에 추가된 상품인지 검색 기능 */
	@Override
	public boolean findCartGoods(CartVO cartVO) {
		String result = sqlSession.selectOne(NS+".findCartGoods", cartVO);
		return Boolean.parseBoolean(result);
	}

	/*형섭(수정): 2023/09/12, 장바구니에 상품 추가 기능*/
	@Override
	public void addGoodsInCart(CartVO cartVO) {
		sqlSession.insert(NS+".addGoodsInCart", cartVO);
	}

	/* 형섭(생성): 2023/09/12, 장바구니에서 조건에 맞는 굿즈 삭제 기능 */
	@Override
	public int delFromCart(CartVO cartVO) {
		return sqlSession.delete(NS+".delFromCart", cartVO);
	}
}
