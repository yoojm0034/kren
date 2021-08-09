package co.yedam.finalprj.block.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.yedam.finalprj.block.map.BlockMap;
import co.yedam.finalprj.block.service.BlockService;
import co.yedam.finalprj.block.vo.BlockVO;

@Service
public class BlockServiceImpl implements BlockService {
	@Autowired
	BlockMap map;
	
	@Override
	public List<BlockVO> blockSelectList() {
		// TODO Auto-generated method stub
		return map.blockSelectList();
	}

	@Override
	public BlockVO blockSelect(BlockVO vo) {
		// TODO Auto-generated method stub
		return map.blockSelect(vo);
	}

	@Override
	public int blockInsert(BlockVO vo) {
		// TODO Auto-generated method stub
		return map.blockInsert(vo);
	}

	@Override
	public int blockUpdate(BlockVO vo) {
		// TODO Auto-generated method stub
		return map.blockUpdate(vo);
	}

	@Override
	public int blockDelete(BlockVO vo) {
		// TODO Auto-generated method stub
		return map.blockDelete(vo);
	}

}
