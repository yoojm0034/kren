package co.yedam.finalprj.stamph.service;

import java.util.List;

import co.yedam.finalprj.stamph.vo.StamphVO;

public interface StamphService {
	List<StamphVO> stamphSelectList(StamphVO vo);
	int stamphLoginCheck(StamphVO vo);
	int stamphLoginInsert(StamphVO vo);
	int stamphLoginUserPlus(StamphVO vo);
	
	
	int stamphFeedCheck(StamphVO vo);
	int stamphFeedInsert(StamphVO vo);
}
