package co.yedam.finalprj.comments.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.finalprj.comments.map.CommentsMap;
import co.yedam.finalprj.comments.service.CommentsService;
import co.yedam.finalprj.comments.vo.CommentsVO;

@Repository("CommentDao")
public class CommentsServiceImpl implements CommentsService {
	@Autowired
	CommentsMap map;

	
	@Override
	public List<CommentsVO> commentSelectList() {
		return map.commentSelectList();
	}

	@Override
	public CommentsVO commentSelect(CommentsVO vo) {
		return map.commentSelect(vo);
	}

	@Override
	public int commentInsert(CommentsVO vo) {
		return map.commentInsert(vo);
	}

	@Override
	public int commentUpdate(CommentsVO vo) {
		return map.commentUpdate(vo);
	}

	@Override
	public int commentDelete(CommentsVO vo) {
		return map.commentDelete(vo);
	}

}
