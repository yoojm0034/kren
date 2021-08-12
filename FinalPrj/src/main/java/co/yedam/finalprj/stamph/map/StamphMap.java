package co.yedam.finalprj.stamph.map;

import java.util.List;

import co.yedam.finalprj.stamph.vo.StamphVO;

public interface StamphMap {
	List<StamphVO> stamphSelectList(StamphVO vo);
	StamphVO stamphLoginCheck(StamphVO vo);
	int stamphLoginInsert(StamphVO vo);
}
