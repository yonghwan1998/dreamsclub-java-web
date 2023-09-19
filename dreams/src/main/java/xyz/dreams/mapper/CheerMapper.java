package xyz.dreams.mapper;

import java.util.List;

import xyz.dreams.dto.CheerDTO;

public interface CheerMapper {
	
	/*
	- 방용환(생성) : 2023/09/19, 응원의 한마디 페이지 정보 출력
	 */
	List<CheerDTO> selectCheerList();

	/*
	- 방용환(생성) : 2023/09/19, 응원의 한마디 페이지 새로운 메모 INSERT
	 */
	int insertCheer(CheerDTO cheer);
}
