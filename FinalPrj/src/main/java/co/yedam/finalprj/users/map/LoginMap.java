package co.yedam.finalprj.users.map;

import java.util.List;

import javax.servlet.http.HttpSession;

import co.yedam.finalprj.users.vo.UsersVO;

public interface LoginMap {
	List<UsersVO> usersSelectList();
	UsersVO usersSelect(UsersVO vo);
	int usersInsert(UsersVO vo);
	int usersUpdate(UsersVO vo);
	int usersDelete(UsersVO vo);
	
	//login
	int loginCheck(UsersVO vo);
		
	//logout
	public void logout(HttpSession session);
	
	//아이디 비밀번호 찾기...
	public void findId(UsersVO vo);
	public void findPw(UsersVO vo);
	
	//우표 구매시 보유 우표수 변경...
	public int stampUpdate(UsersVO vo);
	
}