package xyz.dreams.service;

import java.util.List;
import java.util.Map;

import xyz.dreams.dto.GoodsDTO;

public interface GoodsService {

	/*
	- 방용환(수정) : 2023/09/11, 굿즈 메인 페이지에서 굿즈 출력
	q:검색 키워드, column:정렬순서, minPrice:최소 금액. maxPrice:최대 금액
	등의 값을 받아서 해당 조건들에 맞는 굿즈들 출력 
	
	- 방용환(수정) : 2023/09/12, 굿즈 메인 페이지에서 굿즈 출력
	uniform:유니폼 카테고리, cap:모자 카테고리, fan:팬 상품 카테고리
	등의 값을 받아서 해당 조건들에 맞는 굿즈들 출력
	
	- 방용환(수정) : 2023/09/18, 별점순 및 리뷰순 정렬 기능 추가
	*/
	List<GoodsDTO> getGoodsList(Map<String, Object> map);

	/*
	- 방용환(수정) : 2023/08/23, 굿즈 디테일 페이지에서 해당 굿즈 정보 출력
	goodsCode가 아닌 goodsName을 전달해 해당 이름에 해당하는 굿즈 정보 출력
	
	- 방용환(수정) : 2023/09/15, 굿즈 사이즈마다 재고 및 구매 가능 여부 출력
	 */
	GoodsDTO getGoodsDetail(String goodsName);

	/*
	- 방용환(생성) : 2023/08/28, 관리자 페이지 굿즈 출력 기능
	 */
	List<GoodsDTO> getAdminGoodsList();

	/*
	- 방용환(생성) : 2023/09/01, 굿즈 등록 페이지 굿즈 등록
	 */
	void addAdminGoods(GoodsDTO goods);
	
	/*
	- 방용환(생성) : 2023/09/11, 관리자 굿즈 수정 기능
	admin_goods.jsp에서 입력한 수정 값을 받아와 해당 굿즈 정보 UPDATE
	 */
	void modifyAdminGoods(GoodsDTO goods);
	
	/*
	- 방용환(생성) : 2023/09/11, 관리자 굿즈 판매 여부 수정 기능
	admin_goods.jsp에서 클릭한 굿즈의 값이 'Y'라면 'N'으로, 'N'이라면 'Y'로 굿즈 정보 UPDATE
	 */
	void modifyAdminGoodsYn(GoodsDTO goods);
}
