package co.yedam.finalprj.stamph.service;

import co.yedam.finalprj.stamph.vo.StamphVO;

public interface StamphService {
	StamphVO stamphSelect(StamphVO vo);
	int stamphInsert(StamphVO vo);
}
