package xyz.dreams.util;

import java.util.Comparator;

import xyz.dreams.dto.GoodsDTO;

/*
- 방용환(생성) : 2023/09/17, 굿즈 리뷰순 출력을 위한 클래스
 */
public class GoodsReviewComparator implements Comparator<GoodsDTO> {

	@Override
	public int compare(GoodsDTO goods1, GoodsDTO goods2) {
		if (goods1.getReviewCount() > goods2.getReviewCount()) {
			return 1;
		} else if (goods1.getReviewCount() == goods2.getReviewCount()) {
			return 0;
		} else {
			return -1;
		}
	}

}
