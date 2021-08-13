package co.yedam.finalprj.commentDetail.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.yedam.finalprj.commentDetail.map.CommentDetailMap;
import co.yedam.finalprj.commentDetail.service.CommentDetailService;
import co.yedam.finalprj.commentDetail.vo.CommentDetailVO;
import co.yedam.finalprj.comments.vo.CommentsVO;

@Service
public class CommentDetailServiceImpl implements CommentDetailService {
	@Autowired CommentDetailMap map;
	
	@Override
	public List<CommentDetailVO> CommentDetailList() {
		return map.CommentDetailList();
	}

	@Override
	public List<CommentDetailVO> CommentDetailSelect(CommentDetailVO vo) {
		return map.CommentDetailSelect(vo);
	}

	@Override
	public int insertCommentDetail(List<Map<String, Object>> vo) {
		return map.insertCommentDetail(vo);
	}

	@Override
	public int deleteCommentDetail(CommentDetailVO vo) {
		return map.deleteCommentDetail(vo);
	}

	@Override
	public List<CommentsVO> commentDetailData(CommentsVO vo) {
		return map.commentDetailData(vo);
	}

	@Override
	public CommentsVO commentDetailDataOne(CommentsVO vo) {
		return map.commentDetailDataOne(vo);
	}

}
