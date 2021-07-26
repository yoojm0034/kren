package co.yedam.finalprj.stamp.service;

import java.util.List;

import co.yedam.finalprj.stamp.vo.StampVO;

public interface StampService {
	List<StampVO> stampSelectList();
	StampVO stampSelect(StampVO vo);
	int stampInsert(StampVO vo);
	int stampUpdate(StampVO vo);
	int stampDelete(StampVO vo);
}
