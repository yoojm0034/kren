package co.yedam.finalprj.users.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import co.yedam.finalprj.feed.vo.FeedVO;
import co.yedam.finalprj.friends.vo.FriendsVO;
import co.yedam.finalprj.stamph.vo.StamphVO;
import co.yedam.finalprj.users.vo.UsersVO;

public interface UsersService {
	List<UsersVO> usersSelectList();
	UsersVO usersSelect(UsersVO vo);
	int usersInsert(UsersVO vo);
	int usersPhotoInsert(UsersVO vo);
	int usersUpdate(UsersVO vo);
	int usersUpdateNoPhoto(UsersVO vo);
	int usersDelete(UsersVO vo);
	
	//------------------회원가입-------------------
	public int idCheck(String id);
	public int nameCheck(String name);
	public int emailCheck(String email);
	
	UsersVO userSelectStmap(String user_id);
	
	//------------------프로필---------------------
	//우표 구매시 보유 우표수 변경...
	public int stampUpdate(UsersVO vo);
	
	//관심사 리스트
	List<UsersVO> myTopicList(UsersVO vo);	

	//방문한 곳
	List<UsersVO> myTripList(UsersVO vo);	
	
	//작성글 카운트
	int postCnt(UsersVO vo);
	
	//팔로잉,팔로워 리스트
	List<UsersVO> followingList(UsersVO vo);
	List<UsersVO> followerList(UsersVO vo);
	
	//프로필 사진
	UsersVO userProfilePhoto(String user_id);
	UsersVO sessionProfilePhoto(UsersVO vo);
	
	//작성글 리스트
	List<Map<String,Object>> usersFeedList(UsersVO vo);
	
	//-----------------로그인 로그아웃---------------
	public UsersVO loginCheck(UsersVO vo);
	public void logout(HttpSession session);
	
	//아이디 비밀번호 찾기...
	UsersVO findId(String email);
	int findPwUpdate(UsersVO vo);
	
	
	//-----------------관리자-----------------------
	int adminUsersUpdate(UsersVO vo);
	List<UsersVO> adminUsersSelectList();
	//-----------------신고-----------------------
	int reportUpdatePlus(UsersVO vo);
	int reportUpdateMinus(UsersVO vo);
	
	
}
