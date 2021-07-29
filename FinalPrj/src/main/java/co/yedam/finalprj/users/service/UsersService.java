package co.yedam.finalprj.users.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import co.yedam.finalprj.users.vo.UsersVO;

public interface UsersService {
	List<UsersVO> usersSelectList();
	UsersVO usersSelect(UsersVO vo);
	int usersInsert(UsersVO vo);
	int usersUpdate(UsersVO vo);
	int usersDelete(UsersVO vo);
	
	//회원가입
	public UsersVO idCheck(String id);
	public UsersVO nameCheck(String name);
	public UsersVO emailCheck(String email);
	
	//admin
	int adminUsersUpdate(UsersVO vo);
	List<UsersVO> adminUsersSelectList();
	
	//login
	public boolean loginCheck(UsersVO vo);
	
	//logout
	public void logout(HttpSession session);
}
