package co.yedam.finalprj.stamph.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.finalprj.stamph.map.StamphMap;
import co.yedam.finalprj.stamph.service.StamphService;
import co.yedam.finalprj.stamph.vo.StamphVO;

@Repository
public class StamphServiceImpl implements StamphService {
	@Autowired
	StamphMap map;

	@Override
	public StamphVO stamphSelect(StamphVO vo) {
		// TODO Auto-generated method stub
		return map.stamphSelect(vo);
	}

	@Override
	public int stamphInsert(StamphVO vo) {
		// TODO Auto-generated method stub
		return map.stamphInsert(vo);
	}

}
