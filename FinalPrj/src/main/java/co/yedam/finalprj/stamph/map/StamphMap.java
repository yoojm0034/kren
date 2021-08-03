package co.yedam.finalprj.stamph.map;

import co.yedam.finalprj.stamph.vo.StamphVO;

public interface StamphMap {
	StamphVO stamphSelect(StamphVO vo);
	int stamphInsert(StamphVO vo);
}
