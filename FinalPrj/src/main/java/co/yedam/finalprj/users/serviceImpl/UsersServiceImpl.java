package co.yedam.finalprj.users.serviceImpl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.yedam.finalprj.friends.vo.FriendsVO;
import co.yedam.finalprj.users.map.LoginMap;
import co.yedam.finalprj.users.map.UsersMap;
import co.yedam.finalprj.users.service.UsersService;
import co.yedam.finalprj.users.vo.UsersVO;

@Service
public class UsersServiceImpl implements UsersService {
	@Autowired UsersMap map;
	@Autowired LoginMap loginmap;
	
	@Override
	public List<UsersVO> usersSelectList() {
		return map.usersSelectList();
	}

	@Override
	public UsersVO usersSelect(UsersVO vo) {
		return map.usersSelect(vo);
	}

	@Override
	public int usersInsert(UsersVO vo) {
		return map.usersInsert(vo);
	}

	@Override
	public int usersUpdate(UsersVO vo) {
		return 0;
	}

	@Override
	public int usersDelete(UsersVO vo) {
		return 0;
	}
	
	//admin user update
	@Override
	public int adminUsersUpdate(UsersVO vo) {
		return map.adminUsersUpdate(vo);
	}
	//admin user selectList
	@Override
	public List<UsersVO> adminUsersSelectList() {
		return map.adminUsersSelectList();
	}
	
	//로그인체크...
	@Override
	public int loginCheck(UsersVO vo) {
		return loginmap.loginCheck(vo);
	}
	
	//로그아웃...
	@Override
	public void logout(HttpSession session) {
		
	}

	//아이디 비밀번호 찾기...
	@Override
	public String findId(String email) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void findPw(UsersVO vo) {
		
	}

	@Override
	public UsersVO idCheck(String id) {
		return map.idCheck(id);
	}

	@Override
	public UsersVO nameCheck(String name) {
		return map.nameCheck(name);
	}

	@Override
	public UsersVO emailCheck(String email) {
		return map.emailCheck(email);
	}

	@Override
	public int stampUpdate(UsersVO vo) {
		return loginmap.stampUpdate(vo);
		
	}

	@Override
	public List<UsersVO> myTopicList(UsersVO vo) {
		return map.myTopicList(vo);
	}

	@Override
	public List<UsersVO> myTripList(UsersVO vo) {
		return map.myTripList(vo);
	}

	@Override
	public int postCnt(UsersVO vo) {
		return map.postCnt(vo);
	}

	@Override
	public List<UsersVO> followingList(UsersVO vo) {
		return map.followingList(vo);
	}

	@Override
	public List<UsersVO> followerList(UsersVO vo) {
		return map.followerList(vo);
	}

}
