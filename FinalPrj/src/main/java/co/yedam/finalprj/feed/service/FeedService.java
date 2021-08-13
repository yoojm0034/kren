package co.yedam.finalprj.feed.service;

import java.util.List;
import java.util.Map;

import co.yedam.finalprj.feed.vo.FeedVO;
import co.yedam.finalprj.friends.vo.FriendsVO;
import co.yedam.finalprj.users.vo.UsersVO;

public interface FeedService {
	 List<Map<String,Object>> feedSelectList(FeedVO vo);			//피드리스트
	 List<Map<String,Object>> pushSelect(FeedVO vo); 
	 int feedUpdate(FeedVO vo);										//피드수정
	 int feedInsert(FeedVO vo);										//피드등록
	 int feedDelete(FeedVO vo);										//피드삭제

	 List<UsersVO> birthUser(FriendsVO vo);							//생일인유저
	
	 List<UsersVO> sameTopicList(UsersVO vo); 						//나와일치하는관심사수
	 
	 FeedVO oneSelectFeed(FeedVO vo);		
}