package xyz.dreams.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dao.GoodsDAO;
import xyz.dreams.dto.GoodsDTO;
import xyz.dreams.util.GoodsReviewComparator;
import xyz.dreams.util.GoodsStarComparator;

@Service
@RequiredArgsConstructor
public class GoodsServiceImpl implements GoodsService {
	private final GoodsDAO goodsDAO;

	/*
	- 방용환(수정) : 2023/09/11, 굿즈 메인 페이지에서 굿즈 출력
	q:검색 키워드, column:정렬순서, minPrice:최소 금액. maxPrice:최대 금액
	등의 값을 받아서 해당 조건들에 맞는 굿즈들 출력 
	
	- 방용환(수정) : 2023/09/12, 굿즈 메인 페이지에서 굿즈 출력
	uniform:유니폼 카테고리, cap:모자 카테고리, fan:팬 상품 카테고리
	등의 값을 받아서 해당 조건들에 맞는 굿즈들 출력
	
	- 방용환(수정) : 2023/09/18, 별점순 및 리뷰순 정렬 기능 추가
	*/
	@Override
	public List<GoodsDTO> getGoodsList(Map<String, Object> map) {
		// 검색 조건들을 Map에 담아서 goodsDAO.selectGoodsList(Map<String, Object> map)의 인자로 넘기고
		// 굿즈 전체 리스트를 goodsList에 저장
		List<GoodsDTO> goodsList = goodsDAO.selectGoodsList(map);

		// jsp에서 선택된 카테고리의 굿즈리스트를 저장하기 위한 goodsCategoryList 변수
		List<GoodsDTO> goodsCategoryList = new ArrayList<GoodsDTO>();
		boolean uniform = (Boolean) map.get("uniform");
		boolean cap = (Boolean) map.get("cap");
		boolean fan = (Boolean) map.get("fan");

		// 검색된 전체 굿즈 리스트 for문
		for (GoodsDTO goods : goodsList) {
			// '이름-카테고리-사이즈'로 저장 되어 있는 goodsCode를 split()을 통해 카테고리만 가져옴
			String goodsCategory = goods.getGoodsCode().split("-")[1];
			
			// jsp에서 Uniform이 선택 되어 있고
			// DB에서 가져온 리스트의 카테고리가 'U'라면
			// goodsCategoryList 변수에 저장함
			if (uniform == true && goodsCategory.equals("U")) {
				goodsCategoryList.add(goods);
			}
			
			// jsp에서 Cap이 선택 되어 있고
			// DB에서 가져온 리스트의 카테고리가 'C'라면
			// goodsCategoryList 변수에 저장함
			if (cap == true && goodsCategory.equals("C")) {
				goodsCategoryList.add(goods);
			}
			
			// jsp에서 Fan Goods가 선택 되어 있고
			// DB에서 가져온 리스트의 카테고리가 'F'라면
			// goodsCategoryList 변수에 저장함
			if (fan == true && goodsCategory.equals("F")) {
				goodsCategoryList.add(goods);
			}
		}

		// goodsCategoryList for문 반복
		for (GoodsDTO goods : goodsCategoryList) {
			// '이름-카테고리-사이즈'로 저장 되어 있는 goodsCode를 split()을 통해 이름만 setter로 goodsName에 저장
			goods.setGoodsName(goods.getGoodsCode().split("-")[0]);
		}
		
		// 실제 페이지에 출력하기 위한 굿즈 리스트를 저장하기 위한 goodsResult 변수
		List<GoodsDTO> goodsResult = new ArrayList<GoodsDTO>();

		// goodsCode가 '이름-카테고리-사이즈'에서 '이름'으로 바뀌어 저장되었지만
		// 다른 사이즈의 같은 제품은 이름이 겹치기 때문에 중복제거를 해야함
		
		// goodsResult의 가장 끝값을 비교하기 위한 임시 변수
		int temp = 0;
		// goodsResult에 중복을 제거한 객체를 저장할 때 사용할 변수 
		int index = 0;
		// 같은 이름의 굿즈의 리뷰 개수를 저장할 변수
		int reviewCount = 1;
		// 최초에 비교할 값 저장
		goodsResult.add(goodsCategoryList.get(0));
		// goodsCategoryList 사이즈-1 만큼(윗 줄에 최초에 비교할 값을 저장했기 때문에) for문 반복
		for (int i = 0; i < goodsCategoryList.size() - 1; i++) {
			// goodsResult의 가장 끝에 있는 goodsName과 goodsCategoryList의 가장 처음에 있는 goodsName이 같으면
			if (goodsResult.get(0 + index).getGoodsName().equals(goodsCategoryList.get(i + 1).getGoodsName())) {
				// reviewCount 값 증가
				reviewCount++;
			} else {
				// goodsResult 리스트의 index번째 객체에 reviewCount(리뷰 개수) 값 저장
				GoodsDTO goods = goodsResult.get(index);
				goods.setReviewCount(reviewCount);
				goodsResult.set(index, goods);
				
				// goodsResult에서 사용할 변수(index)값 증가
				index += 1;

				// goodsResult에 goodsCategoryList의 가장 처음값 저장 후
				// 새로운 값의 위치를 저장할 index 변수에 i+1 저장, reviewCount 값 1로 변겅
				goodsResult.add(goodsCategoryList.get(i + 1));
				reviewCount = 1;
			}
		}
		
		// 리뷰순 출력시 아래 주석 제거
		// Collections.sort(goodsResult, new GoodsReviewComparator().reversed());
		
		// 별점순 출력시 아래 주석 제거
		// Collections.sort(goodsResult, new GoodsStarComparator().reversed());
		
		return goodsResult;
	}

	/*
	- 방용환(수정) : 2023/08/23, 굿즈 디테일 페이지에서 해당 굿즈 정보 출력
	goodsCode가 아닌 goodsName을 전달해 해당 이름에 해당하는 굿즈 정보 출력
	
	- 방용환(수정) : 2023/09/15, 굿즈 사이즈마다 재고 및 구매 가능 여부 출력
	 */
	@Override
	public GoodsDTO getGoodsDetail(String goodsName) {
		// 해당 goodsName을 가진 굿즈 리스트 가져옴
		// Uniform 상품은 3개, Cap & Fan 상품은 1개의 리스트
		List<GoodsDTO> goodsDetailList = goodsDAO.selectGoodsDetailList(goodsName);

		// jsp로 넘겨 줄 임시 저장소
		GoodsDTO goodsDetail = goodsDetailList.get(0);

		// split()을 사용하여 goodsCodeSplit의 0번 index는 이름, 1번 index는 카테고리, 2번 index는 사이즈를 나누어 저장
		String[] goodsCodeSplit = null;
		goodsCodeSplit = goodsDetail.getGoodsCode().split("-");

		// 카테고리가 'U'라면 goodsDetail의 goodsCategory에 'Uniform'을 저장
		if (goodsCodeSplit[1].equals("U")) {
			goodsDetail.setGoodsCategory("Uniform");
			
			// 'Uniform' 카테고리는 같은 상품이 사이즈가 3개 존재하기 때문에 for문으로 사이즈마다 재고와 판매 여부를 저장
			for (GoodsDTO goods : goodsDetailList) {
				// 'Uniform'은 split()으로 나눈 goodsCode를 goodsCodeSplitUniform에 따로 저장 
				String[] goodsCodeSplitUniform = goods.getGoodsCode().split("-");
				
				// 사이즈가 'L'이라면 goodsStockL과 goodsYnL에 각각 재고와 판매 여부 저장
				if (goodsCodeSplitUniform[2].equals("L")) {
					goodsDetail.setGoodsStockL(goods.getGoodsStock());
					goodsDetail.setGoodsYnL(goods.getGoodsYn());
				// 사이즈가 'M'이라면 goodsStockM과 goodsYnM에 각각 재고와 판매 여부 저장
				} else if (goodsCodeSplitUniform[2].equals("M")) {
					goodsDetail.setGoodsStockM(goods.getGoodsStock());
					goodsDetail.setGoodsYnM(goods.getGoodsYn());
				// 사이즈가 'S'라면 goodsStockS과 goodsYnS에 각각 재고와 판매 여부 저장
				} else if (goodsCodeSplitUniform[2].equals("S")) {
					goodsDetail.setGoodsStockS(goods.getGoodsStock());
					goodsDetail.setGoodsYnS(goods.getGoodsYn());
				}
			}

		// 카테고리가 'C'라면 goodsDetail의 goodsCategory에 'Cap'을 저장, goodsStockF와 goodsYnF에 각각 재고와 판매 여부 저장
		} else if (goodsCodeSplit[1].equals("C")) {
			goodsDetail.setGoodsCategory("Cap");
			goodsDetail.setGoodsStockF(goodsDetail.getGoodsStock());
			goodsDetail.setGoodsYnF(goodsDetail.getGoodsYn());
		// 카테고리가 'F'라면 goodsDetail의 goodsCategory에 'Fan Goods'를 저장, goodsStockF와 goodsYnF에 각각 재고와 판매 여부 저장
		} else if (goodsCodeSplit[1].equals("F")) {
			goodsDetail.setGoodsCategory("Fan Goods");
			goodsDetail.setGoodsStockF(goodsDetail.getGoodsStock());
			goodsDetail.setGoodsYnF(goodsDetail.getGoodsYn());
		}

		// goodsName에 jsp에서 전달 받은 goodsName을 다시 저장
		goodsDetail.setGoodsName(goodsName);
		
		// goodsDetail을 GoodsController로 전달
		return goodsDetail;
	}

	/*
	- 방용환(생성) : 2023/08/28, 관리자 페이지 굿즈 출력 기능
	 */
	@Override
	public List<GoodsDTO> getAdminGoodsList() {
		List<GoodsDTO> goodsList = goodsDAO.selectAdminGoodsList();
		String goodsName = null;
		String goodsCategory = null;
		String goodsSize = null;
		String noSpaceGoodsCode = null;
		// admin_goods.jsp 페이지에 출력할 값들을 저장한 객체
		GoodsDTO goodsChangedName = null;

		for (int i = 0; i < goodsList.size(); i++) {
			// split()으로 나눈 값들을 goodsName, goodsCategory, goodsSize에 각각 나누어 저장
			goodsName = goodsList.get(i).getGoodsCode().split("-")[0];
			goodsCategory = goodsList.get(i).getGoodsCode().split("-")[1];
			goodsSize = goodsList.get(i).getGoodsCode().split("-")[2];

			// 위에서 저장한 값들을 goodsChangedName 객체에 set
			goodsChangedName = goodsList.get(i);
			goodsChangedName.setGoodsName(goodsName);
			goodsChangedName.setGoodsCategory(goodsCategory);
			goodsChangedName.setGoodsSize(goodsSize);

			// jsp에서 태그 아이디로 사용할 때 공백이 없어야 하기 때문에 공백 제거한 값 set
			noSpaceGoodsCode = goodsList.get(i).getGoodsCode().replaceAll(" ", "");
			goodsChangedName.setNoSpaceGoodsCode(noSpaceGoodsCode);

			// 바뀐 객체를 goodsList에 다시 set
			goodsList.set(i, goodsChangedName);
		}

		return goodsList;
	}

	/*
	- 방용환(생성) : 2023/09/01, 굿즈 등록 페이지 굿즈 등록
	 */
	@Override
	public void addAdminGoods(GoodsDTO goods) {
		String goodsName = goods.getGoodsName();
		String goodsCategory = goods.getGoodsCategory();

		// 'L' 사이즈의 재고가 0이 아니면 'L' 사이즈 INSERT
		if (goods.getGoodsStockL() != 0) {
			String goodsYn = goods.getGoodsYnL();
			int goodsStock = goods.getGoodsStockL();

			String goodsCode = goodsName + "-" + goodsCategory + "-L";

			goods.setGoodsCode(goodsCode);
			goods.setGoodsYn(goodsYn);
			goods.setGoodsStock(goodsStock);

			goodsDAO.insertAdminGoods(goods);
		}

		// 'M' 사이즈의 재고가 0이 아니면 'M' 사이즈 INSERT
		if (goods.getGoodsStockM() != 0) {
			String goodsYn = goods.getGoodsYnM();
			int goodsStock = goods.getGoodsStockM();

			String goodsCode = goodsName + "-" + goodsCategory + "-M";

			goods.setGoodsCode(goodsCode);
			goods.setGoodsYn(goodsYn);
			goods.setGoodsStock(goodsStock);

			goodsDAO.insertAdminGoods(goods);
		}

		// 'S' 사이즈의 재고가 0이 아니면 'S' 사이즈 INSERT
		if (goods.getGoodsStockS() != 0) {
			String goodsYn = goods.getGoodsYnS();
			int goodsStock = goods.getGoodsStockS();

			String goodsCode = goodsName + "-" + goodsCategory + "-S";

			goods.setGoodsCode(goodsCode);
			goods.setGoodsYn(goodsYn);
			goods.setGoodsStock(goodsStock);

			goodsDAO.insertAdminGoods(goods);
		}

		// 'F' 사이즈의 재고가 0이 아니면 'F' 사이즈 INSERT
		if (goods.getGoodsStockF() != 0) {
			String goodsYn = goods.getGoodsYnF();
			int goodsStock = goods.getGoodsStockF();

			String goodsCode = goodsName + "-" + goodsCategory + "-F";

			goods.setGoodsCode(goodsCode);
			goods.setGoodsYn(goodsYn);
			goods.setGoodsStock(goodsStock);

			goodsDAO.insertAdminGoods(goods);
		}

	}

	
	/*
	- 방용환(생성) : 2023/09/11, 관리자 굿즈 수정 기능
	admin_goods.jsp에서 입력한 수정 값을 받아와 해당 굿즈 정보 UPDATE
	 */
	@Override
	public void modifyAdminGoods(GoodsDTO goods) {
		goodsDAO.updateAdminGoods(goods);
	}

	/*
	- 방용환(생성) : 2023/09/11, 관리자 굿즈 판매 여부 수정 기능
	admin_goods.jsp에서 클릭한 굿즈의 값이 'Y'라면 'N'으로, 'N'이라면 'Y'로 굿즈 정보 UPDATE
	 */
	@Override
	public void modifyAdminGoodsYn(GoodsDTO goods) {
		goodsDAO.updateAdminGoodsYn(goods);
	}
}
