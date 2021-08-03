package co.yedam.finalprj.users.map;

import java.util.List;

import javax.servlet.http.HttpSession;

import co.yedam.finalprj.users.vo.UsersVO;

public interface UsersMap {
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

	
}