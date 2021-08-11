package co.yedam.finalprj.common.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.yedam.finalprj.commentc.vo.CommentcVO;
import co.yedam.finalprj.comments.vo.CommentsVO;
import co.yedam.finalprj.common.map.SearchMap;
import co.yedam.finalprj.common.service.SearchService;
import co.yedam.finalprj.common.vo.SearchVO;
import co.yedam.finalprj.feed.vo.FeedVO;
import co.yedam.finalprj.notice.vo.NoticeVO;
import co.yedam.finalprj.users.vo.UsersVO;
@Service
public class SearchServiceImpl implements SearchService {
	@Autowired
	SearchMap map;
	
	@Override
	public List<UsersVO> allSearchUser(SearchVO vo) {
		// TODO Auto-generated method stub
		return map.allSearchUser(vo);
	}

	@Override
	public List<NoticeVO> allSearchNotice(SearchVO vo) {
		// TODO Auto-generated method stub
		return map.allSearchNotice(vo);
	}

	@Override
	public List<FeedVO> allSearchFeed(SearchVO vo) {
		// TODO Auto-generated method stub
		return map.allSearchFeed(vo);
	}

	@Override
	public List<CommentsVO> allSearchComments(SearchVO vo) {
		// TODO Auto-generated method stub
		return map.allSearchComments(vo);
	}

	@Override
	public List<CommentcVO> allSearchCommentc(SearchVO vo) {
		// TODO Auto-generated method stub
		return map.allSearchCommentc(vo);
	}

}
