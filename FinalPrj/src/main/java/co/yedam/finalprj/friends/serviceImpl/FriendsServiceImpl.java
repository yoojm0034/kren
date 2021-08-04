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
	public int follow(UsersVO vo) {
		return map.follow(vo);
	}

	@Override
	public int unfollow(UsersVO vo) {
		return map.unfollow(vo);
	}

}
