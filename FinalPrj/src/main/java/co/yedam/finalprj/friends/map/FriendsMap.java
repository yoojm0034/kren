package co.yedam.finalprj.friends.map;

import co.yedam.finalprj.friends.vo.FriendsVO;

public interface FriendsMap {
	int follow(FriendsVO vo);
	int unfollow(FriendsVO vo);
	int followCheck(FriendsVO vo);
	int followingCnt(FriendsVO vo);
	int followerCnt(FriendsVO vo);
}
