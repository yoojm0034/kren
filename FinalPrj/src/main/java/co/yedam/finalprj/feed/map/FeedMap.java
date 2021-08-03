package co.yedam.finalprj.feed.map;

import java.util.List;
import java.util.Map;

import co.yedam.finalprj.feed.vo.FeedVO;
import co.yedam.finalprj.friends.vo.FriendsVO;
import co.yedam.finalprj.likes.vo.LikesVO;
import co.yedam.finalprj.tag.vo.TagVO;
import co.yedam.finalprj.users.vo.UsersVO;

public interface FeedMap {
	List<Map<String,Object>> feedSelectList(FeedVO vo);			//피드리스트
	List<Map<String,Object>> FeedLikeSelect(LikesVO vo);		
	List<UsersVO> birthUser(FriendsVO vo);						//생일인유저
	List<TagVO> likeTag();										//인기있는태그
	List<UsersVO> sameTopicList(UsersVO vo); 					//나와일치하는관심사수
	int tagSelect(TagVO vo);								    //태그체크
	int tagInsert(TagVO vo);									//태그등록
	int feedInsert(FeedVO vo);									//피드등록	
	int feedDelete(FeedVO vo);									//피드삭제
	int feedUpdate(FeedVO vo);									//피드수정
}

