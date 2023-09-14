package xyz.dreams.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dao.GoodsDAO;
import xyz.dreams.dto.GoodsDTO;

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
	*/
	@Override
	public List<GoodsDTO> getGoodsList(Map<String, Object> map) {
		// 검색 조건들을 Map에 담아서 goodsDAO.selectGoodsList(Map<String, Object> map)의 인자로 넘기고
		// 굿즈 전체 리스트를 goodsList에 저장
		List<GoodsDTO> goodsList = goodsDAO.selectGoodsList(map);
		String goodsName = null;
		GoodsDTO goodsChangedName = null;

		// jsp에서 선택된 카테고리만 저장하기 위한 goodsCategoryList 변수
		List<GoodsDTO> goodsCategoryList = new ArrayList<GoodsDTO>();
		boolean uniform = (Boolean) map.get("uniform");
		boolean cap = (Boolean) map.get("cap");
		boolean fan = (Boolean) map.get("fan");

		// 검색된 전체 굿즈 리스트 사이즈만큼 for문 반복
		for (int i = 0; i < goodsList.size(); i++) {
			// '이름-카테고리-사이즈'로 저장 되어 있는 goodsCode를 split()을 통해
			// 카테고리만 가져옴
			String goodsCategory = goodsList.get(i).getGoodsCode().split("-")[1];

			// jsp에서 Uniform이 선택 되어 있고
			// DB에서 가져온 리스트의 카테고리가 'U'라면
			// goodsCategoryList 변수에 저장함
			if (uniform == true && goodsCategory.equals("U")) {
				goodsCategoryList.add(goodsList.get(i));
			}
			
			// jsp에서 Cap이 선택 되어 있고
			// DB에서 가져온 리스트의 카테고리가 'C'라면
			// goodsCategoryList 변수에 저장함
			if (cap == true && goodsCategory.equals("C")) {
				goodsCategoryList.add(goodsList.get(i));
			}
			
			// jsp에서 Fan Goods가 선택 되어 있고
			// DB에서 가져온 리스트의 카테고리가 'F'라면
			// goodsCategoryList 변수에 저장함
			if (fan == true && goodsCategory.equals("F")) {
				goodsCategoryList.add(goodsList.get(i));
			}
		}

		// goodsCategoryList 사이즈만큼 for문 반복
		for (int i = 0; i < goodsCategoryList.size(); i++) {
			// '이름-카테고리-사이즈'로 저장 되어 있는 goodsCode를 split()을 통해
			// 이름만 goodsName에 저장
			goodsName = goodsCategoryList.get(i).getGoodsCode().split("-")[0];

			// setter를 통해 이름만 추출한 goodsName을
			// goodsChangedName에 저장하고 변경된 값을 goodsCategoryList에 저장 
			goodsChangedName = goodsCategoryList.get(i);
			goodsChangedName.setGoodsName(goodsName);

			goodsCategoryList.set(i, goodsChangedName);
		}
		
		// 실제 페이지에 출력하기 위한 굿즈 리스트를 저장하기 위한 goodsResult 변수
		List<GoodsDTO> goodsResult = new ArrayList<GoodsDTO>();

		// goodsCode가 '이름-카테고리-사이즈'에서 '이름'으로 바뀌어 저장되었지만
		// 다른 사이즈의 같은 제품은 이름이 곂치기 때문에 중복제거를 해야함
		// 최초에 비교할 값 저장
		goodsResult.add(goodsCategoryList.get(0));
		// goodsResult의 가장 끝값을 비교하기 위한 임시 변수
		int temp = 0;
		
		// goodsCategoryList 사이즈-1 만큼(윗 줄에 최초에 비교할 값을 저장했기 때문에) for문 반복
		for (int i = 0; i < goodsCategoryList.size() - 1; i++) {
			// goodsResult의 가장 끝에 있는 goodsName과
			// goodsCategoryList의 가장 처음에 있는 goodsName이 다르면
			// goodsResult에 goodsCategoryList의 가장 처음값 저장 후
			// 임시 변수(temp) 증가
			if (!goodsResult.get(0 + temp).getGoodsName().equals(goodsCategoryList.get(i + 1).getGoodsName())) {
				goodsResult.add(goodsCategoryList.get(i + 1));
				temp += 1;
			}
		}
		return goodsResult;
	}

//	굿즈 상세 정보 출력
	@Override
	public GoodsDTO getGoodsDetail(String goodsName) {
		List<GoodsDTO> goodsDetailList = goodsDAO.selectGoodsDetailList(goodsName);

		GoodsDTO goodsDetail = goodsDetailList.get(0);

		String[] goodsCodeSplit = null;
		goodsCodeSplit = goodsDetail.getGoodsCode().split("-");
		if (goodsCodeSplit[1].equals("U")) {
			goodsDetail.setGoodsCategory("Uniform");
		} else if (goodsCodeSplit[1].equals("C")) {
			goodsDetail.setGoodsCategory("Cap");
		} else if (goodsCodeSplit[1].equals("F")) {
			goodsDetail.setGoodsCategory("Fan Goods");
		}

		goodsDetail.setGoodsName(goodsName);

		return goodsDetail;
	}

//	관리자 굿즈 리스트 출력
	@Override
	public List<GoodsDTO> getAdminGoodsList() {
		List<GoodsDTO> goodsList = goodsDAO.selectAdminGoodsList();
		String goodsName = null;
		String goodsCategory = null;
		String goodsSize = null;
		String noSpaceGoodsCode = null;
		GoodsDTO goodsChangedName = null;

		for (int i = 0; i < goodsList.size(); i++) {
			goodsName = goodsList.get(i).getGoodsCode().split("-")[0];
			goodsCategory = goodsList.get(i).getGoodsCode().split("-")[1];
			goodsSize = goodsList.get(i).getGoodsCode().split("-")[2];

			goodsChangedName = goodsList.get(i);
			goodsChangedName.setGoodsName(goodsName);
			goodsChangedName.setGoodsCategory(goodsCategory);
			goodsChangedName.setGoodsSize(goodsSize);

			noSpaceGoodsCode = goodsList.get(i).getGoodsCode().replaceAll(" ", "");
			goodsChangedName.setNoSpaceGoodsCode(noSpaceGoodsCode);

			goodsList.set(i, goodsChangedName);
		}

		return goodsList;
	}

// 관리자 굿즈 등록
	@Override
	public void addAdminGoods(GoodsDTO goods) {
		String goodsName = goods.getGoodsName();
		String goodsCategory = goods.getGoodsCategory();

//		L 사이즈가 있는 경우 insert
		if (goods.getGoodsStockL() != 0) {
			String goodsYn = goods.getGoodsYnL();
			int goodsStock = goods.getGoodsStockL();

			String goodsCode = goodsName + "-" + goodsCategory + "-L";

			goods.setGoodsCode(goodsCode);
			goods.setGoodsYn(goodsYn);
			goods.setGoodsStock(goodsStock);

			goodsDAO.insertAdminGoods(goods);
		}

//		M 사이즈가 있는 경우 insert
		if (goods.getGoodsStockM() != 0) {
			String goodsYn = goods.getGoodsYnM();
			int goodsStock = goods.getGoodsStockM();

			String goodsCode = goodsName + "-" + goodsCategory + "-M";

			goods.setGoodsCode(goodsCode);
			goods.setGoodsYn(goodsYn);
			goods.setGoodsStock(goodsStock);

			goodsDAO.insertAdminGoods(goods);
		}

//		S 사이즈가 있는 경우 insert
		if (goods.getGoodsStockS() != 0) {
			String goodsYn = goods.getGoodsYnS();
			int goodsStock = goods.getGoodsStockS();

			String goodsCode = goodsName + "-" + goodsCategory + "-S";

			goods.setGoodsCode(goodsCode);
			goods.setGoodsYn(goodsYn);
			goods.setGoodsStock(goodsStock);

			goodsDAO.insertAdminGoods(goods);
		}

//		F 사이즈가 있는 경우 insert
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
	방용환(생성) : 2023/09/11, 관리자 굿즈 수정 기능
	admin_goods.jsp에서 입력한 수정 값을 받아와 해당 굿즈 정보 UPDATE
	 */
	@Override
	public void modifyAdminGoods(GoodsDTO goods) {
		goodsDAO.updateAdminGoods(goods);
	}

	/*
	방용환(생성) : 2023/09/11, 관리자 굿즈 판매 여부 수정 기능
	admin_goods.jsp에서 클릭한 굿즈의 값이 'Y'라면 'N'으로, 'N'이라면 'Y'로 굿즈 정보 UPDATE
	 */
	@Override
	public void modifyAdminGoodsYn(GoodsDTO goods) {
		goodsDAO.updateAdminGoodsYn(goods);
	}
}
