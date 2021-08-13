package co.yedam.finalprj.commentDetail.service;

import java.util.List;
import java.util.Map;

import co.yedam.finalprj.commentDetail.vo.CommentDetailVO;
import co.yedam.finalprj.comments.vo.CommentsVO;

public interface CommentDetailService {
	List<CommentDetailVO> CommentDetailList();
	List<CommentDetailVO> CommentDetailSelect(CommentDetailVO vo);
	int insertCommentDetail(List<Map<String, Object>> vo);
	List<CommentsVO> commentDetailData(CommentsVO vo);
	CommentsVO commentDetailDataOne(CommentsVO vo);
	int deleteCommentDetail(CommentDetailVO vo);
	
}
