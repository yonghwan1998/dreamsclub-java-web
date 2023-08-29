package xyz.dreams.service;

import java.util.List;

import xyz.dreams.dto.GoodsDTO;

public interface GoodsService {

//	굿즈 메인 페이지

	List<GoodsDTO> getGoodsList(String q);

//	굿즈 디테일 페이지

	GoodsDTO getGoodsDetail(String goodsCode);
	
//	관리자 페이지 굿즈 관리

	List<GoodsDTO> getAdminGoodsList();
	
	void addGoods(GoodsDTO goods);
}
