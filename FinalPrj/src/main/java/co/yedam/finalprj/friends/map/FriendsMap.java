package co.yedam.finalprj.friends.map;

import java.util.List;

import co.yedam.finalprj.friends.vo.FriendsVO;
import co.yedam.finalprj.users.vo.UsersVO;

public interface FriendsMap {
	int follow(FriendsVO vo);
	int unfollow(FriendsVO vo);
	int followCheck(FriendsVO vo);
	int followingCnt(FriendsVO vo);
	int followerCnt(FriendsVO vo);
	

	List<UsersVO> searchFriend(UsersVO vo);					
	List<UsersVO> allUser(UsersVO vo);
	List<UsersVO> newUser(UsersVO vo);


}
