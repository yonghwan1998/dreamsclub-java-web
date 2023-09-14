package xyz.dreams.mapper;

import java.util.List;
import java.util.Map;

import xyz.dreams.dto.GoodsDTO;

public interface GoodsMapper {

	/*
	- 방용환(수정) : 2023/09/11, 굿즈 메인 페이지에서 굿즈 출력
	q:검색 키워드, column:정렬순서, minPrice:최소 금액. maxPrice:최대 금액
	등의 값을 받아서 해당 조건들에 맞는 굿즈들 출력 
	
	- 방용환(수정) : 2023/09/12, 굿즈 메인 페이지에서 굿즈 출력
	uniform:유니폼 카테고리, cap:모자 카테고리, fan:팬 상품 카테고리
	등의 값을 받아서 해당 조건들에 맞는 굿즈들 출력
	*/
	List<GoodsDTO> selectGoodsList(Map<String, Object> map);

	/* 굿즈 디테일 페이지 */
//	굿즈 상세 정보 출력
	List<GoodsDTO> selectGoodsDetailList(String goodsName);

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
