package co.yedam.finalprj.stamp.map;

import java.util.List;

import co.yedam.finalprj.stamp.vo.StampVO;

public interface StampMap {
	List<StampVO> stampSelectList();
	StampVO stampSelect(StampVO vo);
	int stampInsert(StampVO vo);
	int stampUpdate(StampVO vo);
	int stampDelete(StampVO vo);
}
