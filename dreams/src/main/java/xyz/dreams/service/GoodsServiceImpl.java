package xyz.dreams.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dao.GoodsDAO;
import xyz.dreams.dto.GoodsDTO;

@Service
@RequiredArgsConstructor
public class GoodsServiceImpl implements GoodsService {

	private final GoodsDAO goodsDAO;

	@Override
	public List<GoodsDTO> getGoodsList() {
		List<GoodsDTO> goodsList = goodsDAO.selectGoodsList();
		String[] goodsCodeSplit = null;
		String goodsName = null;

		List<GoodsDTO> goodsResult = new ArrayList<GoodsDTO>();
		int temp = 0;

		for (int i = 0; i < goodsList.size(); i++) {
			goodsCodeSplit = goodsList.get(i).getGoodsCode().split("-");
			goodsName = goodsCodeSplit[1];
			GoodsDTO goodsChangedName = goodsList.get(i);
			goodsChangedName.setGoodsCode(goodsName);
			goodsList.set(i, goodsChangedName);
		}

		goodsResult.add(goodsList.get(0));

		for (int i = 0; i < goodsList.size() - 1; i++) {
			if (!goodsResult.get(0 + temp).getGoodsCode().equals(goodsList.get(i + 1).getGoodsCode())) {
				goodsResult.add(goodsList.get(i + 1));
				temp += 1;
			}
		}
		return goodsResult;
	}
}
