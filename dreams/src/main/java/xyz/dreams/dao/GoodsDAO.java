package xyz.dreams.dao;

import java.util.List;
import java.util.Map;

import xyz.dreams.dto.GoodsDTO;

public interface GoodsDAO {

	/* 굿즈 메인 페이지 */
//	굿즈 리스트 출력
	List<GoodsDTO> selectGoodsList(Map<String, Object> map);


//	굿즈 상세 정보 출력
	List<GoodsDTO> selectGoodsDetailList(String goodsCode);

	/* 관리자 페이지 굿즈 관리 */
//	관리자 굿즈 리스트 출력
	List<GoodsDTO> selectAdminGoodsList();

//	관리자 굿즈 등록
	int insertGoods(GoodsDTO goods);
}
