package co.yedam.finalprj.comments.map;

import java.util.List;

import co.yedam.finalprj.comments.vo.CommentsVO;

public interface CommentsMap {
	List<CommentsVO> commentSelectList();
	CommentsVO commentSelect(CommentsVO vo);
	CommentsVO commentInsertData(CommentsVO vo);
	int commentCnt(CommentsVO vo);
	int commentInsert(CommentsVO vo);
	int commentUpdate(CommentsVO vo);
	int commentDelete(CommentsVO vo);
}
