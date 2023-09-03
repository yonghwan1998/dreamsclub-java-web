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

//	굿즈 메인 페이지

	@Override
	public List<GoodsDTO> getGoodsList(Map<String, Object> map) {
		List<GoodsDTO> goodsList = goodsDAO.selectGoodsList(map);
		String goodsName = null;
		GoodsDTO goodsChangedName=null;

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

//	굿즈 디테일 페이지

	@Override
	public GoodsDTO getGoodsDetail(String goodsName) {
		System.out.println(goodsName);
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

//	관리자 페이지 굿즈 관리
	@Override
	public List<GoodsDTO> getAdminGoodsList() {
		List<GoodsDTO> goodsList = goodsDAO.selectAdminGoodsList();

		return goodsList;
	}

	@Override
	public void addGoods(GoodsDTO goods) {

		String goodsSize = goods.getGoodsSize();
		String goodsCode = goods.getGoodsCode();
		String goodsCategory = goods.getGoodsCategory();

		goodsCode = goodsCode + "-" + goodsCategory + "-" + goodsSize;

		goods.setGoodsCode(goodsCode);

		goodsDAO.insertGoods(goods);
	}
}
