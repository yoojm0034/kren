package co.yedam.finalprj.users.serviceImpl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
		return map.usersUpdate(vo);
	}

	@Override
	public int usersDelete(UsersVO vo) {
		return map.usersDelete(vo);
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

	@Override
	public int idCheck(String id) {
		return map.idCheck(id);
	}

	@Override
	public int nameCheck(String name) {
		return map.nameCheck(name);
	}

	@Override
	public int emailCheck(String email) {
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

	@Override
	public int reportUpdatePlus(UsersVO vo) {
		// TODO Auto-generated method stub
		return loginmap.reportUpdatePlus(vo);
	}

	@Override
	public int reportUpdateMinus(UsersVO vo) {
		// TODO Auto-generated method stub
		return loginmap.reportUpdateMinus(vo);
	}

	//아이디, 비밀번호 찾기
	@Override
	public UsersVO findId(String email) {
		// TODO Auto-generated method stub
		return loginmap.findId(email);
	}

	@Override
	public int findPwUpdate(UsersVO vo) {
		// TODO Auto-generated method stub
		return loginmap.findPwUpdate(vo);
	}

	@Override
	public int usersPhotoInsert(UsersVO vo) {
		// TODO Auto-generated method stub
		return map.usersPhotoInsert(vo);
	}

	@Override
	public UsersVO userProfilePhoto(UsersVO vo) {
		return map.userProfilePhoto(vo);
	}

	@Override
	public UsersVO sessionProfilePhoto(UsersVO vo) {
		return loginmap.sessionProfilePhoto(vo);
	}

	@Override
	public UsersVO userSelectStmap(String user_id) {
		return loginmap.userSelectStmap(user_id);
	}

	@Override
	public List<Map<String, Object>> usersFeedList(UsersVO vo) {
		return map.usersFeedList(vo);
	}

}
