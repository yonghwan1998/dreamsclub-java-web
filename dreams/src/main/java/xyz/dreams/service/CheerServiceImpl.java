package xyz.dreams.service;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dao.CheerDAO;
import xyz.dreams.dto.CheerDTO;

@Service
@RequiredArgsConstructor
public class CheerServiceImpl implements CheerService {
	private final CheerDAO cheerDAO;

	/*
	- 방용환(생성) : 2023/09/19, 응원의 한마디 페이지 정보 출력
	 */
	@Override
	public List<CheerDTO> getCheerList() {
		List<CheerDTO> cheerList = cheerDAO.selectCheerList();
		return cheerList;
	}

	/*
	- 방용환(생성) : 2023/09/19, 응원의 한마디 페이지 새로운 메모 INSERT
	 */
	@Override
	public void addCheer(CheerDTO cheer) {
		cheerDAO.insertCheer(cheer);
	}

}
