package co.yedam.finalprj.stamp.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.finalprj.stamp.map.StampMap;
import co.yedam.finalprj.stamp.service.StampService;
import co.yedam.finalprj.stamp.vo.StampVO;
import co.yedam.finalprj.stamph.vo.StamphVO;
@Repository("stampDao")
public class StampServiceImpl implements StampService {
	@Autowired
	StampMap map;
	
	@Override
	public List<StampVO> stampSelectList() {
		// TODO Auto-generated method stub
		return map.stampSelectList();
	}

	@Override
	public StampVO stampSelect(StampVO vo) {
		// TODO Auto-generated method stub
		return map.stampSelect(vo);
	}

	@Override
	public int stampInsert(StampVO vo) {
		// TODO Auto-generated method stub
		return map.stampInsert(vo);
	}

	@Override
	public int stampUpdate(StampVO vo) {
		// TODO Auto-generated method stub
		return map.stampUpdate(vo);
	}

	@Override
	public int stampDelete(StampVO vo) {
		// TODO Auto-generated method stub
		return map.stampDelete(vo);
	}


}
