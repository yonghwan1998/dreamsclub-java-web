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
	int insertAdminGoods(GoodsDTO goods);
	
	/*
	방용환(생성) : 2023/09/11, 관리자 굿즈 수정 기능
	admin_goods.jsp에서 입력한 수정 값을 받아와 해당 굿즈 정보 UPDATE
	 */
	int updateAdminGoods(GoodsDTO goods);
	
	/*
	방용환(생성) : 2023/09/11, 관리자 굿즈 판매 여부 수정 기능
	admin_goods.jsp에서 클릭한 굿즈의 값이 'Y'라면 'N'으로, 'N'이라면 'Y'로 굿즈 정보 UPDATE
	 */
	int updateAdminGoodsYn(GoodsDTO goods);
}
