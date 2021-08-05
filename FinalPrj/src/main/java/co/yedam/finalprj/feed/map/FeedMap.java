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
	List<LikesVO> FeedLikeSelect(LikesVO vo);		
	List<UsersVO> birthUser(FriendsVO vo);						//생일인유저 ->친구검색
	List<UsersVO> sameTopicList(UsersVO vo); 					//나와일치하는관심사수
	
	List<TagVO> likeTag();										//인기있는태그 ->태그
	int tagSelect(TagVO vo);								    //태그체크 ->태그
	int tagInsert(TagVO vo);									//태그등록 ->태그
	
	int feedInsert(FeedVO vo);									//피드등록	
	int feedDelete(FeedVO vo);									//피드삭제
	int feedUpdate(FeedVO vo);									//피드수정
	int likeCntUPdate(LikesVO vo);
	
	//친구
	
	List<FriendsVO> allUser(FriendsVO vo);
	List<FriendsVO> newUser(FriendsVO vo);
	List<FriendsVO> myUser(FriendsVO vo);
}

