package co.yedam.finalprj.block.service;

import java.util.List;

import co.yedam.finalprj.block.vo.BlockVO;

public interface BlockService {
	List<BlockVO> blockSelectList();
	BlockVO blockSelect(BlockVO vo);
	int blockInsert(BlockVO vo);
	int blockUpdate(BlockVO vo);
	int blockDelete(BlockVO vo);
	
	
}
