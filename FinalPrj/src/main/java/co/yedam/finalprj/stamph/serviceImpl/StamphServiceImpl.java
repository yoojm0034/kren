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
		// TODO Auto-generated method stub
		return map.stamphSelectList(vo);
	}
}
