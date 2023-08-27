package xyz.dreams.mapper;

import java.util.List;

import xyz.dreams.dto.GoodsDTO;

public interface GoodsMapper {
	List<GoodsDTO> selectGoodsList();
}
