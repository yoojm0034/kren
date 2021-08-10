package co.yedam.finalprj.friends.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.yedam.finalprj.friends.map.FriendsMap;
import co.yedam.finalprj.friends.service.FriendsService;
import co.yedam.finalprj.friends.vo.FriendsVO;
import co.yedam.finalprj.users.vo.UsersVO;

@Service
public class FriendsServiceImpl implements FriendsService {
	
	@Autowired FriendsMap map;

	@Override
	public List<FriendsVO> friendList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int follow(FriendsVO vo) {
		return map.follow(vo);
	}

	@Override
	public int unfollow(FriendsVO vo) {
		return map.unfollow(vo);
	}

	@Override
	public int followCheck(FriendsVO vo) {
		int r = map.followCheck(vo);
		return r;
	}

	@Override
	public int followingCnt(FriendsVO vo) {
		return map.followingCnt(vo);
	}
	@Override
	public int followerCnt(FriendsVO vo) {
		return map.followerCnt(vo);
	}
	@Override
	public List<UsersVO> searchFriend(UsersVO vo) {
		System.out.println("안녕"+map.searchFriend(vo));
		return map.searchFriend(vo);
	}
	@Override
	public List<UsersVO> allUser(UsersVO vo) {
		return map.allUser(vo);
	}
	@Override
	public List<UsersVO> newUser(UsersVO vo) {
		return map.newUser(vo);
	}

}
