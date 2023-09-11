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

//	굿즈 리스트 출력
	@Override
	public List<GoodsDTO> getGoodsList(Map<String, Object> map) {
		List<GoodsDTO> goodsList = goodsDAO.selectGoodsList(map);
		String goodsName = null;
		GoodsDTO goodsChangedName = null;

		List<GoodsDTO> goodsResult = new ArrayList<GoodsDTO>();
		int temp = 0;

//		goodsCode에서 split()으로 goodsName만 남기기
		for (int i = 0; i < goodsList.size(); i++) {
			goodsName = goodsList.get(i).getGoodsCode().split("-")[0];

			goodsChangedName = goodsList.get(i);
			goodsChangedName.setGoodsName(goodsName);

			goodsList.set(i, goodsChangedName);
		}

//		중복되는 goodsName 제거하기
		goodsResult.add(goodsList.get(0));

		for (int i = 0; i < goodsList.size() - 1; i++) {
			if (!goodsResult.get(0 + temp).getGoodsName().equals(goodsList.get(i + 1).getGoodsName())) {
				goodsResult.add(goodsList.get(i + 1));
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
