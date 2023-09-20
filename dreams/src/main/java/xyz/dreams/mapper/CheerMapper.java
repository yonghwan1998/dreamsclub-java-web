package xyz.dreams.mapper;

import java.util.List;
import java.util.Map;

import xyz.dreams.dto.CheerDTO;

public interface CheerMapper {
	
	/*
	- 방용환(생성) : 2023/09/19, 응원의 한마디 페이지 정보 출력
	
	- 방용환(수정) : 2023/09/20, 페이징 처리
	 */
	List<CheerDTO> selectCheerList(Map<String, Object> map);

	/*
	- 방용환(생성) : 2023/09/19, 응원의 한마디 페이지 새로운 메모 INSERT
	 */
	int insertCheer(CheerDTO cheer);
	
	int selectCheerCount();
}
