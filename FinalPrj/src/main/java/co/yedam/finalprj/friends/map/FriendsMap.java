package co.yedam.finalprj.friends.map;

import co.yedam.finalprj.users.vo.UsersVO;

public interface FriendsMap {
	int follow(UsersVO vo);
	int unfollow(UsersVO vo);
	
}
