package co.yedam.finalprj.friends.service;

import java.util.List;

import co.yedam.finalprj.friends.vo.FriendsVO;
import co.yedam.finalprj.users.vo.UsersVO;

public interface FriendsService {
	List<FriendsVO> friendList();	//친구 목록
	int follow(FriendsVO vo);
	int unfollow(FriendsVO vo);

}
