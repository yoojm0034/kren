package co.yedam.finalprj.users.map;

import java.util.List;

import co.yedam.finalprj.users.vo.UsersVO;

public interface UsersMap {
	List<UsersVO> usersSelectList();
	UsersVO usersSelect(UsersVO vo);
	int usersInsert(UsersVO vo);
	int usersPhotoInsert(UsersVO vo);
	int usersUpdate(UsersVO vo);
	int usersDelete(UsersVO vo);
	
	//회원가입
	public int idCheck(String id);
	public int nameCheck(String name);
	public int emailCheck(String email);
	
	//프로필
	List<UsersVO> myTopicList(UsersVO vo);	
	List<UsersVO> myTripList(UsersVO vo);	
	int postCnt(UsersVO vo);
	List<UsersVO> followingList(UsersVO vo);
	List<UsersVO> followerList(UsersVO vo);
	UsersVO userProfilePhoto(UsersVO vo);

	//admin
	int adminUsersUpdate(UsersVO vo);
	List<UsersVO> adminUsersSelectList();

	
}