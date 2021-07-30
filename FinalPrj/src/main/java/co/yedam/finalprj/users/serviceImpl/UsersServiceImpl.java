package co.yedam.finalprj.users.serviceImpl;

import java.util.List;

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
		// TODO Auto-generated method stub
		return map.usersSelect(vo);
	}

	@Override
	public int usersInsert(UsersVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int usersUpdate(UsersVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int usersDelete(UsersVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}
	//admin user update
	@Override
	public int adminUsersUpdate(UsersVO vo) {
		// TODO Auto-generated method stub
		return map.adminUsersUpdate(vo);
	}
	//admin user selectList
	@Override
	public List<UsersVO> adminUsersSelectList() {
		// TODO Auto-generated method stub
		return map.adminUsersSelectList();
	}
	
	//로그인체크...
	@Override
	public int loginCheck(UsersVO vo) {
		// TODO Auto-generated method stub
		return loginmap.loginCheck(vo);
	}
	
	//로그아웃...
	@Override
	public void logout(HttpSession session) {
		// TODO Auto-generated method stub
		
	}

	//아이디 비밀번호 찾기...
	@Override
	public void findId(UsersVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void findPw(UsersVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public UsersVO idCheck(String id) {
		return map.idCheck(id);
	}

	@Override
	public UsersVO nameCheck(String name) {
		// TODO Auto-generated method stub
		return map.nameCheck(name);
	}

	@Override
	public UsersVO emailCheck(String email) {
		// TODO Auto-generated method stub
		return map.emailCheck(email);
	}

}
