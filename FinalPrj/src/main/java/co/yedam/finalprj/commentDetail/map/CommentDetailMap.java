package co.yedam.finalprj.commentDetail.map;

import java.util.List;
import java.util.Map;

import co.yedam.finalprj.commentDetail.vo.CommentDetailVO;

public interface CommentDetailMap {
	List<CommentDetailVO> CommentDetailList();
	List<CommentDetailVO> CommentDetailSelect(CommentDetailVO vo);
	int insertCommentDetail(List<Map<String, Object>> vo);
	int deleteCommentDetail(CommentDetailVO vo);
}
