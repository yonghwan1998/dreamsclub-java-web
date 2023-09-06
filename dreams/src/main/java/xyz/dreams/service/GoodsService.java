package xyz.dreams.service;

import java.util.List;
import java.util.Map;

import xyz.dreams.dto.GoodsDTO;

public interface GoodsService {

	/* 굿즈 메인 페이지 */
//	굿즈 리스트 출력
	List<GoodsDTO> getGoodsList(Map<String, Object> map);

	/* 굿즈 디테일 페이지 */
//	굿즈 상세 정보 출력
	GoodsDTO getGoodsDetail(String goodsName);

	/* 관리자 페이지 굿즈 관리 */
//	관리자 굿즈 리스트 출력
	List<GoodsDTO> getAdminGoodsList();

//	관리자 굿즈 등록
	void addGoods(GoodsDTO goods);
}
