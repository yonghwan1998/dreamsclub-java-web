package xyz.dreams.service;

import java.util.List;

import xyz.dreams.dto.GoodsDTO;

public interface GoodsService {
	List<GoodsDTO> getGoodsList(String q);
}
