package xyz.dreams.dao;

import java.util.List;

import xyz.dreams.dto.GoodsDTO;

public interface GoodsDAO {

//	굿즈 메인 페이지

	List<GoodsDTO> selectGoodsList(String q);

//	굿즈 디테일 페이지

	List<GoodsDTO> selectGoodsDetailList(String goodsCode);
	
//	관리자 페이지 굿즈 관리

	List<GoodsDTO> selectAdminGoodsList();
}
