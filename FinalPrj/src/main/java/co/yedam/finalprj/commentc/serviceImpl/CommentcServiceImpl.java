package co.yedam.finalprj.commentc.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import co.yedam.finalprj.commentc.map.CommentcMap;
import co.yedam.finalprj.commentc.service.CommentcService;
import co.yedam.finalprj.commentc.vo.CommentcVO;

@Repository("commentcDao")
public class CommentcServiceImpl implements CommentcService {
	@Autowired CommentcMap map;
	
	@Override
	public List<CommentcVO> commentcList() {
		return map.commentcList();
	}

	@Override
	public CommentcVO commentcSelect(CommentcVO vo) {
		return map.commentcSelect(vo);
	}

	@Override
	public int commentcInsert(CommentcVO vo) {
		return map.commentcInsert(vo);
	}

	@Override
	public int commentcDelete(CommentcVO vo) {
		return map.commentcDelete(vo);
	}

	@Override
	public List<CommentcVO> oneSelect(CommentcVO vo) {
		return map.oneSelect(vo);
	}

}
