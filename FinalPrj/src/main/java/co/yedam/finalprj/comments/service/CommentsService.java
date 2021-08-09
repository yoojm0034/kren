package co.yedam.finalprj.comments.service;


import java.util.List;

import co.yedam.finalprj.comments.vo.CommentsVO;

public interface CommentsService {
	List<CommentsVO> commentSelectList();
	CommentsVO commentSelect(CommentsVO vo);
	CommentsVO commentInsertData(CommentsVO vo);
	int commentCnt(CommentsVO vo);
	int commentInsert(CommentsVO vo);
	int commentUpdate(CommentsVO vo);
	int commentDelete(CommentsVO vo);
	
}
