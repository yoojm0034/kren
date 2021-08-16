package co.yedam.finalprj.stamph.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.finalprj.stamph.map.StamphMap;
import co.yedam.finalprj.stamph.service.StamphService;
import co.yedam.finalprj.stamph.vo.StamphVO;

@Repository("stamphDao")
public class StamphServiceImpl implements StamphService {
	@Autowired
	StamphMap map;

	@Override
	public List<StamphVO> stamphSelectList(StamphVO vo) {
		return map.stamphSelectList(vo);
	}

	@Override
	public int stamphLoginCheck(StamphVO vo) {
		return map.stamphLoginCheck(vo);
	}

	@Override
	public int stamphLoginInsert(StamphVO vo) {
		return map.stamphLoginInsert(vo);
	}

	@Override
	public int stamphLoginUserPlus(StamphVO vo) {
		return map.stamphLoginUserPlus(vo);
	}

	@Override
	public int stamphFeedCheck(StamphVO vo) {
		// TODO Auto-generated method stub
		return map.stamphFeedCheck(vo);
	}

	@Override
	public int stamphFeedInsert(StamphVO vo) {
		// TODO Auto-generated method stub
		return map.stamphFeedInsert(vo);
	}
}
