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

	@Override
	public List<CheerDTO> getCheerList() {
		List<CheerDTO> cheerList = cheerDAO.selectCheerList();
		return cheerList;
	}

}
