package co.yedam.finalprj.letterc.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.finalprj.letterc.map.LettercMap;
import co.yedam.finalprj.letterc.service.LettercService;
import co.yedam.finalprj.letterc.vo.LettercVO;

@Repository("lettercDao")
public class LettercServiceImpl implements LettercService {
	@Autowired LettercMap map;

	@Override
	public int insertLetterC(List<Map<String, Object>> vo) {
		return map.insertLetterC(vo);
	}

	@Override
	public List<LettercVO> selectLetterC() {
		return map.selectLetterC();
	}

}
