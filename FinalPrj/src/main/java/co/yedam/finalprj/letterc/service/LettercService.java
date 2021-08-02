package co.yedam.finalprj.letterc.service;

import java.util.List;
import java.util.Map;

import co.yedam.finalprj.letterc.vo.LettercVO;

public interface LettercService {
	public int insertLetterC(List<Map<String, Object>> vo);
	public List<LettercVO> selectLetterC(LettercVO vo);
	
}
