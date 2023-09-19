package xyz.dreams.dao;

import java.util.List;

import xyz.dreams.dto.CheerDTO;

public interface CheerDAO {
	List<CheerDTO> selectCheerList();
}
