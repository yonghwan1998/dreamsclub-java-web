package xyz.dreams.dao;

import java.util.List;

import xyz.dreams.dto.GoodsDTO;

public interface GoodsDAO {
	List<GoodsDTO> selectGoodsList();
}
