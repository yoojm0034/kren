package co.yedam.finalprj.stamph.service;

import java.util.List;

import co.yedam.finalprj.stamph.vo.StamphVO;

public interface StamphService {
	List<StamphVO> stamphSelectList(StamphVO vo);
	StamphVO stamphLoginCheck(StamphVO vo);
	int stamphLoginInsert(StamphVO vo);
}
