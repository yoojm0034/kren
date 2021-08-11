package co.yedam.finalprj.common.map;

import java.util.List;

import co.yedam.finalprj.commentc.vo.CommentcVO;
import co.yedam.finalprj.comments.vo.CommentsVO;
import co.yedam.finalprj.common.vo.SearchVO;
import co.yedam.finalprj.feed.vo.FeedVO;
import co.yedam.finalprj.notice.vo.NoticeVO;
import co.yedam.finalprj.users.vo.UsersVO;

public interface SearchMap {
	List<UsersVO> allSearchUser(SearchVO vo);
	List<NoticeVO> allSearchNotice(SearchVO vo);
	List<FeedVO> allSearchFeed(SearchVO vo);
	List<CommentsVO> allSearchComments(SearchVO vo);
	List<CommentcVO> allSearchCommentc(SearchVO vo);
}
