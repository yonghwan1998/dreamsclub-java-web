package xyz.dreams.mapper;

import java.util.List;

import xyz.dreams.dto.CheerDTO;

public interface CheerMapper {
	List<CheerDTO> selectCheerList();
}
