package xyz.dreams.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dao.CheerDAO;
import xyz.dreams.dto.CheerDTO;
import xyz.dreams.util.Pager;

@Service
@RequiredArgsConstructor
public class CheerServiceImpl implements CheerService {
	private final CheerDAO cheerDAO;

	/*
	- 방용환(생성) : 2023/09/19, 응원의 한마디 페이지 정보 출력
	
	- 방용환(수정) : 2023/09/20, 페이징 처리
	 */
	@Override
	public Map<String, Object> getCheerList(int pageNum) {
		int totalCheer = cheerDAO.selectCheerCount();
		int pageSize = 10;
		int blockSize = 5;
		
		Pager pager = new Pager(pageNum, totalCheer, pageSize, blockSize);
		
		Map<String, Object> pageMap = new HashMap<String, Object>();
		pageMap.put("startRow", pager.getStartRow());
		pageMap.put("endRow", pager.getEndRow());
		List<CheerDTO> cheerList = cheerDAO.selectCheerList(pageMap);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("pager", pager);
		resultMap.put("cheerList", cheerList);
		
		return resultMap;
	}

	/*
	- 방용환(생성) : 2023/09/19, 응원의 한마디 페이지 새로운 메모 INSERT
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public void addCheer(CheerDTO cheer) {
		cheerDAO.insertCheer(cheer);
	}

}
