package co.yedam.finalprj.feed.service;

import java.util.List;
import java.util.Map;

import co.yedam.finalprj.feed.vo.FeedVO;
import co.yedam.finalprj.friends.vo.FriendsVO;
import co.yedam.finalprj.likes.vo.LikesVO;
import co.yedam.finalprj.tag.vo.TagVO;
import co.yedam.finalprj.topic.vo.TopicVO;
import co.yedam.finalprj.users.vo.UsersVO;

public interface FeedService {
	 List<Map<String,Object>> feedSelectList(FeedVO vo);			//피드리스트
	 int feedUpdate(FeedVO vo);										//피드수정
	 int feedInsert(FeedVO vo);										//피드등록
	 int feedDelete(FeedVO vo);										//피드삭제

	 List<UsersVO> birthUser(FriendsVO vo);							//생일인유저
	
	 List<UsersVO> sameTopicList(UsersVO vo); 						//나와일치하는관심사수
	 List<UsersVO> searchFriend(UsersVO vo);
	 List<UsersVO> allUser(UsersVO vo);
	 List<UsersVO> newUser(UsersVO vo);
	 
	 FeedVO oneSelectFeed(FeedVO vo);		
}