package co.yedam.finalprj.feed.map;

import java.util.List;
import java.util.Map;

import co.yedam.finalprj.feed.vo.FeedVO;
import co.yedam.finalprj.friends.vo.FriendsVO;
import co.yedam.finalprj.users.vo.UsersVO;

public interface FeedMap {
	List<Map<String,Object>> feedSelectList(FeedVO vo);			//피드리스트
	List<Map<String,Object>> pushSelect(FeedVO vo); 
	int feedInsert(FeedVO vo);									//피드등록	
	int feedDelete(FeedVO vo);									//피드삭제
	int feedUpdate(FeedVO vo);									//피드수정
	//친구
	List<UsersVO> birthUser(UsersVO vo);						//생일인유저
	List<UsersVO> sameTopicList(UsersVO vo); 					//나와일치하는관심사수
	//관리자
	//피드1건조회
	FeedVO oneSelectFeed(FeedVO vo);
}

