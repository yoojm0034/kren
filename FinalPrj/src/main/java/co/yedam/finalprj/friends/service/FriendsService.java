package co.yedam.finalprj.friends.service;

import java.util.List;

import co.yedam.finalprj.friends.vo.FriendsVO;
import co.yedam.finalprj.users.vo.UsersVO;

public interface FriendsService {
	List<FriendsVO> friendList();	// 친구 목록
	int follow(FriendsVO vo);		// 팔로잉
	int unfollow(FriendsVO vo);		// 언팔로우
	int followCheck(FriendsVO vo);	// 팔로잉 여부 체크
	int followingCnt(FriendsVO vo);	// 팔로잉 카운트
	int followerCnt(FriendsVO vo);	// 팔로워 카운트


	List<UsersVO> searchFriend(UsersVO vo);						 
	List<UsersVO> allUser(UsersVO vo);
	List<UsersVO> newUser(UsersVO vo);


}
